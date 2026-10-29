# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 76 if score iron_nugget bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 76 if score iron_nugget bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:iron_nugget}

execute if score cree77 bingo.random matches 77 if score item_frame bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 77 if score item_frame bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:item_frame}

execute if score cree77 bingo.random matches 78 if score kelp bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 78 if score kelp bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:kelp}

execute if score cree77 bingo.random matches 79 if score ladder bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 79 if score ladder bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ladder}

execute if score cree77 bingo.random matches 80 if score lantern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 80 if score lantern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lantern}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}