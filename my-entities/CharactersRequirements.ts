import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'characters_requirements' })
export class CharactersRequirements {

  @Property()
  id!: number;

  @Property()
  book_row!: number;

  @Property()
  furniture_id!: number;

  @Property()
  furniture_group!: number;

  @Property({ nullable: true })
  character_id?: number;

}
