import fs from 'fs';
(async () => {
  const sql = `CREATE TABLE "public"."achievments" (
    "id" integer DEFAULT nextval('achievments_id_seq') NOT NULL,
    "type" character varying(64) NOT NULL,
    "name" character varying(64) NOT NULL,
    "description" character varying(255) NOT NULL,
    "award_key" character varying(64) NOT NULL,
    "award_name" character varying(64) NOT NULL,
    "icon" character varying(64) NOT NULL,
    "actions" jsonb NOT NULL,
    CONSTRAINT "PK_d7d04156611d9693fd2f02b16b2" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."achievments"."award_key" IS 'Ключ получаемой награды';

COMMENT ON COLUMN "public"."achievments"."award_name" IS 'Название получаемой награды';

COMMENT ON COLUMN "public"."achievments"."actions" IS 'Массив из объектов действий необходимых для получения ачивки';


DROP TABLE IF EXISTS "actions";
DROP SEQUENCE IF EXISTS actions_id_seq;
CREATE SEQUENCE actions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."actions" (
    "id" integer DEFAULT nextval('actions_id_seq') NOT NULL,
    "name" character varying(128) NOT NULL,
    "group" integer NOT NULL,
    "animation_id" integer NOT NULL,
    "rules" jsonb NOT NULL,
    "min_time" integer NOT NULL,
    "max_time" integer NOT NULL,
    "unique" boolean NOT NULL,
    "condition_ids" jsonb NOT NULL,
    CONSTRAINT "PK_7bfb822f56be449c0b8adbf83cf" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."actions"."rules" IS 'Правила для выполнения действий, тут указываются ключи, вся логика в коде прописывается';


DROP TABLE IF EXISTS "buffs";
DROP SEQUENCE IF EXISTS buffs_id_seq;
CREATE SEQUENCE buffs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."buffs" (
    "id" integer DEFAULT nextval('buffs_id_seq') NOT NULL,
    "group" integer NOT NULL,
    "type" character varying(64) NOT NULL,
    "positive" boolean NOT NULL,
    "multiply" integer NOT NULL,
    "name" character varying(64) NOT NULL,
    "icon" character varying(64) NOT NULL,
    "description" character varying(256) NOT NULL,
    "metadata" character varying(128) NOT NULL,
    CONSTRAINT "PK_53268009dd6e8003a4c40495275" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."buffs"."group" IS 'У одной группы не может быть бафф и дебафф одновременно!!';

COMMENT ON COLUMN "public"."buffs"."positive" IS 'Является ли бонус положительным';

COMMENT ON COLUMN "public"."buffs"."multiply" IS 'множитель бонуса в процентах';

COMMENT ON COLUMN "public"."buffs"."metadata" IS 'конкретизация на что бонус, используется не везде, и для каждого случая свое значение';


DROP TABLE IF EXISTS "character_duplicate_fines";
DROP SEQUENCE IF EXISTS character_duplicate_fines_id_seq;
CREATE SEQUENCE character_duplicate_fines_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."character_duplicate_fines" (
    "id" integer DEFAULT nextval('character_duplicate_fines_id_seq') NOT NULL,
    "count_duplicates" integer NOT NULL,
    "fine_percent" real NOT NULL,
    CONSTRAINT "PK_7cc686657acd5142ed2664d1a38" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "character_levels";
DROP SEQUENCE IF EXISTS character_levels_id_seq;
CREATE SEQUENCE character_levels_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."character_levels" (
    "id" integer DEFAULT nextval('character_levels_id_seq') NOT NULL,
    "level" integer NOT NULL,
    "from_exp" integer NOT NULL,
    "price" integer DEFAULT '100' NOT NULL,
    "efficiency_for_level" real DEFAULT '0.1' NOT NULL,
    CONSTRAINT "PK_eba1f582874d604b15f31e1d6cf" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "character_perks";
DROP SEQUENCE IF EXISTS character_perks_id_seq;
CREATE SEQUENCE character_perks_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."character_perks" (
    "id" integer DEFAULT nextval('character_perks_id_seq') NOT NULL,
    "name" character varying(64) NOT NULL,
    "icon" character varying(64) NOT NULL,
    "type" character varying(64),
    "value" real DEFAULT '0' NOT NULL,
    CONSTRAINT "PK_fc6138c6eaf14773b33434e27ed" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."character_perks"."value" IS 'Указывается в зависимости от перка, нужен не везде';


DROP TABLE IF EXISTS "character_puzzle_chances";
DROP SEQUENCE IF EXISTS character_puzzle_chances_id_seq;
CREATE SEQUENCE character_puzzle_chances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."character_puzzle_chances" (
    "id" integer DEFAULT nextval('character_puzzle_chances_id_seq') NOT NULL,
    "chance" real NOT NULL,
    "character_id" integer,
    CONSTRAINT "PK_2d2e84780a98566fec7465ac4e6" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "characters";
DROP SEQUENCE IF EXISTS characters_id_seq;
CREATE SEQUENCE characters_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."characters" (
    "id" integer DEFAULT nextval('characters_id_seq') NOT NULL,
    "template_name" character varying(64) NOT NULL,
    "group" integer NOT NULL,
    "promo_image" character varying(64) NOT NULL,
    "avatar" character varying(64) NOT NULL,
    "model" character varying(64) NOT NULL,
    "actions" jsonb NOT NULL,
    "friends" jsonb NOT NULL,
    "things" jsonb NOT NULL,
    "perks" jsonb NOT NULL,
    "can_be_starter" boolean DEFAULT false NOT NULL,
    CONSTRAINT "PK_9d731e05758f26b9315dac5e378" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."characters"."actions" IS 'Доступные персонажу действия';

COMMENT ON COLUMN "public"."characters"."things" IS 'Список ид вещей, который у этого персонажа, указывается по очередности уровней';


DROP TABLE IF EXISTS "characters_requirements";
DROP SEQUENCE IF EXISTS characters_requirements_id_seq;
CREATE SEQUENCE characters_requirements_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."characters_requirements" (
    "id" integer DEFAULT nextval('characters_requirements_id_seq') NOT NULL,
    "book_row" integer NOT NULL,
    "furniture_id" integer NOT NULL,
    "furniture_group" integer NOT NULL,
    "character_id" integer,
    CONSTRAINT "PK_8a2efa4e46158dd975b9622bfe9" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."characters_requirements"."furniture_id" IS 'Если group = -1';

COMMENT ON COLUMN "public"."characters_requirements"."furniture_group" IS 'Если id = -1';


DROP TABLE IF EXISTS "constants";
DROP SEQUENCE IF EXISTS constants_id_seq;
CREATE SEQUENCE constants_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."constants" (
    "id" integer DEFAULT nextval('constants_id_seq') NOT NULL,
    "key" character varying(64) NOT NULL,
    "type" character varying(64) NOT NULL,
    "num_value" integer,
    "str_value" character varying(128),
    "flt_value" double precision,
    "arr_value" jsonb,
    CONSTRAINT "PK_b05c708f105d3b8b351fdb07967" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "consumables";
DROP SEQUENCE IF EXISTS consumables_id_seq;
CREATE SEQUENCE consumables_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."consumables" (
    "id" integer DEFAULT nextval('consumables_id_seq') NOT NULL,
    "group" integer NOT NULL,
    "name" character varying(128) NOT NULL,
    "icon" character varying(64) NOT NULL,
    "description" character varying(255) NOT NULL,
    "use_type" character varying(32) NOT NULL,
    "max_count" integer NOT NULL,
    "use_count" integer DEFAULT '1' NOT NULL,
    "buff_id" integer,
    "value" double precision DEFAULT '0' NOT NULL,
    "only_characters" boolean DEFAULT false NOT NULL,
    CONSTRAINT "PK_88ce43ef80ea7ac74b91dbd8614" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "dialogs";
DROP SEQUENCE IF EXISTS dialogs_id_seq;
CREATE SEQUENCE dialogs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."dialogs" (
    "id" integer DEFAULT nextval('dialogs_id_seq') NOT NULL,
    "messages" jsonb DEFAULT '[]' NOT NULL,
    CONSTRAINT "PK_75ffe676a97ca2eb5510ec88b11" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "en_lang";
DROP SEQUENCE IF EXISTS en_lang_id_seq;
CREATE SEQUENCE en_lang_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."en_lang" (
    "id" integer DEFAULT nextval('en_lang_id_seq') NOT NULL,
    "key" character varying(64) NOT NULL,
    "type" character varying(64) NOT NULL,
    "text" character varying(255) NOT NULL,
    CONSTRAINT "PK_b031dd4ebe34dae40747b15d669" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "es_lang";
DROP SEQUENCE IF EXISTS es_lang_id_seq;
CREATE SEQUENCE es_lang_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."es_lang" (
    "id" integer DEFAULT nextval('es_lang_id_seq') NOT NULL,
    "key" character varying(64) NOT NULL,
    "type" character varying(64) NOT NULL,
    "text" character varying(255) NOT NULL,
    CONSTRAINT "PK_9ca04bd5d694c4db4bec0bada68" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "floors";
DROP SEQUENCE IF EXISTS floors_id_seq;
CREATE SEQUENCE floors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."floors" (
    "id" integer DEFAULT nextval('floors_id_seq') NOT NULL,
    "x-size" integer NOT NULL,
    "y-size" integer NOT NULL,
    CONSTRAINT "PK_dae78234002afa84842d3a08ee0" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "furniture_puzzle_chances";
DROP SEQUENCE IF EXISTS furniture_puzzle_chances_id_seq;
CREATE SEQUENCE furniture_puzzle_chances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."furniture_puzzle_chances" (
    "id" integer DEFAULT nextval('furniture_puzzle_chances_id_seq') NOT NULL,
    "chance" real NOT NULL,
    "furniture_id" integer,
    CONSTRAINT "PK_7489b4d81f0e58049ff8ddeb4f4" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "furnitures";
DROP SEQUENCE IF EXISTS furnitures_id_seq;
CREATE SEQUENCE furnitures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."furnitures" (
    "id" integer DEFAULT nextval('furnitures_id_seq') NOT NULL,
    "name" character varying(128) NOT NULL,
    "category" integer NOT NULL,
    "description" character varying(255) NOT NULL,
    "promo_image" character varying(64) NOT NULL,
    "icon" character varying(64) NOT NULL,
    "model" character varying(64) NOT NULL,
    "occupy" boolean NOT NULL,
    "is_wall_object" boolean DEFAULT false NOT NULL,
    "rules" jsonb NOT NULL,
    "prestige" integer NOT NULL,
    "optimal_requirement" integer NOT NULL,
    "max_requirement" integer NOT NULL,
    "size" jsonb NOT NULL,
    CONSTRAINT "PK_7effa6aa3ab998c431ea028393a" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "groups_tiles";
DROP SEQUENCE IF EXISTS groups_tiles_id_seq;
CREATE SEQUENCE groups_tiles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."groups_tiles" (
    "id" integer DEFAULT nextval('groups_tiles_id_seq') NOT NULL,
    "size" jsonb NOT NULL,
    "position" jsonb NOT NULL,
    "cost" integer NOT NULL,
    "previous" jsonb NOT NULL,
    "sector" integer NOT NULL,
    "is_start" boolean NOT NULL,
    CONSTRAINT "PK_287c0cca6b10653eeede9c4026a" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "letters";
DROP SEQUENCE IF EXISTS letters_id_seq;
CREATE SEQUENCE letters_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."letters" (
    "id" integer DEFAULT nextval('letters_id_seq') NOT NULL,
    "is_everyone" boolean NOT NULL,
    "subject" character varying(64) NOT NULL,
    "message" character varying(512) NOT NULL,
    "items" jsonb,
    "time" integer NOT NULL,
    "senderId" integer,
    "recipientId" integer,
    CONSTRAINT "PK_bf70c41d26aa84cf2651d571889" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_character_actions";
DROP SEQUENCE IF EXISTS logs_character_actions_id_seq;
CREATE SEQUENCE logs_character_actions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_character_actions" (
    "id" integer DEFAULT nextval('logs_character_actions_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "character_id" integer NOT NULL,
    "action_config_id" integer NOT NULL,
    "time_end" integer NOT NULL,
    CONSTRAINT "PK_05c846cf5ddf1f78873348cec47" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_character_buffs";
DROP SEQUENCE IF EXISTS logs_character_buffs_id_seq;
CREATE SEQUENCE logs_character_buffs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_character_buffs" (
    "id" integer DEFAULT nextval('logs_character_buffs_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "action_name" character varying(32) NOT NULL,
    "config_id" integer NOT NULL,
    "buff_time" integer NOT NULL,
    CONSTRAINT "PK_e6e521cbc118d314494557971d2" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_character_interactions";
DROP SEQUENCE IF EXISTS logs_character_interactions_id_seq;
CREATE SEQUENCE logs_character_interactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_character_interactions" (
    "id" integer DEFAULT nextval('logs_character_interactions_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "character_id" integer NOT NULL,
    "action_name" character varying(64) NOT NULL,
    CONSTRAINT "PK_e7c8ca6861741b89a849281aa04" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_character_raids";
DROP SEQUENCE IF EXISTS logs_character_raids_id_seq;
CREATE SEQUENCE logs_character_raids_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_character_raids" (
    "id" integer DEFAULT nextval('logs_character_raids_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "location_config_id" integer NOT NULL,
    "minutes" integer NOT NULL,
    "start_time" integer NOT NULL,
    "end_time" integer NOT NULL,
    CONSTRAINT "PK_1858621370bfe7d834fb6069423" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_furniture_interactions";
DROP SEQUENCE IF EXISTS logs_furniture_interactions_id_seq;
CREATE SEQUENCE logs_furniture_interactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_furniture_interactions" (
    "id" integer DEFAULT nextval('logs_furniture_interactions_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "furniture_id" integer NOT NULL,
    "action" character varying(64) NOT NULL,
    CONSTRAINT "PK_bbd90ad6353ae3741c51e0edb64" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_group_tiles";
DROP SEQUENCE IF EXISTS logs_group_tiles_id_seq;
CREATE SEQUENCE logs_group_tiles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_group_tiles" (
    "id" integer DEFAULT nextval('logs_group_tiles_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "config_id" integer NOT NULL,
    "floor_id" integer NOT NULL,
    CONSTRAINT "PK_f21916bb7f80065eee1ad866e41" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_inventory_consumables";
DROP SEQUENCE IF EXISTS logs_inventory_consumables_id_seq;
CREATE SEQUENCE logs_inventory_consumables_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_inventory_consumables" (
    "id" integer DEFAULT nextval('logs_inventory_consumables_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "consumable_config_id" integer NOT NULL,
    "count" integer NOT NULL,
    "action_name" character varying(128) NOT NULL,
    CONSTRAINT "PK_c8642dfce67d26c42f808cb3fc4" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_inventory_things";
DROP SEQUENCE IF EXISTS logs_inventory_things_id_seq;
CREATE SEQUENCE logs_inventory_things_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_inventory_things" (
    "id" integer DEFAULT nextval('logs_inventory_things_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "thing_id" integer NOT NULL,
    "thing_config_id" integer NOT NULL,
    "action_name" character varying(64) NOT NULL,
    CONSTRAINT "PK_486ce49a18f1640a16433388c83" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_loot_box_creations";
DROP SEQUENCE IF EXISTS logs_loot_box_creations_id_seq;
CREATE SEQUENCE logs_loot_box_creations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_loot_box_creations" (
    "id" integer DEFAULT nextval('logs_loot_box_creations_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "type" character varying(24) NOT NULL,
    "loot_box_id" integer NOT NULL,
    "location_config_id" integer NOT NULL,
    "items" jsonb NOT NULL,
    CONSTRAINT "PK_33c006ea4ab73713d3bd58561af" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_loot_box_opens";
DROP SEQUENCE IF EXISTS logs_loot_box_opens_id_seq;
CREATE SEQUENCE logs_loot_box_opens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_loot_box_opens" (
    "id" integer DEFAULT nextval('logs_loot_box_opens_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "type" character varying(24) NOT NULL,
    "loot_box_id" integer NOT NULL,
    "loot_box_config_id" integer NOT NULL,
    CONSTRAINT "PK_04079a4a25f19c59a60d67cb8eb" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_player_gates";
DROP SEQUENCE IF EXISTS logs_player_gates_id_seq;
CREATE SEQUENCE logs_player_gates_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_player_gates" (
    "id" integer DEFAULT nextval('logs_player_gates_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "action" character varying(64) NOT NULL,
    "ip" character varying(64),
    CONSTRAINT "PK_03b294a7dd9ffc9c63fed4b5156" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_server";
DROP SEQUENCE IF EXISTS logs_server_id_seq;
CREATE SEQUENCE logs_server_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_server" (
    "id" integer DEFAULT nextval('logs_server_id_seq') NOT NULL,
    "type" character varying(64) NOT NULL,
    "data" character varying(256) NOT NULL,
    "time" bigint NOT NULL,
    CONSTRAINT "PK_5fe068af8d227fd0865c05cad20" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_soft_currency";
DROP SEQUENCE IF EXISTS logs_soft_currency_id_seq;
CREATE SEQUENCE logs_soft_currency_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_soft_currency" (
    "id" integer DEFAULT nextval('logs_soft_currency_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "action_name" character varying(128) NOT NULL,
    "is_addition" boolean NOT NULL,
    "amount" integer NOT NULL,
    "balance" integer NOT NULL,
    CONSTRAINT "PK_c28702ebcd2a04d68f5611cd066" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "logs_user_achievments";
DROP SEQUENCE IF EXISTS logs_user_achievments_id_seq;
CREATE SEQUENCE logs_user_achievments_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_user_achievments" (
    "id" integer DEFAULT nextval('logs_user_achievments_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "achievment_config_id" integer NOT NULL,
    CONSTRAINT "PK_45e370f2c2707f996847d643f1f" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "loot_box_group_chances";
DROP SEQUENCE IF EXISTS loot_box_group_chances_id_seq;
CREATE SEQUENCE loot_box_group_chances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."loot_box_group_chances" (
    "id" integer DEFAULT nextval('loot_box_group_chances_id_seq') NOT NULL,
    "group_name" character varying(32) NOT NULL,
    "chance" real NOT NULL,
    "loot_box_id" integer,
    CONSTRAINT "PK_4cbf3702d86217f4dd3af01b305" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "loot_box_items";
DROP SEQUENCE IF EXISTS loot_box_items_id_seq;
CREATE SEQUENCE loot_box_items_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."loot_box_items" (
    "id" integer DEFAULT nextval('loot_box_items_id_seq') NOT NULL,
    "group_name" character varying(32) NOT NULL,
    "config_id" integer NOT NULL,
    "chance" real NOT NULL,
    "count" integer NOT NULL,
    "loot_box_id" integer,
    CONSTRAINT "PK_b33513f0e67f4b23fcb4ad40a36" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "loot_boxes";
DROP SEQUENCE IF EXISTS loot_boxes_id_seq;
CREATE SEQUENCE loot_boxes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."loot_boxes" (
    "id" integer DEFAULT nextval('loot_boxes_id_seq') NOT NULL,
    "type" character varying(32) NOT NULL,
    "name" character varying(64) NOT NULL,
    "icon" character varying(64) NOT NULL,
    "min_items" integer NOT NULL,
    "max_items" integer NOT NULL,
    CONSTRAINT "PK_fc2488231b8ea777005320e65d8" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "loot_boxes_price";
DROP SEQUENCE IF EXISTS loot_boxes_price_id_seq;
CREATE SEQUENCE loot_boxes_price_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."loot_boxes_price" (
    "id" integer DEFAULT nextval('loot_boxes_price_id_seq') NOT NULL,
    "bought_count" integer NOT NULL,
    "price" integer NOT NULL,
    CONSTRAINT "PK_b19abf5282441dc7f4960e0ea2e" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "max_by_group_tiles";
DROP SEQUENCE IF EXISTS max_by_group_tiles_id_seq;
CREATE SEQUENCE max_by_group_tiles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."max_by_group_tiles" (
    "id" integer DEFAULT nextval('max_by_group_tiles_id_seq') NOT NULL,
    "count_group_tiles" integer NOT NULL,
    "max_prestige" integer NOT NULL,
    "max_soft_currency" integer NOT NULL,
    "max_friends" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "PK_76781ca5675f6bd56799ef4fccb" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "player_chains_progress";
DROP SEQUENCE IF EXISTS player_chains_progress_id_seq;
CREATE SEQUENCE player_chains_progress_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_chains_progress" (
    "id" integer DEFAULT nextval('player_chains_progress_id_seq') NOT NULL,
    "chainId" integer,
    "actionId" integer,
    CONSTRAINT "PK_a6cb7bee2378fb161e9e4cb8619" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "player_characters";
DROP SEQUENCE IF EXISTS player_characters_id_seq;
CREATE SEQUENCE player_characters_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_characters" (
    "id" integer DEFAULT nextval('player_characters_id_seq') NOT NULL,
    "exp" integer NOT NULL,
    "dirty" boolean NOT NULL,
    "sector" integer NOT NULL,
    "last_tick" bigint NOT NULL,
    "efficiency" real NOT NULL,
    "buffs" jsonb NOT NULL,
    "position" jsonb NOT NULL,
    "things" jsonb NOT NULL,
    "raid" jsonb,
    "action" jsonb NOT NULL,
    "placed" boolean DEFAULT false NOT NULL,
    "nft_key" character varying DEFAULT '0' NOT NULL,
    "playerId" integer,
    "configId" integer,
    "level" integer DEFAULT '1' NOT NULL,
    "satisfaction" jsonb DEFAULT '[]' NOT NULL,
    CONSTRAINT "PK_4faad69f48d86dfa28b6390cccf" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "player_consumables";
DROP SEQUENCE IF EXISTS player_consumables_id_seq;
CREATE SEQUENCE player_consumables_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_consumables" (
    "id" integer DEFAULT nextval('player_consumables_id_seq') NOT NULL,
    "count" integer DEFAULT '0' NOT NULL,
    "playerId" integer,
    "configId" integer,
    CONSTRAINT "PK_cd589ace9cad98f7700a7dc49af" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "player_floors";
DROP SEQUENCE IF EXISTS player_floors_id_seq;
CREATE SEQUENCE player_floors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_floors" (
    "id" integer DEFAULT nextval('player_floors_id_seq') NOT NULL,
    "soft_currency" integer DEFAULT '0' NOT NULL,
    "playerId" integer,
    "configId" integer,
    CONSTRAINT "PK_db011a6abd929a153aadf700b1d" PRIMARY KEY ("id")
) WITH (oids = false);`;

  //convert to JSON Type Definition
  const tables = sql.split('\n\n\n').map((table) => {
    const tableName = table.match(/CREATE TABLE ".*"\."(.*)" \(/);
    const columns = table.matchAll(/ "(\w+)" (\w*).*? ?(NOT NULL)?,/g);
    const comments = table.matchAll(/COMMENT ON COLUMN ".*"\."(.*)" IS '(.*)';/g);
    const tbl: any = { title: tableName[1], alias: '', description: '', properties: {}, required: [], formatter: [] };
    for (const column of columns) {
      tbl.properties[column[1]] = { type: typeResolver(column[2]) };
      if (column[3] && column[1] != 'id') {
        tbl.required.push(column[1]);
      }
    }
    for (const comment of comments) {
      tbl.properties[comment[1]].comment = comment[2];
    }
    return tbl;
  });
  //save to json
  fs.writeFileSync('src/configs/schema.json', JSON.stringify(tables, null, 2));
  console.log('done');
})();

function typeResolver(type: string) {
  //postgres types to JSON Type Definition
  switch (type) {
    case 'integer':
      return 'number';
    case 'bigint':
      return 'number';
    case 'double':
      return 'number';
    case 'character':
      return 'string';
    case 'boolean':
      return 'boolean';
    case 'jsonb':
      return ['object', 'string'];
    case 'real':
      return 'number';
    case 'double precision':
      return 'number';
    default:
      return 'wtf';
  }
}
