# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..13

#file refinement

execute if score cree77 random_cluster matches 1 if score warped_stem bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score warped_stem bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_stem}

execute if score cree77 random_cluster matches 2 if score warped_hyphae bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score warped_hyphae bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_hyphae}

execute if score cree77 random_cluster matches 3 if score stripped_warped_stem bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score stripped_warped_stem bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_warped_stem}

execute if score cree77 random_cluster matches 4 if score stripped_warped_hyphae bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stripped_warped_hyphae bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_warped_hyphae}

execute if score cree77 random_cluster matches 5 if score warped_planks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score warped_planks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_planks}

execute if score cree77 random_cluster matches 6 if score warped_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score warped_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_stairs}

execute if score cree77 random_cluster matches 7 if score warped_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score warped_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_slab}

execute if score cree77 random_cluster matches 8 if score warped_fence bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score warped_fence bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_fence}

execute if score cree77 random_cluster matches 9 if score warped_fence_gate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score warped_fence_gate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_fence_gate}

execute if score cree77 random_cluster matches 10 if score warped_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score warped_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_trapdoor}

execute if score cree77 random_cluster matches 11 if score warped_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score warped_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_pressure_plate}

execute if score cree77 random_cluster matches 12 if score warped_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score warped_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_button}

execute if score cree77 random_cluster matches 13 if score warped_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score warped_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_shelf}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}