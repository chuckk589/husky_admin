import { Type } from 'class-transformer';
import { IsArray, IsInstance, IsObject, IsOptional, IsString, ValidateNested } from 'class-validator';

export class UpdateMetaDto {
  @IsObject()
  @ValidateNested()
  @Type(() => Schema)
  schema: Schema | Schema[];
}
export class Schema {
  @IsString()
  title: string;

  @IsString()
  alias: string;

  @IsString()
  description: string;

  @IsString({ each: true, always: false })
  required: string[];

  @IsString({ each: true, always: false })
  @IsOptional()
  formatter: string[];

  @IsObject()
  properties: {
    [key: string]: {
      type: string;
      comment?: string;
    };
  };
}
