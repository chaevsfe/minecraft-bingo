# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..11

#file refinement

execute if score cree77 random_cluster matches 1 if score golden_sword bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score golden_sword bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_sword}

execute if score cree77 random_cluster matches 2 if score golden_shovel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score golden_shovel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_shovel}

execute if score cree77 random_cluster matches 3 if score golden_pickaxe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score golden_pickaxe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_pickaxe}

execute if score cree77 random_cluster matches 4 if score golden_hoe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score golden_hoe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_hoe}

execute if score cree77 random_cluster matches 5 if score golden_axe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score golden_axe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_axe}

execute if score cree77 random_cluster matches 6 if score golden_helmet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score golden_helmet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_helmet}

execute if score cree77 random_cluster matches 7 if score golden_chestplate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score golden_chestplate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_chestplate}

execute if score cree77 random_cluster matches 8 if score golden_leggings bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score golden_leggings bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_leggings}

execute if score cree77 random_cluster matches 9 if score golden_boots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score golden_boots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_boots}

execute if score cree77 random_cluster matches 10 if score golden_apple bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score golden_apple bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_apple}

execute if score cree77 random_cluster matches 11 if score golden_carrot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score golden_carrot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_carrot}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}