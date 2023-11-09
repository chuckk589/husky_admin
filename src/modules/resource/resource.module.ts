import { Module } from '@nestjs/common';
import { ResourceService } from './resource.service';
import { ResourceController } from './resource.controller';
import { PGConnectionProvider } from '../providers/PGConnection';
import { AJVProvider } from '../providers/ajv';

@Module({
  controllers: [ResourceController],
  providers: [ResourceService, PGConnectionProvider, AJVProvider],
})
export class ResourceModule {}
