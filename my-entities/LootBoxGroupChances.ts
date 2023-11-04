import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'loot_box_group_chances' })
export class LootBoxGroupChances {

  @Property()
  id!: number;

  @Property({ length: 32 })
  group_name!: string;

  @Property({ columnType: 'real' })
  chance!: number;

  @Property({ nullable: true })
  loot_box_id?: number;

}
