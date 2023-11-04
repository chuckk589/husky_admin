import { Entity, Enum, PrimaryKey, Property, Unique } from '@mikro-orm/core';

export enum ConfigType {
  DEFAULT = 'DEFAULT',
  PASSWORD = 'PASSWORD',
}
@Entity()
export class Config {
  @PrimaryKey()
  id!: number;

  @Unique()
  @Property({ length: 255, nullable: true })
  name?: string;

  @Property({ length: 512, nullable: true })
  value?: string;

  @Property({ length: 255, nullable: true })
  description?: string;

  @Enum({ items: () => ConfigType, default: ConfigType.DEFAULT })
  type = ConfigType.DEFAULT;
}
