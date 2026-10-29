# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..17

#file refinement

execute if score cree77 random_cluster matches 1 if score white_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score white_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:white_bed}

execute if score cree77 random_cluster matches 2 if score light_gray_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score light_gray_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_gray_bed}

execute if score cree77 random_cluster matches 3 if score gray_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score gray_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gray_bed}

execute if score cree77 random_cluster matches 4 if score black_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score black_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:black_bed}

execute if score cree77 random_cluster matches 5 if score brown_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score brown_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:brown_bed}

execute if score cree77 random_cluster matches 6 if score red_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score red_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_bed}

execute if score cree77 random_cluster matches 7 if score orange_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score orange_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:orange_bed}

execute if score cree77 random_cluster matches 8 if score yellow_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score yellow_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:yellow_bed}

execute if score cree77 random_cluster matches 9 if score lime_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score lime_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lime_bed}

execute if score cree77 random_cluster matches 10 if score green_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score green_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:green_bed}

execute if score cree77 random_cluster matches 11 if score cyan_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cyan_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cyan_bed}

execute if score cree77 random_cluster matches 12 if score light_blue_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score light_blue_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_blue_bed}

execute if score cree77 random_cluster matches 13 if score blue_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score blue_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blue_bed}

execute if score cree77 random_cluster matches 14 if score purple_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score purple_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purple_bed}

execute if score cree77 random_cluster matches 15 if score magenta_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score magenta_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:magenta_bed}

execute if score cree77 random_cluster matches 16 if score pink_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score pink_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pink_bed}

execute if score cree77 random_cluster matches 17 if score straw_bed bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score straw_bed bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:straw_bed}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}