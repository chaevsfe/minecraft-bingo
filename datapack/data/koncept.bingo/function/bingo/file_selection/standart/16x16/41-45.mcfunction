# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 41 if score emerald bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 41 if score emerald bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:emerald}

execute if score cree77 bingo.random matches 42 if score ender_pearl bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 42 if score ender_pearl bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ender_pearl}

execute if score cree77 bingo.random matches 43 if score feather bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 43 if score feather bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:feather}

execute if score cree77 bingo.random matches 44 if score fermented_spider_eye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 44 if score fermented_spider_eye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:fermented_spider_eye}

execute if score cree77 bingo.random matches 45 if score fern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 45 if score fern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:fern}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}