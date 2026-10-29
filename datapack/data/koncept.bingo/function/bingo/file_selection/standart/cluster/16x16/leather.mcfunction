# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..5

#file refinement

execute if score cree77 random_cluster matches 1 if score leather_helmet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score leather_helmet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:leather_helmet}

execute if score cree77 random_cluster matches 2 if score leather_chestplate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score leather_chestplate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:leather_chestplate}

execute if score cree77 random_cluster matches 3 if score leather_leggings bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score leather_leggings bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:leather_leggings}

execute if score cree77 random_cluster matches 4 if score leather_boots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score leather_boots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:leather_boots}

execute if score cree77 random_cluster matches 5 if score leather_horse_armor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score leather_horse_armor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:leather_horse_armor}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}