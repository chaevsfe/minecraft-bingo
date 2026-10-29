# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 131 if score writable_book bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 131 if score writable_book bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:writable_book}

execute if score cree77 bingo.random matches 132 if score wildflowers bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 132 if score wildflowers bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wildflowers}

execute if score cree77 bingo.random matches 133 if score tall_dry_grass bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 133 if score tall_dry_grass bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tall_dry_grass}

execute if score cree77 bingo.random matches 134 if score short_dry_grass bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 134 if score short_dry_grass bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:short_dry_grass}

execute if score cree77 bingo.random matches 135 if score firefly_bush bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 135 if score firefly_bush bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:firefly_bush}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}