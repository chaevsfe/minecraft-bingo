# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..13

#file refinement

execute if score cree77 random_cluster matches 1 if score bamboo_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score bamboo_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_block}

execute if score cree77 random_cluster matches 2 if score stripped_bamboo_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score stripped_bamboo_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_bamboo_block}

execute if score cree77 random_cluster matches 3 if score bamboo_planks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score bamboo_planks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_planks}

execute if score cree77 random_cluster matches 4 if score bamboo_mosaic bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score bamboo_mosaic bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_mosaic}

execute if score cree77 random_cluster matches 5 if score bamboo_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score bamboo_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_stairs}

execute if score cree77 random_cluster matches 6 if score bamboo_mosaic_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score bamboo_mosaic_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_mosaic_stairs}

execute if score cree77 random_cluster matches 7 if score bamboo_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score bamboo_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_slab}

execute if score cree77 random_cluster matches 8 if score bamboo_mosaic_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score bamboo_mosaic_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_mosaic_slab}

execute if score cree77 random_cluster matches 9 if score bamboo_fence bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score bamboo_fence bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_fence}

execute if score cree77 random_cluster matches 10 if score bamboo_fence_gate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score bamboo_fence_gate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_fence_gate}

execute if score cree77 random_cluster matches 11 if score bamboo_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score bamboo_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_trapdoor}

execute if score cree77 random_cluster matches 12 if score bamboo_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score bamboo_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_pressure_plate}

execute if score cree77 random_cluster matches 13 if score bamboo_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score bamboo_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_button}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}