import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'loot_box_items' })
export class LootBoxItems {

  @Property()
  id!: number;

  @Property({ length: 32 })
  group_name!: string;

  @Property()
  config_id!: number;

  @Property({ columnType: 'real' })
  chance!: number;

  @Property()
  count!: number;

  @Property({ nullable: true })
  loot_box_id?: number;

}
