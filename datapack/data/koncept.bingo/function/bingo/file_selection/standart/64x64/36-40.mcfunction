# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 36 if score beehive bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 36 if score beehive bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:beehive}

execute if score cree77 bingo.random matches 37 if score mud bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 37 if score mud bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mud}

execute if score cree77 bingo.random matches 38 if score bone_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 38 if score bone_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bone_block}

execute if score cree77 bingo.random matches 39 if score gravel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 39 if score gravel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gravel}

execute if score cree77 bingo.random matches 40 if score cut_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 40 if score cut_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cut_copper}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}