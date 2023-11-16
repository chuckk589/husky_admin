import { Module } from '@nestjs/common';
import { MikroOrmModule } from '@mikro-orm/nestjs';
import { AppConfigModule } from './modules/app-config/app-config.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import * as Joi from 'joi';
import { AuthModule } from './modules/auth/auth.module';
import { ResourceModule } from './modules/resource/resource.module';
import { ConfigsModule } from './modules/configs/configs.module';
import ORMOptionsProvider from 'src/configs/mikro-orm.config';

@Module({
  imports: [
    AppConfigModule.forRootAsync({
      validationSchema: Joi.object({
        jwt_secret: Joi.string().default('secret'),
        NODE_ENV: Joi.string().valid('dev', 'prod').default('dev'),
        PORT: Joi.number().default(3000),
      }),
    }),
    MikroOrmModule.forRoot(ORMOptionsProvider),
    ServeStaticModule.forRoot({ rootPath: join(__dirname, '..', '/dist/public/') }),
    AuthModule,
    ResourceModule,
    ConfigsModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
