import { EntityManager } from '@mikro-orm/core';
import { Seeder } from '@mikro-orm/seeder';
import { Config, ConfigType } from '../entities/Config';

export class ConfigSeeder extends Seeder {
  async run(em: EntityManager): Promise<void> {
    em.create(Config, {
      name: 'ADMIN_PASSCODE',
      value: '$2a$12$rok.MCu02SSWKkSuTRhwdudPl4N6QQl0sRRBf1vyTaxLiw14TwR6i',
      description: 'Пароль администратора',
      type: ConfigType.PASSWORD,
    });

    em.create(Config, {
      name: 'DB_HOST',
      value: 'localhost',
    });
    em.create(Config, {
      name: 'DB_PORT',
      value: '5432',
    });
    em.create(Config, {
      name: 'DB_NAME',
      value: 'postgres',
    });
    em.create(Config, {
      name: 'DB_USER',
      value: 'postgres',
    });
    em.create(Config, {
      name: 'DB_PASSWORD',
      value: 'postgres',
      type: ConfigType.PASSWORD,
    });
  }
}
