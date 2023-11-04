import { Config } from 'src/modules/mikroorm/entities/Config';

export class RetrieveConfigDto {
  constructor(config?: Partial<Config>) {
    this.id = config.id.toString();
    this.name = config.name;
    this.value = config.value;
    this.description = config.description;
    this.type = config.type;
  }
  id: string;
  name: string;
  value: string;
  description?: string;
  type?: string;
}
