# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 11 if score nether_sprouts bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 11 if score nether_sprouts bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:nether_sprouts}

execute if score cree77 bingo.random matches 12 if score nether_wart bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 12 if score nether_wart bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:nether_wart}

execute if score cree77 bingo.random matches 13 if score phantom_membrane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 13 if score phantom_membrane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:phantom_membrane}

execute if score cree77 bingo.random matches 14 if score spectral_arrow bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 14 if score spectral_arrow bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:spectral_arrow}

execute if score cree77 bingo.random matches 15 if score prismarine_crystals bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 15 if score prismarine_crystals bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:prismarine_crystals}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}