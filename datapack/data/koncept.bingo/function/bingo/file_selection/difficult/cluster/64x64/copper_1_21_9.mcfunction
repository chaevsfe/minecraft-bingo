# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..9

#file refinement

execute if score cree77 random_cluster matches 1 if score exposed_copper_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score exposed_copper_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_copper_chest}

execute if score cree77 random_cluster matches 2 if score weathered_copper_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score weathered_copper_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_copper_chest}

execute if score cree77 random_cluster matches 3 if score oxidized_copper_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score oxidized_copper_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_copper_chest}

execute if score cree77 random_cluster matches 4 if score exposed_copper_golem_statue bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score exposed_copper_golem_statue bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_copper_golem_statue}

execute if score cree77 random_cluster matches 5 if score weathered_copper_golem_statue bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score weathered_copper_golem_statue bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_copper_golem_statue}

execute if score cree77 random_cluster matches 6 if score oxidized_copper_golem_statue bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score oxidized_copper_golem_statue bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_copper_golem_statue}

execute if score cree77 random_cluster matches 7 if score exposed_lightning_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score exposed_lightning_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:exposed_lightning_rod}

execute if score cree77 random_cluster matches 8 if score weathered_lightning_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score weathered_lightning_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:weathered_lightning_rod}

execute if score cree77 random_cluster matches 9 if score oxidized_lightning_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score oxidized_lightning_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oxidized_lightning_rod}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}