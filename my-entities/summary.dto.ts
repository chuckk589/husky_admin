import { PartialType } from '@nestjs/mapped-types';
import { IsString, IsNumberString, IsBooleanString, IsDateString, IsArray, IsObject } from 'class-validator';
export class CreateAchievmentsDto {
  @IsString()
  type: string;

  @IsString()
  name: string;

  @IsString()
  description: string;

  @IsString()
  award_key: string;

  @IsString()
  award_name: string;

  @IsString()
  icon: string;

  @IsString() //TODO: json type support
  actions: string;
}
export class UpdateAchievmentsDto extends PartialType(CreateAchievmentsDto) {}
export class CreateActionsDto {
  @IsString()
  name: string;

  @IsNumberString()
  group: string;

  @IsNumberString()
  animation_id: string;

  @IsString() //TODO: json type support
  rules: string;

  @IsNumberString()
  min_time: string;

  @IsNumberString()
  max_time: string;

  @IsBooleanString()
  unique: string;

  @IsString() //TODO: json type support
  condition_ids: string;
}
export class UpdateActionsDto extends PartialType(CreateActionsDto) {}
export class CreateBuffsDto {
  @IsNumberString()
  group: string;

  @IsString()
  type: string;

  @IsBooleanString()
  positive: string;

  @IsNumberString()
  multiply: string;

  @IsString()
  name: string;

  @IsString()
  icon: string;

  @IsString()
  description: string;

  @IsString()
  metadata: string;
}
export class UpdateBuffsDto extends PartialType(CreateBuffsDto) {}
export class CreateCharacterDuplicateFinesDto {
  @IsNumberString()
  count_duplicates: string;

  @IsNumberString()
  fine_percent: string;
}
export class UpdateCharacterDuplicateFinesDto extends PartialType(CreateCharacterDuplicateFinesDto) {}
export class CreateCharacterLevelsDto {
  @IsNumberString()
  level: string;

  @IsNumberString()
  from_exp: string;

  @IsNumberString()
  price: string;

  @IsNumberString()
  efficiency_for_level: string;
}
export class UpdateCharacterLevelsDto extends PartialType(CreateCharacterLevelsDto) {}
export class CreateCharacterPerksDto {
  @IsString()
  name: string;

  @IsString()
  icon: string;

  @IsString()
  type?: string;

  @IsNumberString()
  value: string;
}
export class UpdateCharacterPerksDto extends PartialType(CreateCharacterPerksDto) {}
export class CreateCharacterPuzzleChancesDto {
  @IsNumberString()
  chance: string;
}
export class UpdateCharacterPuzzleChancesDto extends PartialType(CreateCharacterPuzzleChancesDto) {}
export class CreateCharactersDto {
  @IsString()
  template_name: string;

  @IsNumberString()
  group: string;

  @IsString()
  promo_image: string;

  @IsString()
  avatar: string;

  @IsString()
  model: string;

  @IsString() //TODO: json type support
  actions: string;

  @IsString() //TODO: json type support
  friends: string;

  @IsString() //TODO: json type support
  things: string;

  @IsString() //TODO: json type support
  perks: string;

  @IsBooleanString()
  can_be_starter: string;
}
export class UpdateCharactersDto extends PartialType(CreateCharactersDto) {}
export class CreateCharactersRequirementsDto {
  @IsNumberString()
  book_row: string;

  @IsNumberString()
  furniture_id: string;

  @IsNumberString()
  furniture_group: string;

  @IsNumberString()
  character_id?: string;
}
export class UpdateCharactersRequirementsDto extends PartialType(CreateCharactersRequirementsDto) {}
export class CreateConstantsDto {
  @IsString()
  key: string;

  @IsString()
  type: string;

  @IsNumberString()
  num_value?: string;

  @IsString()
  str_value?: string;

  @IsString()
  flt_value?: string;

  @IsString() //TODO: json type support
  arr_value?: string;
}
export class UpdateConstantsDto extends PartialType(CreateConstantsDto) {}
export class CreateConsumablesDto {
  @IsNumberString()
  group: string;

  @IsString()
  name: string;

  @IsString()
  icon: string;

  @IsString()
  description: string;

  @IsString()
  use_type: string;

  @IsNumberString()
  max_count: string;

  @IsNumberString()
  use_count: string;

  @IsNumberString()
  buff_id?: string;

  @IsString()
  value: string;

  @IsBooleanString()
  only_characters: string;
}
export class UpdateConsumablesDto extends PartialType(CreateConsumablesDto) {}
export class CreateDialogsDto {
  @IsString()
  messages: string;
}
export class UpdateDialogsDto extends PartialType(CreateDialogsDto) {}
export class CreateFloorsDto {
  @IsNumberString()
  'x-size': string;

