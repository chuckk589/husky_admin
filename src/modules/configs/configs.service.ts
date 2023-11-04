import { RetrieveConfigDto } from './dto/retrieve-config.dto';
import { EntityManager } from '@mikro-orm/core';
import { Injectable } from '@nestjs/common';
import { Config } from '../mikroorm/entities/Config';
import fs from 'fs';
import { UpdateConfigDto } from './dto/update-config.dto';
import { UpdateMetaDto } from './dto/update-meta.dto';

@Injectable()
export class ConfigsService {
  constructor(private readonly em: EntityManager) {}

  async updateMeta(updateMetaDto: UpdateMetaDto) {
    fs.writeFileSync('./dist/public/meta.json', JSON.stringify(updateMetaDto));
    return updateMetaDto;
  }

  async findMeta() {
    return JSON.parse(fs.readFileSync('./dist/public/meta.json', 'utf8'));
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
