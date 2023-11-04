import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'loot_boxes' })
export class LootBoxes {

  @Property()
  id!: number;

  @Property({ length: 32 })
  type!: string;

  @Property({ length: 64 })
  name!: string;

  @Property({ length: 64 })
  icon!: string;

  @Property()
  min_items!: number;

  @Property()
  max_items!: number;

}
