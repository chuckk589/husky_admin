import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'floors' })
export class Floors {

  @Property()
  id!: number;

  @Property()
  x-size!: number;

  @Property()
  y-size!: number;

}
