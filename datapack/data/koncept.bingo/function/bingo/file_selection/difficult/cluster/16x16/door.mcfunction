# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..4

#file refinement

execute if score cree77 random_cluster matches 1 if score copper_door bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score copper_door bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_door}

execute if score cree77 random_cluster matches 2 if score exposed_copper_door bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score exposed_copper_door bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:exposed_copper_door}

execute if score cree77 random_cluster matches 3 if score weathered_copper_door bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score weathered_copper_door bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:weathered_copper_door}

execute if score cree77 random_cluster matches 4 if score oxidized_copper_door bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score oxidized_copper_door bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:oxidized_copper_door}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}