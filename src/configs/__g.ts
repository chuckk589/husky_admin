import { AbstractNamingStrategy, MikroORM } from '@mikro-orm/core';
(async () => {
  const orm = await MikroORM.init({
    type: 'postgresql',
    allowGlobalContext: true,
    ...(process.env.NODE_ENV === 'dev' ? { debug: true, logger: console.log.bind(console) } : {}),
    entities: ['./dist/modules/mikroorm/entities/'],
    entitiesTs: ['./src/modules/mikroorm/entities/'],
    clientUrl: 'postgres://postgres@localhost:5432/postgres',
    discovery: {
      warnWhenNoEntities: false, // by default, discovery throws when no entity is processed
      requireEntitiesArray: false, // force usage of class refrences in `entities` instead of paths
      alwaysAnalyseProperties: false, // do not analyse properties when not needed (with ts-morph)
    },
    namingStrategy: class CustomNamingStrategy extends AbstractNamingStrategy {
      classToTableName(entityName: string) {
        return entityName;
      }
      joinColumnName(propertyName: string) {
        return propertyName;
      }
      joinKeyColumnName(entityName: string, referencedColumnName: string) {
        return entityName + '_' + referencedColumnName;
      }
      joinTableName(sourceEntity: string, targetEntity: string, propertyName: string) {
        return sourceEntity + '_' + propertyName.replace(/\./gi, '_') + '_' + targetEntity;
      }
      columnNameToProperty(columnName: string): string {
        return columnName;
      }
      propertyToColumnName(propertyName: string) {
        return propertyName;
      }
      referenceColumnName() {
        return 'id';
      }
    },
  });
  const generator = orm.getEntityGenerator();
  const dump = await generator.generate({
    save: true,
    baseDir: process.cwd() + '/my-entities',
  });
  console.log(dump);
  await orm.close(true);
})();
