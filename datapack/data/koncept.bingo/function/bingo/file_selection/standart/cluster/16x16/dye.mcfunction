# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..16

#file refinement

execute if score cree77 random_cluster matches 1 if score white_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score white_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:white_dye}

execute if score cree77 random_cluster matches 2 if score light_gray_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score light_gray_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_gray_dye}

execute if score cree77 random_cluster matches 3 if score gray_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score gray_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gray_dye}

execute if score cree77 random_cluster matches 4 if score black_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score black_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:black_dye}

execute if score cree77 random_cluster matches 5 if score brown_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score brown_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brown_dye}

execute if score cree77 random_cluster matches 6 if score red_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score red_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_dye}

execute if score cree77 random_cluster matches 7 if score orange_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score orange_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:orange_dye}

execute if score cree77 random_cluster matches 8 if score yellow_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score yellow_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:yellow_dye}

execute if score cree77 random_cluster matches 9 if score lime_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score lime_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lime_dye}

execute if score cree77 random_cluster matches 10 if score green_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score green_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:green_dye}

execute if score cree77 random_cluster matches 11 if score cyan_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cyan_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cyan_dye}

execute if score cree77 random_cluster matches 12 if score light_blue_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score light_blue_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_blue_dye}

execute if score cree77 random_cluster matches 13 if score blue_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score blue_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blue_dye}

execute if score cree77 random_cluster matches 14 if score purple_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score purple_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:purple_dye}

execute if score cree77 random_cluster matches 15 if score magenta_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score magenta_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:magenta_dye}

execute if score cree77 random_cluster matches 16 if score pink_dye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score pink_dye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pink_dye}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}