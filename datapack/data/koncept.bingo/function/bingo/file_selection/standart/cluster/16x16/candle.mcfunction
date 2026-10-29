# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..17

#file refinement

execute if score cree77 random_cluster matches 1 if score candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:candle}

execute if score cree77 random_cluster matches 2 if score white_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score white_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:white_candle}

execute if score cree77 random_cluster matches 3 if score light_gray_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score light_gray_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_gray_candle}

execute if score cree77 random_cluster matches 4 if score black_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score black_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:black_candle}

execute if score cree77 random_cluster matches 5 if score red_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score red_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_candle}

execute if score cree77 random_cluster matches 6 if score orange_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score orange_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:orange_candle}

execute if score cree77 random_cluster matches 7 if score pink_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score pink_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pink_candle}

execute if score cree77 random_cluster matches 8 if score magenta_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score magenta_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:magenta_candle}

execute if score cree77 random_cluster matches 9 if score purple_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score purple_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:purple_candle}

execute if score cree77 random_cluster matches 10 if score light_blue_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score light_blue_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_blue_candle}

execute if score cree77 random_cluster matches 11 if score cyan_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cyan_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cyan_candle}

execute if score cree77 random_cluster matches 12 if score green_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score green_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:green_candle}

execute if score cree77 random_cluster matches 13 if score lime_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score lime_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lime_candle}

execute if score cree77 random_cluster matches 14 if score yellow_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score yellow_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:yellow_candle}

execute if score cree77 random_cluster matches 15 if score blue_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score blue_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blue_candle}

execute if score cree77 random_cluster matches 16 if score brown_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score brown_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brown_candle}

execute if score cree77 random_cluster matches 17 if score gray_candle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score gray_candle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gray_candle}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}