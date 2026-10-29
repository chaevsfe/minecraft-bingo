# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 26 if score elytra bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 26 if score elytra bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:elytra}

execute if score cree77 bingo.random matches 27 if score wither_rose bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 27 if score wither_rose bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wither_rose}

execute if score cree77 bingo.random matches 28 if score netherite_scrap bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 28 if score netherite_scrap bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_scrap}

execute if score cree77 bingo.random matches 29 if score diamond_horse_armor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 29 if score diamond_horse_armor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond_horse_armor}

execute if score cree77 bingo.random matches 30 if score prismarine_shard bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 30 if score prismarine_shard bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:prismarine_shard}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}