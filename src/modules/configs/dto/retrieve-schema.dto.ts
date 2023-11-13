import { IsDefined, IsString } from 'class-validator';
import { IsRecord } from 'src/types/decorators';

class Property {
  @IsString()
  comment?: string;
  type: string;
  ref?: string;
  nullable?: boolean;
}

export class RetrieveSchemaDto {
  @IsString()
  alias: string;

  @IsString()
  description: string;

  @IsDefined()
  properties: Record<string, Property>;

  @IsString({ each: true })
  formatter: string[];

  type: string;
  required: string[];
  title: string;
}
