import { IsOptional, IsString } from 'class-validator';

export class UpdateConfigDto {
  @IsString()
  @IsOptional()
  value: string;

  @IsString()
  @IsOptional()
  description: string;
}
