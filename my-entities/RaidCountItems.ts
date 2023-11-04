import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'raid_count_items' })
export class RaidCountItems {

  @Property()
  id!: number;

  @Property()
  min!: number;

  @Property()
  max!: number;

}
