# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 71 if score ink_sac bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 71 if score ink_sac bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ink_sac}

execute if score cree77 bingo.random matches 72 if score iron_bars bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 72 if score iron_bars bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_bars}

execute if score cree77 bingo.random matches 73 if score iron_door bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 73 if score iron_door bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_door}

execute if score cree77 bingo.random matches 74 if score iron_horse_armor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 74 if score iron_horse_armor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_horse_armor}

execute if score cree77 bingo.random matches 75 if score iron_ingot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 75 if score iron_ingot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_ingot}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}