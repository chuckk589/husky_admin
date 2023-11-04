import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'raid_locations' })
export class RaidLocations {

  @Property()
  id!: number;

  @Property({ length: 64 })
  name!: string;

  @Property({ length: 64 })
  icon!: string;

  @Property({ nullable: true })
  loot_box_id?: number;

}
