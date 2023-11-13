import { RetrieveSchemaDto } from './dto/retrieve-schema.dto';
import { RetrieveConfigDto } from './dto/retrieve-config.dto';
import { EntityManager } from '@mikro-orm/core';
import { HttpException, Injectable } from '@nestjs/common';
import { Config } from '../mikroorm/entities/Config';
import fs from 'fs';
import { UpdateConfigDto } from './dto/update-config.dto';
import { UpdateMetaDto } from './dto/update-meta.dto';

@Injectable()
export class ConfigsService {
  constructor(private readonly em: EntityManager) {}

  async updateMeta(updateMetaDto: UpdateMetaDto): Promise<RetrieveSchemaDto> {
    const schema: { [key: string]: RetrieveSchemaDto } = JSON.parse(fs.readFileSync('./dist/public/schema.json', 'utf8'));
    if (!schema[updateMetaDto._model]) throw new HttpException({ message: 'Schema doesnt exist' }, 404);
    //update schema
    schema[updateMetaDto._model].alias = updateMetaDto.schema.alias;
    schema[updateMetaDto._model].description = updateMetaDto.schema.description;
    schema[updateMetaDto._model].formatter = updateMetaDto.schema.formatter;

    for (const prop in schema[updateMetaDto._model].properties) {
      schema[updateMetaDto._model].properties[prop].comment = updateMetaDto.schema.properties[prop].comment;
    }
    fs.writeFileSync('./dist/public/schema.json', JSON.stringify(schema));
    return updateMetaDto.schema;
  }

  findMeta(): { [key: string]: RetrieveSchemaDto } {
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
