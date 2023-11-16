import { Entity, Enum, PrimaryKey, Property, Unique, BeforeUpdate, EventArgs } from '@mikro-orm/core';
import { hash } from 'bcrypt';

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
  type: ConfigType;

  @BeforeUpdate()
  async beforeUpdate(args: EventArgs<Config>): Promise<void> {
    if (this.name == 'ADMIN_PASSCODE' && args.changeSet.payload.value) {
      this.value = await hash(args.changeSet.payload.value, 6);
    }
  }
}
