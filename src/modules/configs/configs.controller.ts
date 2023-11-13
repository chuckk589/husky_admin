import { UpdateMetaDto } from './dto/update-meta.dto';
import { UpdateConfigDto } from './dto/update-config.dto';
import { Controller, Get, Post, Body, Patch, Param, Delete, UsePipes, ValidationPipe } from '@nestjs/common';
import { ConfigsService } from './configs.service';

@Controller({
  path: 'configs',
  version: '1',
})
export class ConfigsController {
  constructor(private readonly configsService: ConfigsService) {}

  @Get()
  findAll() {
    return this.configsService.findAll();
  }

  @Get('/meta')
  findMeta() {
    return this.configsService.findMeta();
  }

  @Patch('/meta')
  updateMeta(@Body() updateMetaDto: UpdateMetaDto) {
    return this.configsService.updateMeta(updateMetaDto);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateConfigDto: UpdateConfigDto) {
    return this.configsService.update(+id, updateConfigDto);
  }
}
