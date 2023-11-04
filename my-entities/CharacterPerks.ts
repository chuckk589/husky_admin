import { Entity, OptionalProps, Property } from '@mikro-orm/core';

@Entity({ tableName: 'character_perks' })
export class CharacterPerks {

  [OptionalProps]?: 'value';

  @Property()
  id!: number;

  @Property({ length: 64 })
  name!: string;

  @Property({ length: 64 })
  icon!: string;

  @Property({ length: 64, nullable: true })
  type?: string;

  @Property({ columnType: 'real', default: NaN })
  value: number = NaN;

}
