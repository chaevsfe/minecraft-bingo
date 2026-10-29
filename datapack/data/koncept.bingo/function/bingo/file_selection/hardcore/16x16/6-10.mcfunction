# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 6 if score chorus_fruit bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 6 if score chorus_fruit bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:chorus_fruit}

execute if score cree77 bingo.random matches 7 if score popped_chorus_fruit bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 7 if score popped_chorus_fruit bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:popped_chorus_fruit}

execute if score cree77 bingo.random matches 8 if score shulker_shell bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 8 if score shulker_shell bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:shulker_shell}

execute if score cree77 bingo.random matches 9 if score end_crystal bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 9 if score end_crystal bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:end_crystal}

execute if score cree77 bingo.random matches 10 if score enchanted_book bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 10 if score enchanted_book bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:enchanted_book}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}