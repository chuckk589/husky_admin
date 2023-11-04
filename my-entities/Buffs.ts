import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'buffs' })
export class Buffs {

  @Property()
  id!: number;

  @Property()
  group!: number;

  @Property({ length: 64 })
  type!: string;

  @Property()
  positive!: boolean;

  @Property()
  multiply!: number;

  @Property({ length: 64 })
  name!: string;

  @Property({ length: 64 })
  icon!: string;

  @Property({ length: 256 })
  description!: string;

  @Property({ length: 128 })
  metadata!: string;

}
