# Project created by the koncept

data modify storage bingo.macro input set value {"x":0}

execute store result storage bingo.macro input.x int 1 run scoreboard players get @s bingo.number.id.player

function koncept.bingo:bingo/bossbar/add/add with storage minecraft:bingo.macro input