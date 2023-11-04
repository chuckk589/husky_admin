import { CloneResourceDto, ResourceDto } from './dto/resource.dto';
import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { ResourceService } from './resource.service';

@Controller({
  path: 'resource',
  version: '1',
})
export class ResourceController {
  constructor(private readonly resourceService: ResourceService) {}

  @Post()
  create(@Body() createResourceDto: ResourceDto) {
    return this.resourceService.create(createResourceDto);
  }

  @Get()
  findAll(@Query('model') model: string) {
    return this.resourceService.findAll(model);
  }

  @Get('models')
  findModels() {
    return this.resourceService.findModels();
  }
  @Post('clone')
  clone(@Body() cloneResourceDto: CloneResourceDto) {
    return this.resourceService.clone(cloneResourceDto);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateResourceDto: ResourceDto) {
    return this.resourceService.update(+id, updateResourceDto);
  }

  @Delete()
  remove(@Query('ids') ids: string, @Body() removeResourceDto: ResourceDto) {
    return this.resourceService.remove(
      ids.split(',').map((id) => +id),
      removeResourceDto,
    );
  }
}
