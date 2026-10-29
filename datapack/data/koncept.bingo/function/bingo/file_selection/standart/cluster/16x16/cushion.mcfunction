# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..16

#file refinement

execute if score cree77 random_cluster matches 1 if score white_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score white_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:white_cushion}

execute if score cree77 random_cluster matches 2 if score light_gray_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score light_gray_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_gray_cushion}

execute if score cree77 random_cluster matches 3 if score gray_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score gray_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gray_cushion}

execute if score cree77 random_cluster matches 4 if score black_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score black_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:black_cushion}

execute if score cree77 random_cluster matches 5 if score brown_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score brown_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brown_cushion}

execute if score cree77 random_cluster matches 6 if score red_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score red_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_cushion}

execute if score cree77 random_cluster matches 7 if score orange_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score orange_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:orange_cushion}

execute if score cree77 random_cluster matches 8 if score yellow_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score yellow_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:yellow_cushion}

execute if score cree77 random_cluster matches 9 if score lime_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score lime_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lime_cushion}

execute if score cree77 random_cluster matches 10 if score green_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score green_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:green_cushion}

execute if score cree77 random_cluster matches 11 if score cyan_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cyan_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cyan_cushion}

execute if score cree77 random_cluster matches 12 if score light_blue_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score light_blue_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_blue_cushion}

execute if score cree77 random_cluster matches 13 if score blue_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score blue_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blue_cushion}

execute if score cree77 random_cluster matches 14 if score purple_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score purple_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:purple_cushion}

execute if score cree77 random_cluster matches 15 if score magenta_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score magenta_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:magenta_cushion}

execute if score cree77 random_cluster matches 16 if score pink_cushion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score pink_cushion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pink_cushion}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}