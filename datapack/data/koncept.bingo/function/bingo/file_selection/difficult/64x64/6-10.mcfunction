# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 6 if score warped_wart_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 6 if score warped_wart_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_wart_block}

execute if score cree77 bingo.random matches 7 if score magma_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 7 if score magma_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:magma_block}

execute if score cree77 bingo.random matches 8 if score gilded_blackstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 8 if score gilded_blackstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gilded_blackstone}

execute if score cree77 bingo.random matches 9 if score basalt bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 9 if score basalt bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:basalt}

execute if score cree77 bingo.random matches 10 if score polished_basalt bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 10 if score polished_basalt bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_basalt}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}