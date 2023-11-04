import { Module } from '@nestjs/common';
import { ResourceService } from './resource.service';
import { ResourceController } from './resource.controller';
import { PGConnectionProvider } from '../providers/PGConnection';

@Module({
  controllers: [ResourceController],
  providers: [ResourceService, PGConnectionProvider],
})
export class ResourceModule {}
