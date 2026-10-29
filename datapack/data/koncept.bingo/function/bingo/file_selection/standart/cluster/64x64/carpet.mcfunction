# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..16

#file refinement

execute if score cree77 random_cluster matches 1 if score white_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score white_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:white_carpet}

execute if score cree77 random_cluster matches 2 if score light_gray_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score light_gray_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_gray_carpet}

execute if score cree77 random_cluster matches 3 if score gray_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score gray_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gray_carpet}

execute if score cree77 random_cluster matches 4 if score black_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score black_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:black_carpet}

execute if score cree77 random_cluster matches 5 if score brown_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score brown_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:brown_carpet}

execute if score cree77 random_cluster matches 6 if score red_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score red_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_carpet}

execute if score cree77 random_cluster matches 7 if score orange_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score orange_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:orange_carpet}

execute if score cree77 random_cluster matches 8 if score yellow_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score yellow_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:yellow_carpet}

execute if score cree77 random_cluster matches 9 if score lime_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score lime_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lime_carpet}

execute if score cree77 random_cluster matches 10 if score green_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score green_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:green_carpet}

execute if score cree77 random_cluster matches 11 if score cyan_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cyan_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cyan_carpet}

execute if score cree77 random_cluster matches 12 if score light_blue_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score light_blue_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_blue_carpet}

execute if score cree77 random_cluster matches 13 if score blue_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score blue_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blue_carpet}

execute if score cree77 random_cluster matches 14 if score purple_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score purple_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purple_carpet}

execute if score cree77 random_cluster matches 15 if score magenta_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score magenta_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:magenta_carpet}

execute if score cree77 random_cluster matches 16 if score pink_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score pink_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pink_carpet}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}