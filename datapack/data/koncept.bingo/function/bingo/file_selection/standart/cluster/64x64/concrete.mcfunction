# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..16

#file refinement

execute if score cree77 random_cluster matches 1 if score white_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score white_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:white_concrete}

execute if score cree77 random_cluster matches 2 if score light_gray_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score light_gray_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_gray_concrete}

execute if score cree77 random_cluster matches 3 if score gray_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score gray_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gray_concrete}

execute if score cree77 random_cluster matches 4 if score black_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score black_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:black_concrete}

execute if score cree77 random_cluster matches 5 if score brown_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score brown_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:brown_concrete}

execute if score cree77 random_cluster matches 6 if score red_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score red_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_concrete}

execute if score cree77 random_cluster matches 7 if score orange_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score orange_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:orange_concrete}

execute if score cree77 random_cluster matches 8 if score yellow_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score yellow_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:yellow_concrete}

execute if score cree77 random_cluster matches 9 if score lime_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score lime_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lime_concrete}

execute if score cree77 random_cluster matches 10 if score green_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score green_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:green_concrete}

execute if score cree77 random_cluster matches 11 if score cyan_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cyan_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cyan_concrete}

execute if score cree77 random_cluster matches 12 if score light_blue_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score light_blue_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_blue_concrete}

execute if score cree77 random_cluster matches 13 if score blue_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score blue_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blue_concrete}

execute if score cree77 random_cluster matches 14 if score purple_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score purple_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purple_concrete}

execute if score cree77 random_cluster matches 15 if score magenta_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score magenta_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:magenta_concrete}

execute if score cree77 random_cluster matches 16 if score pink_concrete bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score pink_concrete bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pink_concrete}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}