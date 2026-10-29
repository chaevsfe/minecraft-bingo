# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..17

#file refinement

execute if score cree77 random_cluster matches 1 if score blue_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score blue_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blue_bundle}

execute if score cree77 random_cluster matches 2 if score brown_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score brown_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brown_bundle}

execute if score cree77 random_cluster matches 3 if score bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bundle}

execute if score cree77 random_cluster matches 4 if score cyan_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score cyan_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cyan_bundle}

execute if score cree77 random_cluster matches 5 if score gray_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score gray_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gray_bundle}

execute if score cree77 random_cluster matches 6 if score green_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score green_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:green_bundle}

execute if score cree77 random_cluster matches 7 if score light_blue_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score light_blue_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_blue_bundle}

execute if score cree77 random_cluster matches 8 if score light_gray_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score light_gray_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_gray_bundle}

execute if score cree77 random_cluster matches 9 if score lime_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score lime_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lime_bundle}

execute if score cree77 random_cluster matches 10 if score magenta_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score magenta_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:magenta_bundle}

execute if score cree77 random_cluster matches 11 if score orange_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score orange_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:orange_bundle}

execute if score cree77 random_cluster matches 12 if score pink_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score pink_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pink_bundle}

execute if score cree77 random_cluster matches 13 if score purple_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score purple_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:purple_bundle}

execute if score cree77 random_cluster matches 14 if score red_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score red_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_bundle}

execute if score cree77 random_cluster matches 15 if score white_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score white_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:white_bundle}

execute if score cree77 random_cluster matches 16 if score yellow_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score yellow_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:yellow_bundle}

execute if score cree77 random_cluster matches 17 if score black_bundle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score black_bundle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:black_bundle}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}