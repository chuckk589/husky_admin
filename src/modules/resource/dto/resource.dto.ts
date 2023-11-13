import { IsString } from 'class-validator';

export class ResourceDto {
  @IsString()
  _model!: string;

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
  _model!: string;

  entities: Omit<ResourceDto, '_model'>[];
}

export class RetrieveResourceDto {
  constructor(object: any) {
    for (const key in object) {
      this[key] = typeof object[key] === 'object' && object[key] != null ? JSON.stringify(object[key]) : object[key];
    }
  }
  [key: string]: any;
}
