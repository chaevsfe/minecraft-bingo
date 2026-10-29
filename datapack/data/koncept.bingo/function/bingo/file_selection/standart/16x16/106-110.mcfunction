# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 106 if score redstone_torch bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 106 if score redstone_torch bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:redstone_torch}

execute if score cree77 bingo.random matches 107 if score repeater bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 107 if score repeater bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:repeater}

execute if score cree77 bingo.random matches 108 if score rose_bush bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 108 if score rose_bush bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:rose_bush}

execute if score cree77 bingo.random matches 109 if score rotten_flesh bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 109 if score rotten_flesh bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:rotten_flesh}

execute if score cree77 bingo.random matches 110 if score saddle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 110 if score saddle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:saddle}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}