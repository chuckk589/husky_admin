import { Entity, OptionalProps, Property } from '@mikro-orm/core';

@Entity({ tableName: 'character_levels' })
export class CharacterLevels {

  [OptionalProps]?: 'efficiency_for_level' | 'price';

  @Property()
  id!: number;

  @Property()
  level!: number;

  @Property()
  from_exp!: number;

  @Property({ default: 100 })
  price: number = 100;

  @Property({ columnType: 'real', default: NaN })
  efficiency_for_level: number = NaN;

}