  @IsNumberString()
  'y-size': string;
}
export class UpdateFloorsDto extends PartialType(CreateFloorsDto) {}
export class CreateFurniturePuzzleChancesDto {
  @IsNumberString()
  chance: string;

  @IsNumberString()
  furniture_id?: string;
}
export class UpdateFurniturePuzzleChancesDto extends PartialType(CreateFurniturePuzzleChancesDto) {}
export class CreateFurnituresDto {
  @IsString()
  name: string;

  @IsNumberString()
  category: string;

  @IsString()
  description: string;

  @IsString()
  promo_image: string;

  @IsString()
  icon: string;

  @IsString()
  model: string;

  @IsBooleanString()
  occupy: string;

  @IsBooleanString()
  is_wall_object: string;

  @IsString() //TODO: json type support
  rules: string;

  @IsNumberString()
  prestige: string;

  @IsNumberString()
  optimal_requirement: string;

  @IsNumberString()
  max_requirement: string;

  @IsString() //TODO: json type support
  size: string;
}
export class UpdateFurnituresDto extends PartialType(CreateFurnituresDto) {}
export class CreateGroupsTilesDto {
  @IsString() //TODO: json type support
  size: string;

  @IsString() //TODO: json type support
  position: string;

  @IsNumberString()
  cost: string;

  @IsString() //TODO: json type support
  previous: string;

  @IsNumberString()
  sector: string;

  @IsBooleanString()
  is_start: string;
}
export class UpdateGroupsTilesDto extends PartialType(CreateGroupsTilesDto) {}
export class CreateLootBoxesDto {
  @IsString()
  type: string;

  @IsString()
  name: string;

  @IsString()
  icon: string;

  @IsNumberString()
  min_items: string;

  @IsNumberString()
  max_items: string;
}
export class UpdateLootBoxesDto extends PartialType(CreateLootBoxesDto) {}
export class CreateLootBoxesPriceDto {
  @IsNumberString()
  bought_count: string;

  @IsNumberString()
  price: string;
}
export class UpdateLootBoxesPriceDto extends PartialType(CreateLootBoxesPriceDto) {}
export class CreateLootBoxGroupChancesDto {
  @IsString()
  group_name: string;

  @IsNumberString()
  chance: string;

  @IsNumberString()
  loot_box_id?: string;
}
export class UpdateLootBoxGroupChancesDto extends PartialType(CreateLootBoxGroupChancesDto) {}
export class CreateLootBoxItemsDto {
  @IsString()
  group_name: string;

  @IsNumberString()
  config_id: string;

  @IsNumberString()
  chance: string;

  @IsNumberString()
  count: string;

  @IsNumberString()
  loot_box_id?: string;
}
export class UpdateLootBoxItemsDto extends PartialType(CreateLootBoxItemsDto) {}
export class CreateMaxByGroupTilesDto {
  @IsNumberString()
  count_group_tiles: string;

  @IsNumberString()
  max_prestige: string;

  @IsNumberString()
  max_soft_currency: string;

  @IsNumberString()
  max_friends: string;
}
export class UpdateMaxByGroupTilesDto extends PartialType(CreateMaxByGroupTilesDto) {}
export class CreateRaidCellsDto {
  @IsNumberString()
  cells_count: string;

  @IsNumberString()
  prestige: string;
}
export class UpdateRaidCellsDto extends PartialType(CreateRaidCellsDto) {}
export class CreateRaidCountItemsDto {
  @IsNumberString()
  min: string;

  @IsNumberString()
  max: string;
}
export class UpdateRaidCountItemsDto extends PartialType(CreateRaidCountItemsDto) {}
export class CreateRaidLocationsDto {
  @IsString()
  name: string;

  @IsString()
  icon: string;

  @IsNumberString()
  loot_box_id?: string;
}
export class UpdateRaidLocationsDto extends PartialType(CreateRaidLocationsDto) {}
export class CreateThingsDto {
  @IsNumberString()
  group: string;

  @IsString()
  name: string;

  @IsString()
  icon: string;

  @IsString()
  description: string;
}
export class UpdateThingsDto extends PartialType(CreateThingsDto) {}
export class CreateUniqueActionRelationsDto {
  @IsNumberString()
  first_character_id?: string;

  @IsNumberString()
  second_character_id?: string;

  @IsBooleanString()
  is_start: string;

  @IsNumberString()
  chain_id?: string;

  @IsNumberString()
  action_id?: string;

  @IsNumberString()
  dialog_id?: string;

  @IsNumberString()
  achievment_id?: string;

  @IsNumberString()
  next_action_id?: string;
}
export class UpdateUniqueActionRelationsDto extends PartialType(CreateUniqueActionRelationsDto) {}
export class CreateUniqueActionsChainsDto {
  @IsString()
  name: string;
}
export class UpdateUniqueActionsChainsDto extends PartialType(CreateUniqueActionsChainsDto) {}
