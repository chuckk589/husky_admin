import { Provider } from '@nestjs/common';
import Ajv from 'ajv';
import fs from 'fs';
import { AJVPROVIDER } from 'src/constants';

export class AjvValidator {
  private instance: any;

  constructor() {
    this.instance = new Ajv({ allErrors: true, coerceTypes: true });
  }

  private static getSchema(modelName: string, update: boolean) {
    const schemas = JSON.parse(fs.readFileSync(`./dist/public/schema.json`, 'utf8'));
    const schema = schemas.find((schema: any) => schema.title == modelName);
    if (!schema) {
      throw new Error('Schema not found');
    }
    if (update === true) {
      schema.required = [];
    }
    return schema;
  }

  validate(modelName: string, data: any, update = false) {
    const _validate = this.instance.compile(AjvValidator.getSchema(modelName, update));
    const valid = _validate(data);
    if (!valid) {
      const errors = _validate.errors.map((error: any) => {
        return (error.dataPath.length > 0 ? error.dataPath.replace('.', '') + ' ' : '') + error.message;
      });
      throw errors;
    }
    return data;
  }
}
export const AJVProvider: Provider = {
  provide: AJVPROVIDER,
  useValue: new AjvValidator(),
};
