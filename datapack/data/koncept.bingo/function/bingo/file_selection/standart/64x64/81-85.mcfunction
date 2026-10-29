# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 81 if score snow_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 81 if score snow_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:snow_block}

execute if score cree77 bingo.random matches 82 if score sponge bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 82 if score sponge bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sponge}

execute if score cree77 bingo.random matches 83 if score cartography_table bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 83 if score cartography_table bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cartography_table}

execute if score cree77 bingo.random matches 84 if score trapped_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 84 if score trapped_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:trapped_chest}

execute if score cree77 bingo.random matches 85 if score chiseled_bookshelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 85 if score chiseled_bookshelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_bookshelf}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}