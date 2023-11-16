import { EntityManager, MikroORM } from '@mikro-orm/core';
import { Config } from '../mikroorm/entities/Config';
import { Client } from 'pg';
import { DatabaseProvider } from 'src/types/interfaces';
import { Provider } from '@nestjs/common';
import { PG_CONNECTION } from 'src/constants';

export class PostgresDatabaseProvider extends DatabaseProvider {
  constructor(private readonly em: EntityManager) {
    super();
  }

  public async connect(): Promise<void> {
    try {
      const dbParams = await this.em.find(Config, {});
      this.client = new Client({
        user: dbParams.find((param) => param.name == 'DB_PGUSER')?.value,
        host: dbParams.find((param) => param.name == 'DB_PGHOST')?.value,
        database: dbParams.find((param) => param.name == 'DB_PGNAME')?.value,
        password: dbParams.find((param) => param.name == 'DB_PGPASSWORD')?.value,
        port: parseInt(dbParams.find((param) => param.name == 'DB_PGPORT')?.value),
      });

      return await this.client.connect((err: any) => {
        if (err) {
          console.error(`PG connection wasnt established: ${err.message}`);
        }
      });
    } catch (error) {
      console.error(error);
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
