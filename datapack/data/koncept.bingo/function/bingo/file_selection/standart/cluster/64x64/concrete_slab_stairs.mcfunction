# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..32

#file refinement

execute if score cree77 random_cluster matches 1 if score white_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score white_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:white_concrete_slab}

execute if score cree77 random_cluster matches 2 if score white_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score white_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:white_concrete_stairs}

execute if score cree77 random_cluster matches 3 if score light_gray_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score light_gray_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_gray_concrete_slab}

execute if score cree77 random_cluster matches 4 if score light_gray_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score light_gray_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_gray_concrete_stairs}

execute if score cree77 random_cluster matches 5 if score gray_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score gray_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gray_concrete_slab}

execute if score cree77 random_cluster matches 6 if score gray_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score gray_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gray_concrete_stairs}

execute if score cree77 random_cluster matches 7 if score black_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score black_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:black_concrete_slab}

execute if score cree77 random_cluster matches 8 if score black_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score black_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:black_concrete_stairs}

execute if score cree77 random_cluster matches 9 if score brown_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score brown_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:brown_concrete_slab}

execute if score cree77 random_cluster matches 10 if score brown_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score brown_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:brown_concrete_stairs}

execute if score cree77 random_cluster matches 11 if score red_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score red_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_concrete_slab}

execute if score cree77 random_cluster matches 12 if score red_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score red_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_concrete_stairs}

execute if score cree77 random_cluster matches 13 if score orange_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score orange_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:orange_concrete_slab}

execute if score cree77 random_cluster matches 14 if score orange_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score orange_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:orange_concrete_stairs}

execute if score cree77 random_cluster matches 15 if score yellow_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score yellow_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:yellow_concrete_slab}

execute if score cree77 random_cluster matches 16 if score yellow_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score yellow_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:yellow_concrete_stairs}

execute if score cree77 random_cluster matches 17 if score lime_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score lime_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lime_concrete_slab}

execute if score cree77 random_cluster matches 18 if score lime_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score lime_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lime_concrete_stairs}

execute if score cree77 random_cluster matches 19 if score green_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 19 if score green_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:green_concrete_slab}

execute if score cree77 random_cluster matches 20 if score green_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 20 if score green_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:green_concrete_stairs}

execute if score cree77 random_cluster matches 21 if score cyan_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 21 if score cyan_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cyan_concrete_slab}

execute if score cree77 random_cluster matches 22 if score cyan_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 22 if score cyan_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cyan_concrete_stairs}

execute if score cree77 random_cluster matches 23 if score light_blue_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 23 if score light_blue_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_blue_concrete_slab}

execute if score cree77 random_cluster matches 24 if score light_blue_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 24 if score light_blue_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_blue_concrete_stairs}

execute if score cree77 random_cluster matches 25 if score blue_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 25 if score blue_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blue_concrete_slab}

execute if score cree77 random_cluster matches 26 if score blue_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 26 if score blue_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blue_concrete_stairs}

execute if score cree77 random_cluster matches 27 if score purple_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 27 if score purple_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purple_concrete_slab}

execute if score cree77 random_cluster matches 28 if score purple_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 28 if score purple_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purple_concrete_stairs}

execute if score cree77 random_cluster matches 29 if score magenta_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 29 if score magenta_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:magenta_concrete_slab}

execute if score cree77 random_cluster matches 30 if score magenta_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 30 if score magenta_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:magenta_concrete_stairs}

execute if score cree77 random_cluster matches 31 if score pink_concrete_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 31 if score pink_concrete_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pink_concrete_slab}

execute if score cree77 random_cluster matches 32 if score pink_concrete_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 32 if score pink_concrete_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pink_concrete_stairs}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}