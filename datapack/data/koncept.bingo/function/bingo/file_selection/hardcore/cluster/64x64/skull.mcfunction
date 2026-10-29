# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..5

#file refinement

execute if score cree77 random_cluster matches 1 if score wither_skeleton_skull bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score wither_skeleton_skull bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:wither_skeleton_skull}

execute if score cree77 random_cluster matches 2 if score skeleton_skull bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score skeleton_skull bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:skeleton_skull}

execute if score cree77 random_cluster matches 3 if score zombie_head bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score zombie_head bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:zombie_head}

execute if score cree77 random_cluster matches 4 if score creeper_head bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score creeper_head bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:creeper_head}

execute if score cree77 random_cluster matches 5 if score piglin_head bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score piglin_head bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:piglin_head}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}