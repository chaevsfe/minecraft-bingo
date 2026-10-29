# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..17

#file refinement

execute if score cree77 random_cluster matches 1 if score terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:terracotta}

execute if score cree77 random_cluster matches 2 if score white_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score white_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:white_terracotta}

execute if score cree77 random_cluster matches 3 if score light_gray_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score light_gray_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_gray_terracotta}

execute if score cree77 random_cluster matches 4 if score gray_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score gray_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gray_terracotta}

execute if score cree77 random_cluster matches 5 if score black_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score black_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:black_terracotta}

execute if score cree77 random_cluster matches 6 if score brown_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score brown_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:brown_terracotta}

execute if score cree77 random_cluster matches 7 if score red_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score red_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_terracotta}

execute if score cree77 random_cluster matches 8 if score orange_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score orange_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:orange_terracotta}

execute if score cree77 random_cluster matches 9 if score yellow_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score yellow_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:yellow_terracotta}

execute if score cree77 random_cluster matches 10 if score lime_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score lime_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lime_terracotta}

execute if score cree77 random_cluster matches 11 if score green_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score green_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:green_terracotta}

execute if score cree77 random_cluster matches 12 if score cyan_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score cyan_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cyan_terracotta}

execute if score cree77 random_cluster matches 13 if score light_blue_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score light_blue_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_blue_terracotta}

execute if score cree77 random_cluster matches 14 if score blue_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score blue_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blue_terracotta}

execute if score cree77 random_cluster matches 15 if score purple_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score purple_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purple_terracotta}

execute if score cree77 random_cluster matches 16 if score magenta_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score magenta_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:magenta_terracotta}

execute if score cree77 random_cluster matches 17 if score pink_terracotta bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score pink_terracotta bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pink_terracotta}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}