import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'raid_cells' })
export class RaidCells {

  @Property()
  id!: number;

  @Property()
  cells_count!: number;

  @Property()
  prestige!: number;

}
