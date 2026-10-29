# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..11

#file refinement

execute if score cree77 random_cluster matches 1 if score sand bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score sand bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sand}

execute if score cree77 random_cluster matches 2 if score sandstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score sandstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sandstone}

execute if score cree77 random_cluster matches 3 if score sandstone_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score sandstone_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sandstone_stairs}

execute if score cree77 random_cluster matches 4 if score sandstone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score sandstone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sandstone_slab}

execute if score cree77 random_cluster matches 5 if score sandstone_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score sandstone_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sandstone_wall}

execute if score cree77 random_cluster matches 6 if score chiseled_sandstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score chiseled_sandstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_sandstone}

execute if score cree77 random_cluster matches 7 if score smooth_sandstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score smooth_sandstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_sandstone}

execute if score cree77 random_cluster matches 8 if score smooth_sandstone_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score smooth_sandstone_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_sandstone_stairs}

execute if score cree77 random_cluster matches 9 if score smooth_sandstone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score smooth_sandstone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_sandstone_slab}

execute if score cree77 random_cluster matches 10 if score cut_sandstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score cut_sandstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cut_sandstone}

execute if score cree77 random_cluster matches 11 if score cut_sandstone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cut_sandstone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cut_sandstone_slab}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}