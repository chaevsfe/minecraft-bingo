# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 121 if score sugar_cane bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 121 if score sugar_cane bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sugar_cane}

execute if score cree77 bingo.random matches 122 if score sunflower bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 122 if score sunflower bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sunflower}

execute if score cree77 bingo.random matches 123 if score tnt_minecart bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 123 if score tnt_minecart bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tnt_minecart}

execute if score cree77 bingo.random matches 124 if score torch bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 124 if score torch bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:torch}

execute if score cree77 bingo.random matches 125 if score tripwire_hook bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 125 if score tripwire_hook bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tripwire_hook}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}