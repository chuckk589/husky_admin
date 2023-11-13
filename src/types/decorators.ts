import { ValidationOptions, registerDecorator, ValidationArguments, isObject, isString, getMetadataStorage } from 'class-validator';

//number, integer, string, boolean, array, object or null.
export const IsRecord = (validationOptions?: ValidationOptions) => {
  return function (object: unknown, propertyName: string) {
    registerDecorator({
      name: 'IsRecord',
      target: object.constructor,
      propertyName: propertyName,
      constraints: [],
      options: {
        message: `Field '${propertyName}' is not a valid`,
        ...validationOptions,
      },
      validator: {
        validate(value: { [key: string]: any }, args: ValidationArguments) {
          if (!isObject(value)) return false;
          return Object.values(value).every((item) => {
            const isStr = Object.values(item).every((itemValue) => typeof itemValue === 'string');

            return isStr;
          });
        },
      },
    });
  };
};
