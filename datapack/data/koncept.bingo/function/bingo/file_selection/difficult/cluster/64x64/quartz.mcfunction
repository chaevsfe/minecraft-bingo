# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..9

#file refinement

execute if score cree77 random_cluster matches 1 if score quartz_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score quartz_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:quartz_block}

execute if score cree77 random_cluster matches 2 if score quartz_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score quartz_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:quartz_stairs}

execute if score cree77 random_cluster matches 3 if score quartz_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score quartz_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:quartz_slab}

execute if score cree77 random_cluster matches 4 if score chiseled_quartz_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score chiseled_quartz_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_quartz_block}

execute if score cree77 random_cluster matches 5 if score quartz_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score quartz_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:quartz_bricks}

execute if score cree77 random_cluster matches 6 if score quartz_pillar bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score quartz_pillar bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:quartz_pillar}

execute if score cree77 random_cluster matches 7 if score smooth_quartz bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score smooth_quartz bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_quartz}

execute if score cree77 random_cluster matches 8 if score smooth_quartz_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score smooth_quartz_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_quartz_stairs}

execute if score cree77 random_cluster matches 9 if score smooth_quartz_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score smooth_quartz_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_quartz_slab}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}