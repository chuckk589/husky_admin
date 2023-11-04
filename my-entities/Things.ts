import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'things' })
export class Things {

  @Property()
  id!: number;

  @Property()
  group!: number;

  @Property({ length: 128 })
  name!: string;

  @Property({ length: 64 })
  icon!: string;

  @Property({ length: 255 })
  description!: string;

}
