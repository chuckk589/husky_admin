import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'groups_tiles' })
export class GroupsTiles {

  @Property()
  id!: number;

  @Property({ columnType: 'jsonb' })
  size!: any;

  @Property({ columnType: 'jsonb' })
  position!: any;

  @Property()
  cost!: number;

  @Property({ columnType: 'jsonb' })
  previous!: any;

  @Property()
  sector!: number;

  @Property()
  is_start!: boolean;

}
