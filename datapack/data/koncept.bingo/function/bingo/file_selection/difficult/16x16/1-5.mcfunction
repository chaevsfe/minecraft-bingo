# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 1 if score blaze_powder bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 1 if score blaze_powder bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blaze_powder}

execute if score cree77 bingo.random matches 2 if score blaze_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 2 if score blaze_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blaze_rod}

execute if score cree77 bingo.random matches 3 if score brewing_stand bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 3 if score brewing_stand bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brewing_stand}

execute if score cree77 bingo.random matches 4 if score crimson_fungus bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 4 if score crimson_fungus bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:crimson_fungus}

execute if score cree77 bingo.random matches 5 if score crimson_roots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 5 if score crimson_roots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:crimson_roots}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}