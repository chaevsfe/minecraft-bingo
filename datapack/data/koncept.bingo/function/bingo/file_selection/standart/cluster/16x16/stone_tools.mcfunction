# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..5

#file refinement

execute if score cree77 random_cluster matches 1 if score stone_sword bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score stone_sword bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:stone_sword}

execute if score cree77 random_cluster matches 2 if score stone_shovel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score stone_shovel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:stone_shovel}

execute if score cree77 random_cluster matches 3 if score stone_pickaxe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score stone_pickaxe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:stone_pickaxe}

execute if score cree77 random_cluster matches 4 if score stone_hoe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stone_hoe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:stone_hoe}

execute if score cree77 random_cluster matches 5 if score stone_axe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score stone_axe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:stone_axe}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}