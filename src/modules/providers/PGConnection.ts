import { EntityManager, MikroORM } from '@mikro-orm/core';
import { Config } from '../mikroorm/entities/Config';
import { Client } from 'pg';
import { DatabaseProvider } from 'src/types/interfaces';
import { Provider } from '@nestjs/common';
import { PG_CONNECTION } from 'src/constants';

export class PostgresDatabaseProvider extends DatabaseProvider {
  constructor(private readonly em: EntityManager) {
    super();
    this.connect().catch((err) => console.error(err));
  }

  public async connect(): Promise<void> {
    try {
      const dbParams = await this.em.find(Config, {});
      this.client = new Client({
        user: dbParams.find((param) => param.name == 'DB_USER')?.value,
        host: dbParams.find((param) => param.name == 'DB_HOST')?.value,
        database: dbParams.find((param) => param.name == 'DB_NAME')?.value,
        password: dbParams.find((param) => param.name == 'DB_PASSWORD')?.value,
        port: parseInt(dbParams.find((param) => param.name == 'DB_PORT')?.value),
      });

      return await this.client.connect();
    } catch (error) {
      return error;
    }
  }
}

export const PGConnectionProvider: Provider = {
  provide: PG_CONNECTION,
  useFactory: async (orm: MikroORM) => {
    const myService = new PostgresDatabaseProvider(orm.em);
    await myService.connect();
    return myService;
  },
  inject: [MikroORM],
};
