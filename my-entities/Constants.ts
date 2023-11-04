import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'constants' })
export class Constants {

  @Property()
  id!: number;

  @Property({ length: 64 })
  key!: string;

  @Property({ length: 64 })
  type!: string;

  @Property({ nullable: true })
  num_value?: number;

  @Property({ length: 128, nullable: true })
  str_value?: string;

  @Property({ columnType: 'double precision', nullable: true })
  flt_value?: string;

  @Property({ columnType: 'jsonb', nullable: true })
  arr_value?: any;

}
