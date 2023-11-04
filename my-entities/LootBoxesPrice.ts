import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'loot_boxes_price' })
export class LootBoxesPrice {

  @Property()
  id!: number;

  @Property()
  bought_count!: number;

  @Property()
  price!: number;

}
