# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 1 if score mangrove_roots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 1 if score mangrove_roots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mangrove_roots}

execute if score cree77 bingo.random matches 2 if score stonecutter bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 2 if score stonecutter bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stonecutter}

execute if score cree77 bingo.random matches 3 if score lapis_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 3 if score lapis_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lapis_block}

execute if score cree77 bingo.random matches 4 if score heavy_weighted_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 4 if score heavy_weighted_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:heavy_weighted_pressure_plate}

execute if score cree77 bingo.random matches 5 if score redstone_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 5 if score redstone_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:redstone_block}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}