# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 61 if score goat_horn bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 61 if score goat_horn bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:goat_horn}

execute if score cree77 bingo.random matches 62 if score gold_ingot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 62 if score gold_ingot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gold_ingot}

execute if score cree77 bingo.random matches 63 if score gold_nugget bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 63 if score gold_nugget bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gold_nugget}

execute if score cree77 bingo.random matches 64 if score golden_horse_armor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 64 if score golden_horse_armor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:golden_horse_armor}

execute if score cree77 bingo.random matches 65 if score gunpowder bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 65 if score gunpowder bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:gunpowder}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}