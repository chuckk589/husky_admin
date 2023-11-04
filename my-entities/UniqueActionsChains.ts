import { Entity, Property } from '@mikro-orm/core';

@Entity({ tableName: 'unique_actions_chains' })
export class UniqueActionsChains {

  @Property()
  id!: number;

  @Property({ length: 64 })
  name!: string;

}
