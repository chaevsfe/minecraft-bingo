# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..7

#file refinement

execute if score cree77 random_cluster matches 1 if score creeper_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score creeper_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:creeper_banner_pattern}

execute if score cree77 random_cluster matches 2 if score skull_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score skull_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:skull_banner_pattern}

execute if score cree77 random_cluster matches 3 if score mojang_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score mojang_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:mojang_banner_pattern}

execute if score cree77 random_cluster matches 4 if score globe_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score globe_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:globe_banner_pattern}

execute if score cree77 random_cluster matches 5 if score piglin_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score piglin_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:piglin_banner_pattern}

execute if score cree77 random_cluster matches 6 if score flow_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score flow_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:flow_banner_pattern}

execute if score cree77 random_cluster matches 7 if score guster_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score guster_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:guster_banner_pattern}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}