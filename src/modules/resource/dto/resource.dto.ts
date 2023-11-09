import { IsString } from 'class-validator';

export class ResourceDto {
  @IsString()
  model!: string;

  [key: string]: any;
}
export class ResourcePopulated {
  entities: any[];
  relations: {
    [key: string]: {
      entities: any[];
      table_name: string;
    };
  };
}
export class CloneResourceDto {
  @IsString()
  model!: string;

  entities: Omit<ResourceDto, 'model'>[];
}

export class RetrieveResourceDto {
  constructor(object: any) {
    for (const key in object) {
      this[key] = typeof object[key] === 'object' ? JSON.stringify(object[key]) : object[key].toString();
    }
  }
  [key: string]: string;
}
