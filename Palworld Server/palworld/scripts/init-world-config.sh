#!/bin/bash

echo "Initializing World Configuration"

PAL_WORLD_SETTINGS_FILEPATH="/palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini"

if [ -f "${PAL_WORLD_SETTINGS_FILEPATH}" ]; then
    echo "World Configuration File Found"
    echo "Removing World Configuration File"
    chmod u+rw "${PAL_WORLD_SETTINGS_FILEPATH}"
    rm ${PAL_WORLD_SETTINGS_FILEPATH}
fi

SETTINGS="OptionSettings=("
SETTINGS="${SETTINGS}Difficulty=${DIFFICULTY},"
SETTINGS="${SETTINGS}DayTimeSpeedRate=${DAY_TIME_SPEED_RATE},"
SETTINGS="${SETTINGS}NightTimeSpeedRate=${NIGHT_TIME_SPEED_RATE},"
SETTINGS="${SETTINGS}ExpRate=${EXP_RATE},"
SETTINGS="${SETTINGS}PalCaptureRate=${PAL_CAPTURE_RATE},"
SETTINGS="${SETTINGS}PalSpawnNumRate=${PAL_SPAWN_NUM_RATE},"
SETTINGS="${SETTINGS}PalDamageRateAttack=${PAL_DAMAGE_RATE_ATTACK},"
SETTINGS="${SETTINGS}PalDamageRateDefense=${PAL_DAMAGE_RATE_DEFENSE},"
SETTINGS="${SETTINGS}PlayerDamageRateAttack=${PLAYER_DAMAGE_RATE_ATTACK},"
SETTINGS="${SETTINGS}PlayerDamageRateDefense=${PLAYER_DAMAGE_RATE_DEFENSE},"
SETTINGS="${SETTINGS}PlayerStomachDecreaceRate=${PLAYER_STOMACH_DECREACE_RATE},"
SETTINGS="${SETTINGS}PlayerStaminaDecreaceRate=${PLAYER_STAMINA_DECREACE_RATE},"
SETTINGS="${SETTINGS}PlayerAutoHPRegeneRate=${PLAYER_AUTO_HP_REGENE_RATE},"
SETTINGS="${SETTINGS}PlayerAutoHpRegeneRateInSleep=${PLAYER_AUTO_HP_REGENE_RATE_IN_SLEEP},"
SETTINGS="${SETTINGS}PalStomachDecreaceRate=${PAL_STOMACH_DECREACE_RATE},"
SETTINGS="${SETTINGS}PalStaminaDecreaceRate=${PAL_STAMINA_DECREACE_RATE},"
SETTINGS="${SETTINGS}PalAutoHPRegeneRate=${PAL_AUTO_HP_REGENE_RATE},"
SETTINGS="${SETTINGS}PalAutoHpRegeneRateInSleep=${PAL_AUTO_HP_REGENE_RATE_IN_SLEEP},"
SETTINGS="${SETTINGS}BuildObjectDamageRate=${BUILD_OBJECT_DAMAGE_RATE},"
SETTINGS="${SETTINGS}BuildObjectDeteriorationDamageRate=${BUILD_OBJECT_DETERIORATION_DAMAGE_RATE},"
SETTINGS="${SETTINGS}CollectionDropRate=${COLLECTION_DROP_RATE},"
SETTINGS="${SETTINGS}CollectionObjectHpRate=${COLLECTION_OBJECT_HP_RATE},"
SETTINGS="${SETTINGS}CollectionObjectRespawnSpeedRate=${COLLECTION_OBJECT_RESPAWN_SPEED_RATE},"
SETTINGS="${SETTINGS}EnemyDropItemRate=${ENEMY_DROP_ITEM_RATE},"
SETTINGS="${SETTINGS}DeathPenalty=${DEATH_PENALTY},"
SETTINGS="${SETTINGS}bEnablePlayerToPlayerDamage=${ENABLE_PLAYER_TO_PLAYER_DAMAGE},"
SETTINGS="${SETTINGS}bEnableFriendlyFire=${ENABLE_FRIENDLY_FIRE},"
SETTINGS="${SETTINGS}bEnableInvaderEnemy=${ENABLE_INVADER_ENEMY},"
SETTINGS="${SETTINGS}bActiveUNKO=${ACTIVE_UNKO},"
SETTINGS="${SETTINGS}bEnableAimAssistPad=${ENABLE_AIM_ASSIST_PAD},"
SETTINGS="${SETTINGS}bEnableAimAssistKeyboard=${ENABLE_AIM_ASSIST_KEYBOARD},"
SETTINGS="${SETTINGS}DropItemMaxNum=${DROP_ITEM_MAX_NUM},"
SETTINGS="${SETTINGS}DropItemMaxNum_UNKO=${DROP_ITEM_MAX_NUM_UNKO},"
SETTINGS="${SETTINGS}BaseCampMaxNum=${BASE_CAMP_MAX_NUM},"
SETTINGS="${SETTINGS}BaseCampWorkerMaxNum=${BASE_CAMP_WORKER_MAX_NUM},"
SETTINGS="${SETTINGS}DropItemAliveMaxHours=${DROP_ITEM_ALIVE_MAX_HOURS},"
SETTINGS="${SETTINGS}bAutoResetGuildNoOnlinePlayers=${AUTO_RESET_GUILD_NO_ONLINE_PLAYERS},"
SETTINGS="${SETTINGS}AutoResetGuildTimeNoOnlinePlayers=${AUTO_RESET_GUILD_TIME_NO_ONLINE_PLAYERS},"
SETTINGS="${SETTINGS}GuildPlayerMaxNum=${GUILD_PLAYER_MAX_NUM},"
SETTINGS="${SETTINGS}PalEggDefaultHatchingTime=${PAL_EGG_DEFAULT_HATCHING_TIME},"
SETTINGS="${SETTINGS}WorkSpeedRate=${WORK_SPEED_RATE},"
SETTINGS="${SETTINGS}bIsMultiplay=${IS_MULTIPLAY},"
SETTINGS="${SETTINGS}bIsPvP=${IS_PVP},"
SETTINGS="${SETTINGS}bCanPickupOtherGuildDeathPenaltyDrop=${CAN_PICKUP_OTHER_GUILD_DEATH_PENALTY_DROP},"
SETTINGS="${SETTINGS}bEnableNonLoginPenalty=${ENABLE_NON_LOGIN_PENALTY},"
SETTINGS="${SETTINGS}bEnableFastTravel=${ENABLE_FAST_TRAVEL},"
SETTINGS="${SETTINGS}bIsStartLocationSelectByMap=${IS_START_LOCATION_SELECT_BY_MAP},"
SETTINGS="${SETTINGS}bExistPlayerAfterLogout=${EXIST_PLAYER_AFTER_LOGOUT},"
SETTINGS="${SETTINGS}bEnableDefenseOtherGuildPlayer=${ENABLE_DEFENSE_OTHER_GUILD_PLAYER},"
SETTINGS="${SETTINGS}CoopPlayerMaxNum=${COOP_PLAYER_MAX_NUM},"
SETTINGS="${SETTINGS}ServerPlayerMaxNum=${PLAYERS},"
SETTINGS="${SETTINGS}ServerName=\"${SERVER_NAME}\","
SETTINGS="${SETTINGS}ServerDescription=\"${SERVER_DESCRIPTION}\","
SETTINGS="${SETTINGS}AdminPassword=\"${ADMIN_PASSWORD}\","
SETTINGS="${SETTINGS}ServerPassword=\"${SERVER_PASSWORD}\","
SETTINGS="${SETTINGS}PublicPort=${PORT},"
SETTINGS="${SETTINGS}PublicIP=\"${PUBLIC_IP}\","
SETTINGS="${SETTINGS}RCONEnabled=${RCON_ENABLED},"
SETTINGS="${SETTINGS}RCONPort=${RCON_PORT},"
SETTINGS="${SETTINGS}Region=\"${REGION}\","
SETTINGS="${SETTINGS}bUseAuth=${USE_AUTH},"
SETTINGS="${SETTINGS}BanListURL=\"${BAN_LIST_URL}\""

SETTINGS="${SETTINGS})"

cat << EOF > "${PAL_WORLD_SETTINGS_FILEPATH}"
[/Script/Pal.PalGameWorldSettings]
${SETTINGS}


EOF

chown steam:steam "${PAL_WORLD_SETTINGS_FILEPATH}"
chmod u-wx "${PAL_WORLD_SETTINGS_FILEPATH}"

echo "Wrote World Configuration File"

cat "${PAL_WORLD_SETTINGS_FILEPATH}"