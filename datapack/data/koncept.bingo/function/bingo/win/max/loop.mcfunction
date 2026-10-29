tag @a[tag=bingo.check.max] add bingo.check.max.temp
execute as @r[tag=bingo.check.max.temp] at @s run function koncept.bingo:bingo/win/max/max

execute as @a[tag=bingo.check.max] at @s run execute if score @s bingo.count.object.check.max = mx bingo.count.object.check.max run function koncept.bingo:bingo/win/max/1 with entity @s

execute if entity @a[tag=bingo.check.max] run function koncept.bingo:bingo/win/max/loop