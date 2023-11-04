import { Entity, OptionalProps, Property } from '@mikro-orm/core';

@Entity({ tableName: 'dialogs' })
export class Dialogs {

  [OptionalProps]?: 'messages';

  @Property()
  id!: number;

  @Property({ columnType: 'jsonb', default: '[]' })
  messages!: any;

}
