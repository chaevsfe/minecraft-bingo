# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..5

#file refinement

execute if score cree77 random_cluster matches 1 if score sculk bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score sculk bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sculk}

execute if score cree77 random_cluster matches 2 if score sculk_catalyst bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score sculk_catalyst bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sculk_catalyst}

execute if score cree77 random_cluster matches 3 if score sculk_shrieker bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score sculk_shrieker bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sculk_shrieker}

execute if score cree77 random_cluster matches 4 if score sculk_sensor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score sculk_sensor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sculk_sensor}

execute if score cree77 random_cluster matches 5 if score calibrated_sculk_sensor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score calibrated_sculk_sensor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:calibrated_sculk_sensor}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}