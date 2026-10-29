# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 11 if score raw_gold_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 11 if score raw_gold_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:raw_gold_block}

execute if score cree77 bingo.random matches 12 if score barrel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 12 if score barrel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:barrel}

execute if score cree77 bingo.random matches 13 if score big_dripleaf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 13 if score big_dripleaf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:big_dripleaf}

execute if score cree77 bingo.random matches 14 if score observer bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 14 if score observer bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:observer}

execute if score cree77 bingo.random matches 15 if score obsidian bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 15 if score obsidian bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:obsidian}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}