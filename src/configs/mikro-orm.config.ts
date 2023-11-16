import { MikroOrmModuleOptions } from '@mikro-orm/nestjs';
import 'dotenv/config';

const MikroORMOptions: MikroOrmModuleOptions = {
  type: 'mysql',
  allowGlobalContext: true,
  ...(process.env.NODE_ENV === 'dev' ? { debug: true, logger: console.log.bind(console) } : {}),
  entities: ['./dist/modules/mikroorm/entities/'],
  entitiesTs: ['./src/modules/mikroorm/entities/'],
  clientUrl: process.env.NODE_ENV === 'dev' ? `mysql://root@localhost:3306/husky` : `mysql://root:ssqwec@mysqldb:3306/husky`,
  seeder: {
    path: './dist/modules/mikroorm/seeders', // path to the folder with seeders
    pathTs: './src/modules/mikroorm/seeders', // path to the folder with TS seeders (if used, we should put path to compiled files in `path`)
    defaultSeeder: 'ConfigSeeder', // default seeder class name
    glob: '!(*.d).{js,ts}', // how to match seeder files (all .js and .ts files, but not .d.ts)
    emit: 'ts', // seeder generation mode
    fileName: (className: string) => className, // seeder file naming convention
  },
};

export default MikroORMOptions;
