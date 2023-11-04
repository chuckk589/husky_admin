import { Entity, OptionalProps, Property } from '@mikro-orm/core';

@Entity({ tableName: 'consumables' })
export class Consumables {

  [OptionalProps]?: 'only_characters' | 'use_count' | 'value';

  @Property()
  id!: number;

  @Property()
  group!: number;

  @Property({ length: 128 })
  name!: string;

  @Property({ length: 64 })
  icon!: string;

  @Property({ length: 255 })
  description!: string;

  @Property({ length: 32 })
  use_type!: string;

  @Property()
  max_count!: number;

  @Property({ default: 1 })
  use_count: number = 1;

  @Property({ nullable: true })
  buff_id?: number;

  @Property({ columnType: 'double precision', default: '0' })
  value!: string;

  @Property({ default: false })
  only_characters: boolean = false;

}
