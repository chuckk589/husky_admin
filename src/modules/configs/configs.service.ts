import { RetrieveConfigDto } from './dto/retrieve-config.dto';
import { EntityManager } from '@mikro-orm/core';
import { HttpException, Injectable } from '@nestjs/common';
import { Config } from '../mikroorm/entities/Config';
import fs from 'fs';
import { UpdateConfigDto } from './dto/update-config.dto';
import { Schema, UpdateMetaDto } from './dto/update-meta.dto';

@Injectable()
export class ConfigsService {
  constructor(private readonly em: EntityManager) {}

  async updateMeta(updateMetaDto: UpdateMetaDto) {
    const schema: Schema[] = JSON.parse(fs.readFileSync('./dist/public/schema.json', 'utf8'));
    const schemas = Array.isArray(updateMetaDto.schema) ? updateMetaDto.schema : [updateMetaDto.schema];
    for (const update of schemas) {
      const index = schema.findIndex((item) => item.title === update.title);
      if (index !== -1) {
        schema[index] = update;
      } else {
        throw new HttpException({ message: 'Schema not found' }, 404);
      }
    }
    fs.writeFileSync('./dist/public/schema.json', JSON.stringify(schema));
    return updateMetaDto;
  }

  async findMeta() {
    return JSON.parse(fs.readFileSync('./dist/public/schema.json', 'utf8'));
  }

  async findAll(): Promise<RetrieveConfigDto[]> {
    const configs = await this.em.find(Config, {});
    return configs.map((config) => new RetrieveConfigDto(config));
  }

  async update(id: number, updateConfigDto: UpdateConfigDto) {
    const config = await this.em.findOneOrFail(Config, id);
    updateConfigDto.value && (config.value = updateConfigDto.value);
    updateConfigDto.description && (config.description = updateConfigDto.description);
    await this.em.persistAndFlush(config);
    return config;
  }
}
