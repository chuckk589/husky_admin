import { BeforeCreate, BeforeUpdate, Collection, Entity, Enum, ManyToOne, OneToMany, PrimaryKey, Property, Unique } from '@mikro-orm/core';
import { CustomBaseEntity } from './CustomBaseEntity';

@Entity()
export class User extends CustomBaseEntity {
  @PrimaryKey()
  id!: number;

  @Unique()
  @Property({ nullable: true })
  userId?: string;

  @Unique()
  @Property({ nullable: true })
  login?: string;

  @Property({ nullable: true })
  name?: string;
}
