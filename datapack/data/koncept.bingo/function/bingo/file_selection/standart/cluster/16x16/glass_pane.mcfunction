# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..17

#file refinement

execute if score cree77 random_cluster matches 1 if score black_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score black_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:black_stained_glass_pane}

execute if score cree77 random_cluster matches 2 if score blue_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score blue_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blue_stained_glass_pane}

execute if score cree77 random_cluster matches 3 if score brown_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score brown_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brown_stained_glass_pane}

execute if score cree77 random_cluster matches 4 if score cyan_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score cyan_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cyan_stained_glass_pane}

execute if score cree77 random_cluster matches 5 if score glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:glass_pane}

execute if score cree77 random_cluster matches 6 if score gray_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score gray_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gray_stained_glass_pane}

execute if score cree77 random_cluster matches 7 if score green_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score green_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:green_stained_glass_pane}

execute if score cree77 random_cluster matches 8 if score light_blue_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score light_blue_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_blue_stained_glass_pane}

execute if score cree77 random_cluster matches 9 if score light_gray_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score light_gray_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:light_gray_stained_glass_pane}

execute if score cree77 random_cluster matches 10 if score lime_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score lime_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lime_stained_glass_pane}

execute if score cree77 random_cluster matches 11 if score magenta_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score magenta_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:magenta_stained_glass_pane}

execute if score cree77 random_cluster matches 12 if score orange_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score orange_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:orange_stained_glass_pane}

execute if score cree77 random_cluster matches 13 if score pink_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score pink_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pink_stained_glass_pane}

execute if score cree77 random_cluster matches 14 if score purple_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score purple_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:purple_stained_glass_pane}

execute if score cree77 random_cluster matches 15 if score red_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score red_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_stained_glass_pane}

execute if score cree77 random_cluster matches 16 if score white_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score white_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:white_stained_glass_pane}

execute if score cree77 random_cluster matches 17 if score yellow_stained_glass_pane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score yellow_stained_glass_pane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:yellow_stained_glass_pane}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}