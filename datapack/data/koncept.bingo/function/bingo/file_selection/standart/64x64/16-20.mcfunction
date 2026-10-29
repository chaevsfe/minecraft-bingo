# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 16 if score dropper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 16 if score dropper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dropper}

execute if score cree77 bingo.random matches 17 if score emerald_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 17 if score emerald_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:emerald_block}

execute if score cree77 bingo.random matches 18 if score melon bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 18 if score melon bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:melon}

execute if score cree77 bingo.random matches 19 if score enchanting_table bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 19 if score enchanting_table bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:enchanting_table}

execute if score cree77 bingo.random matches 20 if score dripstone_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 20 if score dripstone_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dripstone_block}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}