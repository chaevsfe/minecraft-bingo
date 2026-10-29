# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..17

#file refinement

execute if score cree77 random_cluster matches 1 if score wooden_axe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score wooden_axe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wooden_axe}

execute if score cree77 random_cluster matches 2 if score white_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score white_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:white_harness}

execute if score cree77 random_cluster matches 3 if score light_gray_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score light_gray_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_gray_harness}

execute if score cree77 random_cluster matches 4 if score gray_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score gray_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gray_harness}

execute if score cree77 random_cluster matches 5 if score black_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score black_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:black_harness}

execute if score cree77 random_cluster matches 6 if score brown_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score brown_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brown_harness}

execute if score cree77 random_cluster matches 7 if score red_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score red_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_harness}

execute if score cree77 random_cluster matches 8 if score orange_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score orange_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:orange_harness}

execute if score cree77 random_cluster matches 9 if score yellow_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score yellow_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:yellow_harness}

execute if score cree77 random_cluster matches 10 if score lime_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score lime_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lime_harness}

execute if score cree77 random_cluster matches 11 if score green_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score green_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:green_harness}

execute if score cree77 random_cluster matches 12 if score cyan_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score cyan_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cyan_harness}

execute if score cree77 random_cluster matches 13 if score light_blue_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score light_blue_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_blue_harness}

execute if score cree77 random_cluster matches 14 if score blue_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score blue_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blue_harness}

execute if score cree77 random_cluster matches 15 if score purple_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score purple_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:purple_harness}

execute if score cree77 random_cluster matches 16 if score magenta_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score magenta_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:magenta_harness}

execute if score cree77 random_cluster matches 17 if score pink_harness bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score pink_harness bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pink_harness}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}