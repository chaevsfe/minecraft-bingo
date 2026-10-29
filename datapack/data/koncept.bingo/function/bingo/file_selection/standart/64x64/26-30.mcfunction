# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 26 if score blast_furnace bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 26 if score blast_furnace bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blast_furnace}

execute if score cree77 bingo.random matches 27 if score slime_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 27 if score slime_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:slime_block}

execute if score cree77 bingo.random matches 28 if score note_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 28 if score note_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:note_block}

execute if score cree77 bingo.random matches 29 if score amethyst_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 29 if score amethyst_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:amethyst_block}

execute if score cree77 bingo.random matches 30 if score calcite bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 30 if score calcite bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:calcite}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}