# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 21 if score cauldron bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 21 if score cauldron bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cauldron}

execute if score cree77 bingo.random matches 22 if score iron_chain bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 22 if score iron_chain bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_chain}

execute if score cree77 bingo.random matches 23 if score charcoal bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 23 if score charcoal bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:charcoal}

execute if score cree77 bingo.random matches 24 if score cherry_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 24 if score cherry_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cherry_sapling}

execute if score cree77 bingo.random matches 25 if score chest_minecart bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 25 if score chest_minecart bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:chest_minecart}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}