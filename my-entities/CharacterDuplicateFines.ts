import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'character_duplicate_fines' })
export class CharacterDuplicateFines {

  @Property()
  id!: number;

  @Property()
  count_duplicates!: number;

  @Property({ columnType: 'real' })
  fine_percent!: number;

}
