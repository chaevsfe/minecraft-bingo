# Project created by the koncept

execute store result storage bingo.macro space int 1 run scoreboard players get @s bingo.space

execute store result storage bingo.macro number_id_player int 1 run scoreboard players get @s bingo.number.id.player

data modify storage minecraft:bingo.macro top_or_bottom set value top
execute unless score @s bingo.vertical = @s bingo.vertical run scoreboard players set @s bingo.vertical 0
execute unless score @s bingo.icon.size matches 12 unless score @s bingo.icon.size matches 16 unless score @s bingo.icon.size matches 20 unless score @s bingo.icon.size matches 24 run scoreboard players set @s bingo.icon.size 16
execute if score @s bingo.icon.size matches 12 if score @s bingo.vertical matches 7.. run scoreboard players set @s bingo.vertical 6
execute if score @s bingo.vertical matches 11.. run scoreboard players set @s bingo.vertical 10
execute if score @s bingo.vertical matches ..-31 run scoreboard players set @s bingo.vertical -30
execute store result storage minecraft:bingo.macro v int 1 run scoreboard players get @s bingo.vertical
function koncept.bingo:bingo/bossbar/height with storage minecraft:bingo.macro


#execute as @s[scores={bingo.icon.size=1}] at @s run data modify storage minecraft:bingo.macro icon_size set value "size_1"
#execute as @s[scores={bingo.icon.size=2}] at @s run data modify storage minecraft:bingo.macro icon_size set value "size_2"





execute store result storage minecraft:bingo.macro sz int 1 run scoreboard players get @s bingo.icon.size
function koncept.bingo:bingo/bossbar/select with storage minecraft:bingo.macro
