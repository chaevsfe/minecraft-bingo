# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 46 if score field_masoned_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 46 if score field_masoned_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:field_masoned_banner_pattern}

execute if score cree77 bingo.random matches 47 if score firework_rocket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 47 if score firework_rocket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:firework_rocket}

execute if score cree77 bingo.random matches 48 if score firework_star bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 48 if score firework_star bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:firework_star}

execute if score cree77 bingo.random matches 49 if score fishing_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 49 if score fishing_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:fishing_rod}

execute if score cree77 bingo.random matches 50 if score flint bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 50 if score flint bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:flint}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}