# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..17

#file refinement

execute if score cree77 random_cluster matches 1 if score shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:shulker_box}

execute if score cree77 random_cluster matches 2 if score white_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score white_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:white_shulker_box}

execute if score cree77 random_cluster matches 3 if score light_gray_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score light_gray_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_gray_shulker_box}

execute if score cree77 random_cluster matches 4 if score gray_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score gray_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gray_shulker_box}

execute if score cree77 random_cluster matches 5 if score black_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score black_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:black_shulker_box}

execute if score cree77 random_cluster matches 6 if score brown_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score brown_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:brown_shulker_box}

execute if score cree77 random_cluster matches 7 if score red_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score red_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_shulker_box}

execute if score cree77 random_cluster matches 8 if score orange_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score orange_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:orange_shulker_box}

execute if score cree77 random_cluster matches 9 if score yellow_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score yellow_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:yellow_shulker_box}

execute if score cree77 random_cluster matches 10 if score lime_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score lime_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lime_shulker_box}

execute if score cree77 random_cluster matches 11 if score green_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score green_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:green_shulker_box}

execute if score cree77 random_cluster matches 12 if score cyan_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score cyan_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cyan_shulker_box}

execute if score cree77 random_cluster matches 13 if score light_blue_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score light_blue_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_blue_shulker_box}

execute if score cree77 random_cluster matches 14 if score blue_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score blue_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blue_shulker_box}

execute if score cree77 random_cluster matches 15 if score purple_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score purple_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purple_shulker_box}

execute if score cree77 random_cluster matches 16 if score magenta_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score magenta_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:magenta_shulker_box}

execute if score cree77 random_cluster matches 17 if score pink_shulker_box bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score pink_shulker_box bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pink_shulker_box}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}