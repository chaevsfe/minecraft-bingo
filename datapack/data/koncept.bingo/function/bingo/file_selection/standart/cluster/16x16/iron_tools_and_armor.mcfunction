# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..9

#file refinement

execute if score cree77 random_cluster matches 1 if score iron_sword bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score iron_sword bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_sword}

execute if score cree77 random_cluster matches 2 if score iron_shovel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score iron_shovel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_shovel}

execute if score cree77 random_cluster matches 3 if score iron_pickaxe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score iron_pickaxe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_pickaxe}

execute if score cree77 random_cluster matches 4 if score iron_hoe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score iron_hoe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_hoe}

execute if score cree77 random_cluster matches 5 if score iron_axe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score iron_axe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_axe}

execute if score cree77 random_cluster matches 6 if score iron_helmet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score iron_helmet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_helmet}

execute if score cree77 random_cluster matches 7 if score iron_chestplate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score iron_chestplate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_chestplate}

execute if score cree77 random_cluster matches 8 if score iron_leggings bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score iron_leggings bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_leggings}

execute if score cree77 random_cluster matches 9 if score iron_boots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score iron_boots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_boots}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}