import { HttpException, Inject, Injectable } from '@nestjs/common';
import { CloneResourceDto, DtoFactory, ResourceDto, ResourcePopulated, RetrieveResourceDto } from './dto/resource.dto';
import { EntityManager } from '@mikro-orm/mysql';
import { PG_CONNECTION } from 'src/constants';
import { validate } from 'class-validator';
import { PostgresDatabaseProvider } from '../providers/PGConnection';

@Injectable()
export class ResourceService {
  constructor(private readonly em: EntityManager, @Inject(PG_CONNECTION) private db: PostgresDatabaseProvider) {}

  async clone(cloneResourceDto: CloneResourceDto) {
    try {
      const { model, ...rest } = cloneResourceDto;
      const dtoName = `Create${cloneResourceDto.model
        .split('_')
        .map((c) => c[0].toUpperCase() + c.slice(1))
        .join('')}Dto`;
      await DtoFactory(dtoName, rest.entities);

      //insert all entities
      let query = '';
      for (const entity of rest.entities) {
        const { id, ...clean } = entity;
        query += `INSERT INTO ${model} (${Object.keys(clean)
          .map((key) => `"${key}"`)
          .join(',')}) VALUES (${Object.keys(clean)
          .map((key) => `'${clean[key]}'`)
          .join(',')}) RETURNING *;`;
      }
      let res = await this.db.client.query(query);
      if (!Array.isArray(res)) {
        res = [res];
      }
      return res.map((entity: any) => new RetrieveResourceDto({ id: entity.rows[0].id, ...entity.rows[0] }));
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 500);
    }
  }
  async findModels() {
    try {
      const models = await this.db.client.query(`SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE'`);
      return models.rows.map((row: any) => row.table_name);
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 500);
    }
  }

  async remove(ids: number[], removeResourceDto: ResourceDto) {
    try {
      await this.db.client.query(`DELETE FROM ${removeResourceDto.model} WHERE id IN (${ids.join(',')})`);
      return ids;
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 500);
    }
  }
  async create(createResourceDto: ResourceDto) {
    try {
      const { model, ...rest } = createResourceDto;
      const dtoName = `Create${createResourceDto.model
        .split('_')
        .map((c) => c[0].toUpperCase() + c.slice(1))
        .join('')}Dto`;

      await DtoFactory(dtoName, [rest]);

      const res = await this.db.client.query(
        `INSERT INTO ${model} (${Object.keys(rest)
          .map((key) => `"${key}"`)
          .join(',')}) VALUES (${Object.keys(rest)
          .map((key) => `'${rest[key]}'`)
          .join(',')}) RETURNING id`,
      );
      return new RetrieveResourceDto({ id: res.rows[0].id, ...rest });
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 500);
    }
  }
  async update(id: number, updateResourceDto: ResourceDto) {
    try {
      const { model, ...rest } = updateResourceDto;
      const dtoName = `Update${updateResourceDto.model
        .split('_')
        .map((c) => c[0].toUpperCase() + c.slice(1))
        .join('')}Dto`;
      await DtoFactory(dtoName, [rest]);

      await this.db.client.query(
        `UPDATE ${model} SET ${Object.keys(rest)
          .map((key) => `"${key}"='${rest[key]}'`)
          .join(',')} WHERE id=${id}`,
      );
      return new RetrieveResourceDto({ id, ...rest });
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 500);
    }
  }
  async findAll(model: string): Promise<ResourcePopulated> {
    //select relations
    const relations = await this.db.client.query(
      `SELECT tc.constraint_name, tc.table_name, string_agg(distinct kcu.column_name, ', ') AS column_names, ccu.table_name AS foreign_table_name, string_agg(distinct ccu.column_name, ', ') AS foreign_column_names FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name = '${model}' GROUP BY 1, 2, 4`,
    );
    const result: ResourcePopulated = { entities: [], relations: {} };
    const queries = relations?.rows.reduce((acc: any[], row: any) => {
      acc.push({ model: row.foreign_table_name, column_name: row.column_names, query: `select * from ${row.foreign_table_name}` });
      return acc;
    }, []);
    result.entities = (await this.db.client.query(`select * from ${model}`)).rows?.map((row: any) => new RetrieveResourceDto(row));
    for (const query of queries) {
      const rows = await this.db.client.query(query.query);
      result.relations[query.column_name] = { entities: rows.rows?.map((row: any) => new RetrieveResourceDto(row)), table_name: query.model };
    }
    return result;
  }
}