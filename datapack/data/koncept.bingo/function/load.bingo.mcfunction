# Project created by the koncept

execute unless entity @a run schedule function koncept.bingo:load.bingo 1t replace

# Gamerule
gamerule command_block_output false
gamerule send_command_feedback false

# Check game version
scoreboard objectives add bingo.check_game_version dummy

scoreboard objectives add bingo.companion dummy

execute as @a at @s store result score @s bingo.check_game_version run data get entity @s DataVersion

tellraw @a[scores={bingo.check_game_version=..5022}] ["",{"text":"Error","color":"red",hover_event:{action:'show_text',value:"You need to upgrade to the appropriate version of the game or download the appropriate version of the data pack."}},{"text":". The Bingo data pack is designed for Minecraft version 26.3","color":"red",hover_event:{action:'show_text',value:"You need to upgrade to the appropriate version of the game or download the appropriate version of the data pack.","color":"red"}}]

tellraw @a[scores={bingo.check_game_version=5024..}] ["",{"text":"Error","color":"red",hover_event:{action:'show_text',value:"You need to upgrade to the appropriate version of the game or download the appropriate version of the Data Package."}},{"text":". The Bingo data pack is designed for Minecraft version 26.3","color":"red",hover_event:{action:'show_text',value:"You need to upgrade to the appropriate version of the game or download the appropriate version of the data pack.","color":"red"}}]

execute unless score mod bingo.companion matches 1 run tellraw @a[scores={bingo.check_game_version=5023}] {"text":"Bingo v26.3 [26.3] data pack activated","color":"#8CF657",hover_event:{action:'show_text',value:"This message is displayed when updating data pack."}}

scoreboard objectives remove bingo.check_game_version

# Check on resourcepack
tellraw @a {"translate":"Error. You haven't installed resource pack Bingo v26.3 [26.3]!","color":"red",hover_event:{action:'show_text',value:"This message is displayed when updating data pack."},"with":[{"text":"You have successfully installed the resource pack Bingo for the datapack Bingo version v26.3 [26.3]!","color":"#8CF657",hover_event:{action:'show_text',value:"This message is displayed when updating data pack."},"color":"#8CF657",hover_event:{action:'show_text',value:"This message is displayed when updating data pack."}}]}

### Scoreboard

# Dynamic Locator Bar 
scoreboard objectives add bingo.dynamic.locator.bar dummy

scoreboard objectives add bingo.dynamic.locator.bar.enabled trigger
scoreboard objectives add bingo.dynamic.locator.bar.disabled trigger

# Dynamic Advancement 
scoreboard objectives add bingo.dynamic.advancement.enabled trigger
scoreboard objectives add bingo.dynamic.advancement.disabled trigger

scoreboard objectives add bingo.dynamic.advancement dummy
scoreboard players add dynamic bingo.dynamic.advancement 1
scoreboard players remove dynamic bingo.dynamic.advancement 1

scoreboard objectives add bingo.settings.icon.size_1 trigger
scoreboard objectives add bingo.settings.icon.size_2 trigger

scoreboard objectives add bingo.name.check.list.object_start trigger

scoreboard objectives add bingo.name.check.list.object_1 trigger
scoreboard objectives add bingo.name.check.list.object_2 trigger
scoreboard objectives add bingo.name.check.list.object_3 trigger
scoreboard objectives add bingo.name.check.list.object_4 trigger
scoreboard objectives add bingo.name.check.list.object_5 trigger
scoreboard objectives add bingo.name.check.list.object_6 trigger
scoreboard objectives add bingo.name.check.list.object_7 trigger
scoreboard objectives add bingo.name.check.list.object_8 trigger
scoreboard objectives add bingo.name.check.list.object_9 trigger
scoreboard objectives add bingo.name.check.list.object_10 trigger
scoreboard objectives add bingo.name.check.list.object_11 trigger
scoreboard objectives add bingo.name.check.list.object_12 trigger
scoreboard objectives add bingo.name.check.list.object_13 trigger
scoreboard objectives add bingo.name.check.list.object_14 trigger
scoreboard objectives add bingo.name.check.list.object_15 trigger
scoreboard objectives add bingo.name.check.list.object_16 trigger
scoreboard objectives add bingo.name.check.list.object_17 trigger
scoreboard objectives add bingo.name.check.list.object_18 trigger
scoreboard objectives add bingo.name.check.list.object_19 trigger
scoreboard objectives add bingo.name.check.list.object_20 trigger
scoreboard objectives add bingo.name.check.list.object_21 trigger
scoreboard objectives add bingo.name.check.list.object_22 trigger
scoreboard objectives add bingo.name.check.list.object_23 trigger
scoreboard objectives add bingo.name.check.list.object_24 trigger
scoreboard objectives add bingo.name.check.list.object_25 trigger

