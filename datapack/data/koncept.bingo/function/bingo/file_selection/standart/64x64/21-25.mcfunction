# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 21 if score fletching_table bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 21 if score fletching_table bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:fletching_table}

execute if score cree77 bingo.random matches 22 if score flowering_azalea bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 22 if score flowering_azalea bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:flowering_azalea}

execute if score cree77 bingo.random matches 23 if score furnace bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 23 if score furnace bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:furnace}

execute if score cree77 bingo.random matches 24 if score rooted_dirt bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 24 if score rooted_dirt bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:rooted_dirt}

execute if score cree77 bingo.random matches 25 if score raw_iron_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 25 if score raw_iron_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:raw_iron_block}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}