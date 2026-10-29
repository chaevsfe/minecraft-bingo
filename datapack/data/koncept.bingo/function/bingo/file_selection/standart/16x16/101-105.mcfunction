# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 101 if score raw_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 101 if score raw_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:raw_copper}

execute if score cree77 bingo.random matches 102 if score raw_gold bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 102 if score raw_gold bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:raw_gold}

execute if score cree77 bingo.random matches 103 if score raw_iron bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 103 if score raw_iron bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:raw_iron}

execute if score cree77 bingo.random matches 104 if score red_mushroom bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 104 if score red_mushroom bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_mushroom}

execute if score cree77 bingo.random matches 105 if score redstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 105 if score redstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:redstone}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}