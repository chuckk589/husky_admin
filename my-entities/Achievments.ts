import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'achievments' })
export class Achievments {

  @Property()
  id!: number;

  @Property({ length: 64 })
  type!: string;

  @Property({ length: 64 })
  name!: string;

  @Property({ length: 255 })
  description!: string;

  @Property({ length: 64 })
  award_key!: string;

  @Property({ length: 64 })
  award_name!: string;

  @Property({ length: 64 })
  icon!: string;

  @Property({ columnType: 'jsonb' })
  actions!: any;

}
