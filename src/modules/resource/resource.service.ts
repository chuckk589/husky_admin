import { HttpException, Inject, Injectable } from '@nestjs/common';
import { CloneResourceDto, ResourceDto, ResourcePopulated, RetrieveResourceDto } from './dto/resource.dto';
import { EntityManager } from '@mikro-orm/mysql';
import { AJVPROVIDER, PG_CONNECTION } from 'src/constants';
import { PostgresDatabaseProvider } from '../providers/PGConnection';
import { AjvValidator } from '../providers/ajv';

@Injectable()
export class ResourceService {
  constructor(private readonly em: EntityManager, @Inject(PG_CONNECTION) private db: PostgresDatabaseProvider, @Inject(AJVPROVIDER) private ajv: AjvValidator) {}

  async clone(cloneResourceDto: CloneResourceDto) {
    try {
      //no validation for now
      const { _model, ...rest } = cloneResourceDto;

      //insert all entities
      let query = '';
      for (const entity of rest.entities) {
        const { id, ...clean } = entity;
        query += `INSERT INTO ${_model} (${Object.keys(clean)
          .map((key) => `"${key}"`)
          .join(',')}) VALUES (${Object.keys(clean)
          .map((key) => ([null, ''].includes(clean[key]) ? `NULL` : `'${clean[key]}'`))
          .join(',')}) RETURNING *;`;
      }
      let res = await this.db.client.query(query);
      if (!Array.isArray(res)) {
        res = [res];
      }
      return res.map((entity: any) => new RetrieveResourceDto({ id: entity.rows[0].id, ...entity.rows[0] }));
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 400);
    }
  }
  async findModels() {
    try {
      // const models = await this.db.client.query(`SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE'`);
      // return models.rows.map((row: any) => row.table_name);
      return [
        'achievments',
        'actions',
        'buffs',
        'characters',
        'character_duplicate_fines',
        'character_levels',
        'character_perks',
        'characters_requirements',
        'constants',
        'consumables',
        'dialogs',
        'floors',
        'furnitures',
        'groups_tiles',
        'loot_boxes',
        'loot_box_group_chances',
        'loot_box_items',
        'loot_boxes_price',
        'max_by_group_tiles',
        'character_puzzle_chances',
        'furniture_puzzle_chances',
        'raid_cells',
        'raid_count_items',
        'raid_locations',
        'things',
        'unique_action_relations',
        'unique_actions_chains',
      ];
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 400);
    }
  }

  async remove(ids: number[], removeResourceDto: ResourceDto) {
    try {
      await this.db.client.query(`DELETE FROM ${removeResourceDto._model} WHERE id IN (${ids.join(',')})`);
      return ids;
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 400);
    }
  }
  async create(createResourceDto: ResourceDto) {
    try {
      const { _model, ...rest } = createResourceDto;

      this.ajv.validate(createResourceDto._model, createResourceDto);
      const query =
        `INSERT INTO ${_model} ` +
        `(${Object.keys(rest)
          .map((key) => `"${key}"`)
          .join(',')}) VALUES (${Object.keys(rest)
          .map((key) => ([null, ''].includes(rest[key]) ? `NULL` : `'${rest[key]}'`))
          .join(',')}) RETURNING *`;
      // console.log(query);

      const res = await this.db.client.query(query);

      return new RetrieveResourceDto({ id: res.rows[0].id, ...rest });
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 400);
    }
  }
  async update(id: number, updateResourceDto: ResourceDto) {
    try {
      const { _model, ...rest } = updateResourceDto;

      this.ajv.validate(updateResourceDto._model, updateResourceDto);

      const query =
        `UPDATE ${_model} SET ` +
        Object.keys(rest)
          .map((key) => ([null, ''].includes(rest[key]) ? `"${key}"=NULL` : `"${key}"='${rest[key]}'`))
          .join(',') +
        ` WHERE id=${id}`;
      // console.log(query);

      await this.db.client.query(query);

      return new RetrieveResourceDto({ id, ...rest });
    } catch (error) {
      throw new HttpException({ message: error.message || error }, 400);
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
