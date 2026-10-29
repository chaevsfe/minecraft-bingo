scoreboard players operation @s bingo.count.object.check.max = @s bingo.count.object

scoreboard players operation mx bingo.count.object.check.max > @s bingo.count.object

tag @s remove bingo.check.max.temp

execute as @r[tag=bingo.check.max.temp] at @s run function koncept.bingo:bingo/win/max/max