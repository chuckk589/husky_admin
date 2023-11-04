import { Module } from '@nestjs/common';
import { MikroOrmModule } from '@mikro-orm/nestjs';
import { AppConfigModule } from './modules/app-config/app-config.module';
import { LoggerModule } from 'nestjs-pino';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { AuthModule } from './modules/auth/auth.module';
import { ResourceModule } from './modules/resource/resource.module';
import { ConfigsModule } from './modules/configs/configs.module';
import ORMOptionsProvider from 'src/configs/mikro-orm.config';

@Module({
  imports: [
    AppConfigModule.forRootAsync(),
    MikroOrmModule.forRoot(ORMOptionsProvider),
    LoggerModule.forRoot({
      pinoHttp: {
        autoLogging: false,
        quietReqLogger: true,
        transport: {
          target: 'pino-pretty',
          options: {
            singleLine: true,
          },
        },
        level: 'info',
      },
    }),
    ServeStaticModule.forRoot({ rootPath: join(__dirname, '..', '/dist/public/') }),
    AuthModule,
    ResourceModule,
    ConfigsModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
