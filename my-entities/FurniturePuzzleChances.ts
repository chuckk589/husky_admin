import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'furniture_puzzle_chances' })
export class FurniturePuzzleChances {

  @Property()
  id!: number;

  @Property({ columnType: 'real' })
  chance!: number;

  @Property({ nullable: true })
  furniture_id?: number;

}
