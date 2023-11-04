import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'character_puzzle_chances' })
export class CharacterPuzzleChances {

  @Property()
  id!: number;

  @Property({ columnType: 'real' })
  chance!: number;

}
