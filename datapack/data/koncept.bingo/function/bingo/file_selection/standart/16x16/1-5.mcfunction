# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 1 if score amethyst_shard bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 1 if score amethyst_shard bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:amethyst_shard}

execute if score cree77 bingo.random matches 2 if score armadillo_scute bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 2 if score armadillo_scute bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:armadillo_scute}

execute if score cree77 bingo.random matches 3 if score armor_stand bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 3 if score armor_stand bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:armor_stand}

execute if score cree77 bingo.random matches 4 if score arrow bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 4 if score arrow bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:arrow}

execute if score cree77 bingo.random matches 5 if score bamboo bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 5 if score bamboo bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bamboo}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}