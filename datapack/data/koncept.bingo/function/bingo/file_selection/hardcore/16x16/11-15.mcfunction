# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 11 if score wind_charge bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 11 if score wind_charge bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wind_charge}

execute if score cree77 bingo.random matches 12 if score breeze_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 12 if score breeze_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:breeze_rod}

execute if score cree77 bingo.random matches 13 if score mace bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 13 if score mace bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:mace}

execute if score cree77 bingo.random matches 14 if score disc_fragment_5 bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 14 if score disc_fragment_5 bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:disc_fragment_5}

execute if score cree77 bingo.random matches 15 if score echo_shard bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 15 if score echo_shard bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:echo_shard}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}