scoreboard objectives add .bingo.rules trigger
scoreboard objectives add .bingo.start trigger

scoreboard objectives add bingo.space dummy
scoreboard objectives add bingo.vertical dummy

scoreboard objectives add bingo.no.timer.visibility dummy

scoreboard objectives add bingo.macro.number.adv dummy

scoreboard objectives add bingo.random_start dummy

scoreboard objectives add bingo.number.id.player dummy

scoreboard players add ultimate bingo.number.id.player 1
scoreboard players remove ultimate bingo.number.id.player 1
scoreboard objectives add bingo.timer_count dummy

scoreboard objectives add bingo.timer.game dummy
scoreboard players add s bingo.timer.game 1
scoreboard players add t bingo.timer.game 1
scoreboard players add m bingo.timer.game 1
scoreboard players add h bingo.timer.game 1
scoreboard players remove s bingo.timer.game 1
scoreboard players remove t bingo.timer.game 1
scoreboard players remove m bingo.timer.game 1
scoreboard players remove h bingo.timer.game 1
scoreboard players set $constant_10 bingo.timer.game 10

scoreboard objectives add bingo.type.tp dummy

scoreboard objectives add bingo.random dummy

scoreboard objectives add bingo.restart.replay dummy

scoreboard objectives add bingo.count.object dummy

scoreboard objectives add bingo.timer.game.settings dummy

scoreboard objectives add bottom.gui.Scale trigger

scoreboard objectives add bingo.reset.settings trigger

scoreboard objectives add bingo.timer.game.yes trigger
scoreboard objectives add bingo.timer.game.no trigger


scoreboard objectives add bingo.start.enable.trigger dummy

scoreboard objectives add bingo.start.launch.receipt dummy

execute unless score start bingo.start.launch.receipt matches 1 run scoreboard players set start bingo.start.launch.receipt 0

scoreboard objectives add bingo.tp_yes trigger
scoreboard objectives add bingo.tp_no trigger

scoreboard objectives add bingo.adjustment_1 trigger
scoreboard objectives add bingo.adjustment_2 trigger
scoreboard objectives add bingo.adjustment_3 trigger
scoreboard objectives add bingo.adjustment_4 trigger
scoreboard objectives add bingo.adjustment_5 trigger
scoreboard objectives add bingo.adjustment_6 trigger

scoreboard objectives add bingo.items_bottom_1 trigger
scoreboard objectives add bingo.items_bottom_2 trigger
scoreboard objectives add bingo.items_bottom_3 trigger
scoreboard objectives add bingo.items_bottom_4 trigger
scoreboard objectives add bingo.items_bottom_5 trigger
scoreboard objectives add bingo.items_bottom_6 trigger

scoreboard objectives add bingo.items_top trigger

scoreboard objectives add .bingo.settings trigger
scoreboard objectives add bingo.reset trigger

scoreboard objectives add bingo.icon.size dummy

scoreboard objectives add bingo.startYes trigger

scoreboard objectives add bingo.team.join.red trigger
scoreboard objectives add bingo.team.join.dark_red trigger
scoreboard objectives add bingo.team.join.yellow trigger
scoreboard objectives add bingo.team.join.gold trigger
scoreboard objectives add bingo.team.join.white trigger
scoreboard objectives add bingo.team.join.aqua trigger
scoreboard objectives add bingo.team.join.green trigger
scoreboard objectives add bingo.team.join.blue trigger
scoreboard objectives add bingo.team.join.light_purple trigger


scoreboard objectives add bingo.vote.type dummy
scoreboard objectives add bingo.companion dummy

scoreboard objectives add bingo.vote.line trigger
scoreboard objectives add bingo.vote.cross trigger
scoreboard objectives add bingo.vote.full_house trigger

scoreboard objectives add bingo.vote.standart trigger
scoreboard objectives add bingo.vote.difficult trigger
scoreboard objectives add bingo.vote.hardcore trigger
