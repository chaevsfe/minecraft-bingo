# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 41 if score redstone_lamp bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 41 if score redstone_lamp bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:redstone_lamp}

execute if score cree77 bingo.random matches 42 if score coal_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 42 if score coal_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:coal_block}

execute if score cree77 bingo.random matches 43 if score spore_blossom bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 43 if score spore_blossom bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spore_blossom}

execute if score cree77 bingo.random matches 44 if score sticky_piston bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 44 if score sticky_piston bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sticky_piston}

execute if score cree77 bingo.random matches 45 if score diamond_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 45 if score diamond_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:diamond_block}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}