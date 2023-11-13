import { Provider } from '@nestjs/common';
import Ajv from 'ajv';
import fs from 'fs';
import addFormats from 'ajv-formats';
import { AJVPROVIDER } from 'src/constants';

export class AjvValidator {
  private instance: any;

  constructor() {
    this.instance = new Ajv({ allErrors: true });
    addFormats(this.instance);
    this.instance.addFormat('json', {
      type: 'string',
      error: 'test',
      validate: (data: any) => {
        try {
          return data == null || data == '' || JSON.parse(data);
        } catch (e) {
          return false;
        }
      },
    });
  }

  private static getSchema(modelName: string) {
    const schemas = JSON.parse(fs.readFileSync(`./dist/public/schema.json`, 'utf8'));
    const schema = schemas[modelName];
    if (!schema) {
      throw new Error('Schema not found');
    }
    //remove custom keywords
    const custom = ['title', 'description', 'alias', 'formatter'];
    for (const key of custom) {
      delete schema[key];
    }
    for (const key in schema.properties) {
      delete schema.properties[key].comment;
      delete schema.properties[key].ref;
    }

    return schema;
  }

  validate(modelName: string, data: any) {
    const _validate = this.instance.compile(AjvValidator.getSchema(modelName));
    const valid = _validate(data);
    if (!valid) {
      const errors = _validate.errors.map((error: any) => {
        return error.schemaPath + ' ' + error.message;
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
