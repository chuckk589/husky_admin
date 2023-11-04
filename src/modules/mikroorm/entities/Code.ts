import { Collection, Entity, Enum, ManyToOne, OneToMany, OneToOne, PrimaryKey, Property, Unique } from '@mikro-orm/core';
import { CustomBaseEntity } from './CustomBaseEntity';

export enum CodeStatus {
  ACTIVE = 'active',
  DISABLED = 'disabled',
  USED = 'used',
}

@Entity()
export class Code extends CustomBaseEntity {
  @PrimaryKey()
  id!: number;

  @Unique()
  @Property()
  value!: string;

  @Enum({ items: () => CodeStatus, default: CodeStatus.ACTIVE })
  status: CodeStatus;
}
