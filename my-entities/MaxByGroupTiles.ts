import { Entity, OptionalProps, Property } from '@mikro-orm/core';

@Entity({ tableName: 'max_by_group_tiles' })
export class MaxByGroupTiles {

  [OptionalProps]?: 'max_friends';

  @Property()
  id!: number;

  @Property()
  count_group_tiles!: number;

  @Property()
  max_prestige!: number;

  @Property()
  max_soft_currency!: number;

  @Property({ default: 1 })
  max_friends: number = 1;

}
