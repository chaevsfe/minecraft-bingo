# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 11 if score crying_obsidian bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 11 if score crying_obsidian bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crying_obsidian}

execute if score cree77 bingo.random matches 12 if score respawn_anchor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 12 if score respawn_anchor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:respawn_anchor}

execute if score cree77 bingo.random matches 13 if score glowstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 13 if score glowstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:glowstone}

execute if score cree77 bingo.random matches 14 if score shroomlight bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 14 if score shroomlight bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:shroomlight}

execute if score cree77 bingo.random matches 15 if score sea_lantern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 15 if score sea_lantern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sea_lantern}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}