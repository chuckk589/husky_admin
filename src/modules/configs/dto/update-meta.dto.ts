import { Type } from 'class-transformer';
import { IsArray, IsDefined, IsInstance, IsObject, IsOptional, IsString, ValidateNested, validate } from 'class-validator';
import { RetrieveSchemaDto } from './retrieve-schema.dto';

export class UpdateMetaDto {
  @IsDefined()
  @ValidateNested()
  @Type(() => RetrieveSchemaDto)
  schema: RetrieveSchemaDto;

  @IsString()
  _model: string;
}
