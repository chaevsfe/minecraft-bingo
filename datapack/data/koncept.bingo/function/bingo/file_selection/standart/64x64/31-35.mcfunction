# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 31 if score azalea bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 31 if score azalea bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:azalea}

execute if score cree77 bingo.random matches 32 if score piston bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 32 if score piston bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:piston}

execute if score cree77 bingo.random matches 33 if score muddy_mangrove_roots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 33 if score muddy_mangrove_roots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:muddy_mangrove_roots}

execute if score cree77 bingo.random matches 34 if score smithing_table bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 34 if score smithing_table bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smithing_table}

execute if score cree77 bingo.random matches 35 if score crafting_table bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 35 if score crafting_table bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crafting_table}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}