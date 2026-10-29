# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..5

#file refinement

execute if score cree77 random_cluster matches 1 if score wooden_axe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score wooden_axe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wooden_axe}

execute if score cree77 random_cluster matches 2 if score wooden_hoe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score wooden_hoe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wooden_hoe}

execute if score cree77 random_cluster matches 3 if score wooden_pickaxe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score wooden_pickaxe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wooden_pickaxe}

execute if score cree77 random_cluster matches 4 if score wooden_shovel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score wooden_shovel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wooden_shovel}

execute if score cree77 random_cluster matches 5 if score wooden_sword bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score wooden_sword bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wooden_sword}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}