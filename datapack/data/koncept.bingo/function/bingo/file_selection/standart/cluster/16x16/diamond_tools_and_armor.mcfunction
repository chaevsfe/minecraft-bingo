# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..9

#file refinement

execute if score cree77 random_cluster matches 1 if score diamond_sword bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score diamond_sword bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_sword}

execute if score cree77 random_cluster matches 2 if score diamond_shovel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score diamond_shovel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_shovel}

execute if score cree77 random_cluster matches 3 if score diamond_pickaxe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score diamond_pickaxe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_pickaxe}

execute if score cree77 random_cluster matches 4 if score diamond_hoe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score diamond_hoe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_hoe}

execute if score cree77 random_cluster matches 5 if score diamond_axe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score diamond_axe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_axe}

execute if score cree77 random_cluster matches 6 if score diamond_helmet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score diamond_helmet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_helmet}

execute if score cree77 random_cluster matches 7 if score diamond_chestplate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score diamond_chestplate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_chestplate}

execute if score cree77 random_cluster matches 8 if score diamond_leggings bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score diamond_leggings bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_leggings}

execute if score cree77 random_cluster matches 9 if score diamond_boots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score diamond_boots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_boots}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}