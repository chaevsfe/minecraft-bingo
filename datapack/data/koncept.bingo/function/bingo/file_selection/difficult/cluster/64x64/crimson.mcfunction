# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..13

#file refinement

execute if score cree77 random_cluster matches 1 if score crimson_stem bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score crimson_stem bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_stem}

execute if score cree77 random_cluster matches 2 if score crimson_hyphae bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score crimson_hyphae bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_hyphae}

execute if score cree77 random_cluster matches 3 if score stripped_crimson_stem bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score stripped_crimson_stem bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_crimson_stem}

execute if score cree77 random_cluster matches 4 if score stripped_crimson_hyphae bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stripped_crimson_hyphae bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_crimson_hyphae}

execute if score cree77 random_cluster matches 5 if score crimson_planks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score crimson_planks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_planks}

execute if score cree77 random_cluster matches 6 if score crimson_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score crimson_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_stairs}

execute if score cree77 random_cluster matches 7 if score crimson_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score crimson_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_slab}

execute if score cree77 random_cluster matches 8 if score crimson_fence bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score crimson_fence bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_fence}

execute if score cree77 random_cluster matches 9 if score crimson_fence_gate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score crimson_fence_gate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_fence_gate}

execute if score cree77 random_cluster matches 10 if score crimson_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score crimson_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_trapdoor}

execute if score cree77 random_cluster matches 11 if score crimson_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score crimson_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_pressure_plate}

execute if score cree77 random_cluster matches 12 if score crimson_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score crimson_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_button}

execute if score cree77 random_cluster matches 13 if score crimson_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score crimson_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_shelf}


scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}