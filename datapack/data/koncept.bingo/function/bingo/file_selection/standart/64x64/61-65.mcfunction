# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 61 if score target bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 61 if score target bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:target}

execute if score cree77 bingo.random matches 62 if score scaffolding bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 62 if score scaffolding bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:scaffolding}

execute if score cree77 bingo.random matches 63 if score decorated_pot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 63 if score decorated_pot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:decorated_pot}

execute if score cree77 bingo.random matches 64 if score jukebox bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 64 if score jukebox bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:jukebox}

execute if score cree77 bingo.random matches 65 if score smoker bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 65 if score smoker bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smoker}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}