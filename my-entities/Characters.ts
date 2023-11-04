import { Entity, OptionalProps, Property } from '@mikro-orm/core';

@Entity({ tableName: 'characters' })
export class Characters {

  [OptionalProps]?: 'can_be_starter';

  @Property()
  id!: number;

  @Property({ length: 64 })
  template_name!: string;

  @Property()
  group!: number;

  @Property({ length: 64 })
  promo_image!: string;

  @Property({ length: 64 })
  avatar!: string;

  @Property({ length: 64 })
  model!: string;

  @Property({ columnType: 'jsonb' })
  actions!: any;

  @Property({ columnType: 'jsonb' })
  friends!: any;

  @Property({ columnType: 'jsonb' })
  things!: any;

  @Property({ columnType: 'jsonb' })
  perks!: any;

  @Property({ default: false })
  can_be_starter: boolean = false;

}
