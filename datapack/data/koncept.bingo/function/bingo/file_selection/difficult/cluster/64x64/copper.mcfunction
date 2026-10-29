# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..40

#file refinement

execute if score cree77 random_cluster matches 1 if score copper_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score copper_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:copper_block}

execute if score cree77 random_cluster matches 2 if score chiseled_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score chiseled_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_copper}

execute if score cree77 random_cluster matches 3 if score copper_grate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score copper_grate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:copper_grate}

execute if score cree77 random_cluster matches 4 if score cut_copper_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score cut_copper_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cut_copper_stairs}

execute if score cree77 random_cluster matches 5 if score cut_copper_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score cut_copper_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cut_copper_slab}

execute if score cree77 random_cluster matches 6 if score copper_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score copper_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:copper_trapdoor}

execute if score cree77 random_cluster matches 7 if score copper_bulb bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score copper_bulb bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:copper_bulb}

execute if score cree77 random_cluster matches 8 if score exposed_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score exposed_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_copper}

execute if score cree77 random_cluster matches 9 if score exposed_chiseled_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score exposed_chiseled_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_chiseled_copper}

execute if score cree77 random_cluster matches 10 if score exposed_copper_grate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score exposed_copper_grate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_copper_grate}

execute if score cree77 random_cluster matches 11 if score exposed_cut_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score exposed_cut_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_cut_copper}

execute if score cree77 random_cluster matches 12 if score exposed_cut_copper_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score exposed_cut_copper_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_cut_copper_stairs}

execute if score cree77 random_cluster matches 13 if score exposed_cut_copper_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score exposed_cut_copper_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_cut_copper_slab}

execute if score cree77 random_cluster matches 14 if score exposed_copper_bulb bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score exposed_copper_bulb bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_copper_bulb}

execute if score cree77 random_cluster matches 15 if score exposed_copper_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score exposed_copper_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_copper_trapdoor}

execute if score cree77 random_cluster matches 16 if score weathered_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score weathered_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_copper}

execute if score cree77 random_cluster matches 17 if score weathered_chiseled_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score weathered_chiseled_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_chiseled_copper}

execute if score cree77 random_cluster matches 18 if score weathered_copper_grate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score weathered_copper_grate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_copper_grate}

execute if score cree77 random_cluster matches 19 if score weathered_cut_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 19 if score weathered_cut_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_cut_copper}

execute if score cree77 random_cluster matches 20 if score weathered_cut_copper_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 20 if score weathered_cut_copper_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_cut_copper_stairs}

execute if score cree77 random_cluster matches 21 if score weathered_cut_copper_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 21 if score weathered_cut_copper_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_cut_copper_slab}

execute if score cree77 random_cluster matches 22 if score weathered_copper_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 22 if score weathered_copper_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_copper_trapdoor}

execute if score cree77 random_cluster matches 23 if score weathered_copper_bulb bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 23 if score weathered_copper_bulb bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_copper_bulb}

execute if score cree77 random_cluster matches 24 if score oxidized_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 24 if score oxidized_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_copper}

execute if score cree77 random_cluster matches 25 if score oxidized_chiseled_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 25 if score oxidized_chiseled_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_chiseled_copper}

execute if score cree77 random_cluster matches 26 if score oxidized_copper_grate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 26 if score oxidized_copper_grate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_copper_grate}

execute if score cree77 random_cluster matches 27 if score oxidized_cut_copper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 27 if score oxidized_cut_copper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_cut_copper}

execute if score cree77 random_cluster matches 28 if score oxidized_cut_copper_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 28 if score oxidized_cut_copper_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_cut_copper_stairs}

execute if score cree77 random_cluster matches 29 if score oxidized_cut_copper_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 29 if score oxidized_cut_copper_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_cut_copper_slab}

execute if score cree77 random_cluster matches 30 if score oxidized_copper_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 30 if score oxidized_copper_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_copper_trapdoor}

execute if score cree77 random_cluster matches 31 if score oxidized_copper_bulb bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 31 if score oxidized_copper_bulb bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_copper_bulb}

execute if score cree77 random_cluster matches 32 if score exposed_copper_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 32 if score exposed_copper_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_copper_chest}

execute if score cree77 random_cluster matches 33 if score weathered_copper_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 33 if score weathered_copper_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_copper_chest}

execute if score cree77 random_cluster matches 34 if score oxidized_copper_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 34 if score oxidized_copper_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_copper_chest}

execute if score cree77 random_cluster matches 35 if score exposed_copper_golem_statue bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 35 if score exposed_copper_golem_statue bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_copper_golem_statue}

execute if score cree77 random_cluster matches 36 if score weathered_copper_golem_statue bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 36 if score weathered_copper_golem_statue bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_copper_golem_statue}

execute if score cree77 random_cluster matches 37 if score oxidized_copper_golem_statue bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 37 if score oxidized_copper_golem_statue bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_copper_golem_statue}

execute if score cree77 random_cluster matches 38 if score exposed_lightning_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 38 if score exposed_lightning_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_lightning_rod}

execute if score cree77 random_cluster matches 39 if score weathered_lightning_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 39 if score weathered_lightning_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_lightning_rod}

execute if score cree77 random_cluster matches 40 if score oxidized_lightning_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 40 if score oxidized_lightning_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_lightning_rod}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}