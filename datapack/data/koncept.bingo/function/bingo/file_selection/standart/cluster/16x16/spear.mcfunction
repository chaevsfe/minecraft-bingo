#Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..6

#file refinement

execute if score cree77 random_cluster matches 1 if score wooden_spear bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score wooden_spear bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wooden_spear}

execute if score cree77 random_cluster matches 2 if score stone_spear bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score stone_spear bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:stone_spear}

execute if score cree77 random_cluster matches 3 if score copper_spear bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score copper_spear bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_spear}

execute if score cree77 random_cluster matches 4 if score iron_spear bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score iron_spear bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_spear}

execute if score cree77 random_cluster matches 5 if score golden_spear bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score golden_spear bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_spear}

execute if score cree77 random_cluster matches 6 if score diamond_spear bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score diamond_spear bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_spear}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}