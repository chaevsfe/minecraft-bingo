# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 46 if score iron_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 46 if score iron_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:iron_block}

execute if score cree77 bingo.random matches 47 if score iron_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 47 if score iron_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:iron_trapdoor}

execute if score cree77 bingo.random matches 48 if score dispenser bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 48 if score dispenser bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dispenser}

execute if score cree77 bingo.random matches 49 if score smooth_basalt bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 49 if score smooth_basalt bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_basalt}

execute if score cree77 bingo.random matches 50 if score coarse_dirt bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 50 if score coarse_dirt bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:coarse_dirt}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}