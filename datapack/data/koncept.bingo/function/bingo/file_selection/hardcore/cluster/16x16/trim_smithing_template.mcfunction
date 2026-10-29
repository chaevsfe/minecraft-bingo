# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..19

#file refinement

execute if score cree77 random_cluster matches 1 if score netherite_upgrade_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score netherite_upgrade_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_upgrade_smithing_template}

execute if score cree77 random_cluster matches 2 if score sentry_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score sentry_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sentry_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 3 if score vex_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score vex_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:vex_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 4 if score wild_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score wild_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wild_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 5 if score coast_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score coast_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:coast_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 6 if score dune_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score dune_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dune_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 7 if score wayfinder_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score wayfinder_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wayfinder_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 8 if score raiser_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score raiser_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:raiser_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 9 if score shaper_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score shaper_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:shaper_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 10 if score host_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score host_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:host_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 11 if score ward_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score ward_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ward_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 12 if score silence_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score silence_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:silence_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 13 if score tide_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score tide_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tide_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 14 if score snout_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score snout_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:snout_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 15 if score rib_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score rib_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:rib_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 16 if score eye_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score eye_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:eye_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 17 if score spire_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score spire_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:spire_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 18 if score flow_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score flow_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:flow_armor_trim_smithing_template}

execute if score cree77 random_cluster matches 19 if score bolt_armor_trim_smithing_template bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 19 if score bolt_armor_trim_smithing_template bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bolt_armor_trim_smithing_template}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}