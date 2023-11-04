import { Entity, OptionalProps, Property } from '@mikro-orm/core';

@Entity({ tableName: 'unique_action_relations' })
export class UniqueActionRelations {

  [OptionalProps]?: 'is_start';

  @Property()
  id!: number;

  @Property({ nullable: true })
  first_character_id?: number;

  @Property({ nullable: true })
  second_character_id?: number;

  @Property({ default: false })
  is_start: boolean = false;

  @Property({ nullable: true })
  chain_id?: number;

  @Property({ nullable: true })
  action_id?: number;

  @Property({ nullable: true })
  dialog_id?: number;

  @Property({ nullable: true })
  achievment_id?: number;

  @Property({ nullable: true })
  next_action_id?: number;

}
