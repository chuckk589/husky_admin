import { Entity, OptionalProps, Property } from '@mikro-orm/core';

@Entity({ tableName: 'furnitures' })
export class Furnitures {

  [OptionalProps]?: 'is_wall_object';

  @Property()
  id!: number;

  @Property({ length: 128 })
  name!: string;

  @Property()
  category!: number;

  @Property({ length: 255 })
  description!: string;

  @Property({ length: 64 })
  promo_image!: string;

  @Property({ length: 64 })
  icon!: string;

  @Property({ length: 64 })
  model!: string;

  @Property()
  occupy!: boolean;

  @Property({ default: false })
  is_wall_object: boolean = false;

  @Property({ columnType: 'jsonb' })
  rules!: any;

  @Property()
  prestige!: number;

  @Property()
  optimal_requirement!: number;

  @Property()
  max_requirement!: number;

  @Property({ columnType: 'jsonb' })
  size!: any;

}
