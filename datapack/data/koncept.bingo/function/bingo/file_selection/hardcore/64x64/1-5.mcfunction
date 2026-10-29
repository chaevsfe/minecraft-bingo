# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 1 if score beacon bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 1 if score beacon bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:beacon}

execute if score cree77 bingo.random matches 2 if score bee_nest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 2 if score bee_nest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bee_nest}

execute if score cree77 bingo.random matches 3 if score netherite_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 3 if score netherite_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:netherite_block}

execute if score cree77 bingo.random matches 4 if score ender_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 4 if score ender_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:ender_chest}

execute if score cree77 bingo.random matches 5 if score chorus_flower bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 5 if score chorus_flower bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chorus_flower}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}