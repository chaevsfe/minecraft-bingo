# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 6 if score ender_eye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 6 if score ender_eye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ender_eye}

execute if score cree77 bingo.random matches 7 if score fire_charge bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 7 if score fire_charge bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:fire_charge}

execute if score cree77 bingo.random matches 8 if score glowstone_dust bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 8 if score glowstone_dust bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:glowstone_dust}

execute if score cree77 bingo.random matches 9 if score magma_cream bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 9 if score magma_cream bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:magma_cream}

execute if score cree77 bingo.random matches 10 if score nether_brick bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 10 if score nether_brick bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:nether_brick}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}