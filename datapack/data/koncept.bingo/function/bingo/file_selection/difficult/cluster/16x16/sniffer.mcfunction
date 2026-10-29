# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..5

#file refinement

execute if score cree77 random_cluster matches 1 if score sniffer_egg bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score sniffer_egg bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sniffer_egg}

execute if score cree77 random_cluster matches 2 if score torchflower_seeds bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score torchflower_seeds bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:torchflower_seeds}

execute if score cree77 random_cluster matches 3 if score pitcher_pod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score pitcher_pod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pitcher_pod}

execute if score cree77 random_cluster matches 4 if score torchflower bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score torchflower bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:torchflower}

execute if score cree77 random_cluster matches 5 if score pitcher_plant bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score pitcher_plant bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pitcher_plant}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}