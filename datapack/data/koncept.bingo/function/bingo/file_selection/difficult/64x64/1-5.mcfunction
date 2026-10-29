# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 1 if score ancient_debris bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 1 if score ancient_debris bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:ancient_debris}

execute if score cree77 bingo.random matches 2 if score netherrack bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 2 if score netherrack bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:netherrack}

execute if score cree77 bingo.random matches 3 if score soul_sand bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 3 if score soul_sand bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:soul_sand}

execute if score cree77 bingo.random matches 4 if score soul_soil bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 4 if score soul_soil bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:soul_soil}

execute if score cree77 bingo.random matches 5 if score nether_wart_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 5 if score nether_wart_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:nether_wart_block}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}