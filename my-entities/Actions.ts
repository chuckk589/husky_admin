import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'actions' })
export class Actions {

  @Property()
  id!: number;

  @Property({ length: 128 })
  name!: string;

  @Property()
  group!: number;

  @Property()
  animation_id!: number;

  @Property({ columnType: 'jsonb' })
  rules!: any;

  @Property()
  min_time!: number;

  @Property()
  max_time!: number;

  @Property()
  unique!: boolean;

  @Property({ columnType: 'jsonb' })
  condition_ids!: any;

}
