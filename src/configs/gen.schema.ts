import fs from 'fs';
(async () => {
  //PostgreSQL database dump
  const sql = `CREATE SEQUENCE achievments_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."achievments" (
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


CREATE SEQUENCE character_duplicate_fines_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."character_duplicate_fines" (
    "id" integer DEFAULT nextval('character_duplicate_fines_id_seq') NOT NULL,
    "count_duplicates" integer NOT NULL,
    "fine_percent" real NOT NULL,
    CONSTRAINT "PK_7cc686657acd5142ed2664d1a38" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE character_levels_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."character_levels" (
    "id" integer DEFAULT nextval('character_levels_id_seq') NOT NULL,
    "level" integer NOT NULL,
    "from_exp" integer NOT NULL,
    "price" integer DEFAULT '100' NOT NULL,
    "efficiency_for_level" real DEFAULT '0.1' NOT NULL,
    CONSTRAINT "PK_eba1f582874d604b15f31e1d6cf" PRIMARY KEY ("id")
) WITH (oids = false);


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


CREATE SEQUENCE character_puzzle_chances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."character_puzzle_chances" (
    "id" integer DEFAULT nextval('character_puzzle_chances_id_seq') NOT NULL,
    "chance" real NOT NULL,
    "character_id" integer,
    CONSTRAINT "PK_2d2e84780a98566fec7465ac4e6" PRIMARY KEY ("id")
) WITH (oids = false);


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


CREATE SEQUENCE dialogs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."dialogs" (
    "id" integer DEFAULT nextval('dialogs_id_seq') NOT NULL,
    "messages" jsonb DEFAULT '[]' NOT NULL,
    CONSTRAINT "PK_75ffe676a97ca2eb5510ec88b11" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE en_lang_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."en_lang" (
    "id" integer DEFAULT nextval('en_lang_id_seq') NOT NULL,
    "key" character varying(64) NOT NULL,
    "type" character varying(64) NOT NULL,
    "text" character varying(255) NOT NULL,
    CONSTRAINT "PK_b031dd4ebe34dae40747b15d669" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE es_lang_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."es_lang" (
    "id" integer DEFAULT nextval('es_lang_id_seq') NOT NULL,
    "key" character varying(64) NOT NULL,
    "type" character varying(64) NOT NULL,
    "text" character varying(255) NOT NULL,
    CONSTRAINT "PK_9ca04bd5d694c4db4bec0bada68" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE floors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."floors" (
    "id" integer DEFAULT nextval('floors_id_seq') NOT NULL,
    "x-size" integer NOT NULL,
    "y-size" integer NOT NULL,
    CONSTRAINT "PK_dae78234002afa84842d3a08ee0" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE furniture_puzzle_chances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."furniture_puzzle_chances" (
    "id" integer DEFAULT nextval('furniture_puzzle_chances_id_seq') NOT NULL,
    "chance" real NOT NULL,
    "furniture_id" integer,
    CONSTRAINT "PK_7489b4d81f0e58049ff8ddeb4f4" PRIMARY KEY ("id")
) WITH (oids = false);


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


CREATE SEQUENCE logs_character_interactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_character_interactions" (
    "id" integer DEFAULT nextval('logs_character_interactions_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "character_id" integer NOT NULL,
    "action_name" character varying(64) NOT NULL,
    CONSTRAINT "PK_e7c8ca6861741b89a849281aa04" PRIMARY KEY ("id")
) WITH (oids = false);


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


CREATE SEQUENCE logs_furniture_interactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_furniture_interactions" (
    "id" integer DEFAULT nextval('logs_furniture_interactions_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "furniture_id" integer NOT NULL,
    "action" character varying(64) NOT NULL,
    CONSTRAINT "PK_bbd90ad6353ae3741c51e0edb64" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE logs_group_tiles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_group_tiles" (
    "id" integer DEFAULT nextval('logs_group_tiles_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "config_id" integer NOT NULL,
    "floor_id" integer NOT NULL,
    CONSTRAINT "PK_f21916bb7f80065eee1ad866e41" PRIMARY KEY ("id")
) WITH (oids = false);


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


CREATE SEQUENCE logs_player_gates_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_player_gates" (
    "id" integer DEFAULT nextval('logs_player_gates_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "action" character varying(64) NOT NULL,
    "ip" character varying(64),
    CONSTRAINT "PK_03b294a7dd9ffc9c63fed4b5156" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE logs_server_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_server" (
    "id" integer DEFAULT nextval('logs_server_id_seq') NOT NULL,
    "type" character varying(64) NOT NULL,
    "data" character varying(256) NOT NULL,
    "time" bigint NOT NULL,
    CONSTRAINT "PK_5fe068af8d227fd0865c05cad20" PRIMARY KEY ("id")
) WITH (oids = false);


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


CREATE SEQUENCE logs_user_achievments_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."logs_user_achievments" (
    "id" integer DEFAULT nextval('logs_user_achievments_id_seq') NOT NULL,
    "player_id" integer NOT NULL,
    "time" integer NOT NULL,
    "achievment_config_id" integer NOT NULL,
    CONSTRAINT "PK_45e370f2c2707f996847d643f1f" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE loot_box_group_chances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."loot_box_group_chances" (
    "id" integer DEFAULT nextval('loot_box_group_chances_id_seq') NOT NULL,
    "group_name" character varying(32) NOT NULL,
    "chance" real NOT NULL,
    "loot_box_id" integer,
    CONSTRAINT "PK_4cbf3702d86217f4dd3af01b305" PRIMARY KEY ("id")
) WITH (oids = false);


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


CREATE SEQUENCE loot_boxes_price_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."loot_boxes_price" (
    "id" integer DEFAULT nextval('loot_boxes_price_id_seq') NOT NULL,
    "bought_count" integer NOT NULL,
    "price" integer NOT NULL,
    CONSTRAINT "PK_b19abf5282441dc7f4960e0ea2e" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE max_by_group_tiles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."max_by_group_tiles" (
    "id" integer DEFAULT nextval('max_by_group_tiles_id_seq') NOT NULL,
    "count_group_tiles" integer NOT NULL,
    "max_prestige" integer NOT NULL,
    "max_soft_currency" integer NOT NULL,
    "max_friends" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "PK_76781ca5675f6bd56799ef4fccb" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE player_chains_progress_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_chains_progress" (
    "id" integer DEFAULT nextval('player_chains_progress_id_seq') NOT NULL,
    "chainId" integer,
    "actionId" integer,
    CONSTRAINT "PK_a6cb7bee2378fb161e9e4cb8619" PRIMARY KEY ("id")
) WITH (oids = false);


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


CREATE SEQUENCE player_consumables_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_consumables" (
    "id" integer DEFAULT nextval('player_consumables_id_seq') NOT NULL,
    "count" integer DEFAULT '0' NOT NULL,
    "playerId" integer,
    "configId" integer,
    CONSTRAINT "PK_cd589ace9cad98f7700a7dc49af" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE player_floors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_floors" (
    "id" integer DEFAULT nextval('player_floors_id_seq') NOT NULL,
    "soft_currency" integer DEFAULT '0' NOT NULL,
    "playerId" integer,
    "configId" integer,
    CONSTRAINT "PK_db011a6abd929a153aadf700b1d" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE player_furnitures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_furnitures" (
    "id" integer DEFAULT nextval('player_furnitures_id_seq') NOT NULL,
    "sector" integer NOT NULL,
    "position" jsonb NOT NULL,
    "look_at" jsonb NOT NULL,
    "wall_pos" integer DEFAULT '0' NOT NULL,
    "nft_key" character varying NOT NULL,
    "placed" boolean DEFAULT false NOT NULL,
    "for_collect" boolean DEFAULT false NOT NULL,
    "playerId" integer,
    "configId" integer,
    CONSTRAINT "PK_4157dafd7f1be29224c01ff9007" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE player_letters_conditions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_letters_conditions" (
    "id" integer DEFAULT nextval('player_letters_conditions_id_seq') NOT NULL,
    "taken_items" boolean DEFAULT false NOT NULL,
    "read_time" integer NOT NULL,
    "letterId" integer,
    "userId" integer,
    CONSTRAINT "PK_49832cbc3415133bb1fd329c76e" PRIMARY KEY ("id"),
    CONSTRAINT "REL_5ea1559df0219d558302f5dc4a" UNIQUE ("letterId")
) WITH (oids = false);


CREATE SEQUENCE player_loot_boxes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_loot_boxes" (
    "id" integer DEFAULT nextval('player_loot_boxes_id_seq') NOT NULL,
    "items" jsonb NOT NULL,
    "playerId" integer,
    "configId" integer,
    CONSTRAINT "PK_c7492a634128c3ff08e06163a73" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE player_things_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."player_things" (
    "id" integer DEFAULT nextval('player_things_id_seq') NOT NULL,
    "playerId" integer,
    "configId" integer,
    CONSTRAINT "PK_c558d62039b2e33979cb29caf0e" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE players_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."players" (
    "id" integer DEFAULT nextval('players_id_seq') NOT NULL,
    "account_id" integer NOT NULL,
    "online" boolean DEFAULT false NOT NULL,
    "save_lock" boolean DEFAULT false NOT NULL,
    "soft_currency" bigint DEFAULT '0' NOT NULL,
    "achievments" jsonb NOT NULL,
    "achievment_counter" jsonb NOT NULL,
    "loot_boxes" integer DEFAULT '0' NOT NULL,
    "loot_box_time" integer DEFAULT '0' NOT NULL,
    "last_join" bigint NOT NULL,
    "groups_tiles" jsonb NOT NULL,
    "support_percents" jsonb NOT NULL,
    "block" jsonb NOT NULL,
    "reg_ip" character varying(64) DEFAULT 'none' NOT NULL,
    "reg_time" integer NOT NULL,
    "last_ip" character varying(64) DEFAULT 'none' NOT NULL,
    "last_sector" integer DEFAULT '0' NOT NULL,
    "buffs" jsonb DEFAULT '[]' NOT NULL,
    CONSTRAINT "PK_de22b8fdeee0c33ab55ae71da3b" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE raid_cells_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."raid_cells" (
    "id" integer DEFAULT nextval('raid_cells_id_seq') NOT NULL,
    "cells_count" integer NOT NULL,
    "prestige" integer NOT NULL,
    CONSTRAINT "PK_ed4a633dedf7d1cba470a72dddd" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE raid_count_items_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."raid_count_items" (
    "id" integer DEFAULT nextval('raid_count_items_id_seq') NOT NULL,
    "min" integer NOT NULL,
    "max" integer NOT NULL,
    CONSTRAINT "PK_39ccbec81ace0dcfd54ab0a775e" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE raid_locations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."raid_locations" (
    "id" integer DEFAULT nextval('raid_locations_id_seq') NOT NULL,
    "name" character varying(64) NOT NULL,
    "icon" character varying(64) NOT NULL,
    "loot_box_id" integer,
    CONSTRAINT "PK_9786af22003b4b82f14e123c453" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE ru_lang_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ru_lang" (
    "id" integer DEFAULT nextval('ru_lang_id_seq') NOT NULL,
    "key" character varying(64) NOT NULL,
    "type" character varying(64) NOT NULL,
    "text" character varying(255) NOT NULL,
    CONSTRAINT "PK_3c463fccfcf49f89816d4ad5859" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE things_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."things" (
    "id" integer DEFAULT nextval('things_id_seq') NOT NULL,
    "group" integer NOT NULL,
    "name" character varying(128) NOT NULL,
    "icon" character varying(64) NOT NULL,
    "description" character varying(255) NOT NULL,
    CONSTRAINT "PK_b19ac605b3912ed10128f2ac322" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE unique_action_relations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."unique_action_relations" (
    "id" integer DEFAULT nextval('unique_action_relations_id_seq') NOT NULL,
    "first_character_id" integer,
    "second_character_id" integer,
    "is_start" boolean DEFAULT false NOT NULL,
    "chain_id" integer,
    "action_id" integer,
    "dialog_id" integer,
    "achievment_id" integer,
    "next_action_id" integer,
    CONSTRAINT "PK_5ef12bf745bfed22566615995f0" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE unique_actions_chains_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."unique_actions_chains" (
    "id" integer DEFAULT nextval('unique_actions_chains_id_seq') NOT NULL,
    "name" character varying(64) NOT NULL,
    CONSTRAINT "PK_54304ede8c44b6c0132463db3fe" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE SEQUENCE unique_translates_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."unique_translates" (
    "id" integer DEFAULT nextval('unique_translates_id_seq') NOT NULL,
    "lang_key" character varying(8) NOT NULL,
    "group" character varying(64) NOT NULL,
    "content" character varying(512) NOT NULL,
    CONSTRAINT "PK_e689693c4932e128a5c78460b4c" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."character_puzzle_chances" ADD CONSTRAINT "FK_3990c6e029384684f70e44de9a0" FOREIGN KEY (character_id) REFERENCES characters(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."characters_requirements" ADD CONSTRAINT "FK_914fccb72831479451b2c8dd55c" FOREIGN KEY (character_id) REFERENCES characters(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."furniture_puzzle_chances" ADD CONSTRAINT "FK_75a3b24ce15dbd82228b96d801e" FOREIGN KEY (furniture_id) REFERENCES furnitures(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."letters" ADD CONSTRAINT "FK_8f666caed989585e290c766d37b" FOREIGN KEY ("senderId") REFERENCES players(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."letters" ADD CONSTRAINT "FK_ddbb9b0aca484d1bcc411a2eb68" FOREIGN KEY ("recipientId") REFERENCES players(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."loot_box_group_chances" ADD CONSTRAINT "FK_49481741dd7e082186e8a4095da" FOREIGN KEY (loot_box_id) REFERENCES loot_boxes(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."loot_box_items" ADD CONSTRAINT "FK_99d4f3c2dd1876865c86eb12188" FOREIGN KEY (loot_box_id) REFERENCES loot_boxes(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."player_chains_progress" ADD CONSTRAINT "FK_9b7402769cb8c2d636dc75447d5" FOREIGN KEY ("actionId") REFERENCES actions(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."player_chains_progress" ADD CONSTRAINT "FK_c0b81f7c70ebe06b9f41e4bc813" FOREIGN KEY ("chainId") REFERENCES unique_action_relations(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."player_characters" ADD CONSTRAINT "FK_0b9e4d0568c361c6d6691c47580" FOREIGN KEY ("configId") REFERENCES characters(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."player_characters" ADD CONSTRAINT "FK_71508be5c33f3e0fc728dd2c28e" FOREIGN KEY ("playerId") REFERENCES players(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."player_consumables" ADD CONSTRAINT "FK_31b0d5a2c528dfd4ca9506ed366" FOREIGN KEY ("playerId") REFERENCES players(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."player_consumables" ADD CONSTRAINT "FK_b5b0ac2dc5fa8c2e040ec5196aa" FOREIGN KEY ("configId") REFERENCES consumables(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."player_floors" ADD CONSTRAINT "FK_186577e8aa9a10d703b8b833827" FOREIGN KEY ("playerId") REFERENCES players(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."player_floors" ADD CONSTRAINT "FK_b1cde16479fba7b02d71bb054b3" FOREIGN KEY ("configId") REFERENCES floors(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."player_furnitures" ADD CONSTRAINT "FK_4095196e1f3d080d4756421ed4f" FOREIGN KEY ("configId") REFERENCES furnitures(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."player_furnitures" ADD CONSTRAINT "FK_edbbab14a51f2b108e5ee5bd0ad" FOREIGN KEY ("playerId") REFERENCES players(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."player_letters_conditions" ADD CONSTRAINT "FK_5ea1559df0219d558302f5dc4a0" FOREIGN KEY ("letterId") REFERENCES letters(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."player_letters_conditions" ADD CONSTRAINT "FK_a802b91640c8115b310046a6013" FOREIGN KEY ("userId") REFERENCES players(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."player_loot_boxes" ADD CONSTRAINT "FK_d125eb155f16c080d2bdf42de38" FOREIGN KEY ("configId") REFERENCES loot_boxes(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."player_loot_boxes" ADD CONSTRAINT "FK_e48e5745244a2e887088527b462" FOREIGN KEY ("playerId") REFERENCES players(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."player_things" ADD CONSTRAINT "FK_abdaab317c4cdfd3d343ecd9070" FOREIGN KEY ("configId") REFERENCES things(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."player_things" ADD CONSTRAINT "FK_d48e0b2f62d2acead6f7693cd0a" FOREIGN KEY ("playerId") REFERENCES players(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."raid_locations" ADD CONSTRAINT "FK_375d41d99da57b8e046da04b7fe" FOREIGN KEY (loot_box_id) REFERENCES loot_boxes(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."unique_action_relations" ADD CONSTRAINT "FK_1940a035718e0ea0f032d75a93d" FOREIGN KEY (dialog_id) REFERENCES dialogs(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."unique_action_relations" ADD CONSTRAINT "FK_2770d0725d8cbb498f0da645537" FOREIGN KEY (second_character_id) REFERENCES characters(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."unique_action_relations" ADD CONSTRAINT "FK_2a42bd48c6b45f4e21fa3ac9eac" FOREIGN KEY (chain_id) REFERENCES unique_actions_chains(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."unique_action_relations" ADD CONSTRAINT "FK_9cc417428fee44bbd94658ea750" FOREIGN KEY (action_id) REFERENCES actions(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."unique_action_relations" ADD CONSTRAINT "FK_a023200067372c0b2ccd74d1ffd" FOREIGN KEY (first_character_id) REFERENCES characters(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."unique_action_relations" ADD CONSTRAINT "FK_b015ad2b0c6488f8a1c40f04500" FOREIGN KEY (achievment_id) REFERENCES achievments(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."unique_action_relations" ADD CONSTRAINT "FK_f2d21d5f6fae726d2f43cf39f97" FOREIGN KEY (next_action_id) REFERENCES actions(id) NOT DEFERRABLE;

-- 2023-11-11 13:41:11.733624+03`;

  //convert to JSON Type Definition

  const req_tables = [
    'achievments',
    'actions',
    'buffs',
    'characters',
    'character_duplicate_fines',
    'character_levels',
    'character_perks',
    'characters_requirements',
    'constants',
    'consumables',
    'dialogs',
    'floors',
    'furnitures',
    'groups_tiles',
    'loot_boxes',
    'loot_box_group_chances',
    'loot_box_items',
    'loot_boxes_price',
    'max_by_group_tiles',
    'character_puzzle_chances',
    'furniture_puzzle_chances',
    'raid_cells',
    'raid_count_items',
    'raid_locations',
    'things',
    'unique_action_relations',
    'unique_actions_chains',
  ];

  const parsed = sql.split('\n\n\n');
  const fks = parsed.pop();
  const tables = parsed.reduce((acc: any, curr) => {
    const tableName = curr.match(/CREATE TABLE ".*"\."(.*)" \(/);
    const columns = curr.matchAll(/ "(.*)" (\w*).*? ?(NOT NULL)?,/g);
    const comments = curr.matchAll(/COMMENT ON COLUMN ".*"\."(.*)" IS '(.*)';/g);
    const tbl: any = { alias: '', description: '', properties: {}, formatter: [], type: 'object' };

    for (const column of columns) {
      if (column[1].includes('.')) continue;
      const type = typeResolver(column[2]);
      const format = formatResolver(column[2]);
      tbl.properties[column[1]] = { type: type, comment: '', ...(format ? { format: format } : {}) };
      if (column[3]) {
        // tbl.required.push(column[1]);
      } else {
        tbl.properties[column[1]].nullable = true;
      }
    }
    for (const comment of comments) {
      tbl.properties[comment[1]].comment = comment[2];
    }
    if (req_tables.includes(tableName[1])) {
      acc[tableName[1]] = tbl;
    }
    return acc;
  }, {});
  for (const fk of fks.split('\n')) {
    //ALTER TABLE ONLY "public"."unique_action_relations" ADD CONSTRAINT "FK_a023200067372c0b2ccd74d1ffd" FOREIGN KEY (first_character_id) REFERENCES characters(id) NOT DEFERRABLE;
    const fkName = fk.match(/ALTER TABLE ONLY ".*"\."(.*)" ADD CONSTRAINT "(.*)" FOREIGN KEY \((.*)\) REFERENCES (.*)\((.*)\) NOT DEFERRABLE;/);
    if (!fkName) continue;
    if (tables[fkName[1]]) {
      tables[fkName[1]].properties[fkName[3]].ref = fkName[4];
    }
  }
  //save to json
  fs.writeFileSync('src/public/schema.json', JSON.stringify(tables, null, 2));
})();
function formatResolver(type: string) {
  switch (type) {
    case 'jsonb':
      return 'json';
    default:
      return undefined;
  }
}
function typeResolver(type: string) {
  //postgres types to JSON Type Definition
  switch (type) {
    case 'integer':
      return 'integer';
    case 'bigint':
      return 'integer';
    case 'double':
      return 'number';
    case 'character':
      return 'string';
    case 'boolean':
      return 'boolean';
    case 'jsonb':
      return 'string';
    case 'real':
      return 'number';
    case 'double precision':
      return 'number';
    default:
      return 'wtf';
  }
}
