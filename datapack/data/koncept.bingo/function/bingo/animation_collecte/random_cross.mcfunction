# cleaner
function koncept.bingo:bingo/animation_collecte/cleaner
execute as @a[tag=bingo.game.player] at @s run function koncept.bingo:bingo/bossbar/start

# fail
execute if score $count bingo.selection.options matches 26.. run return fail

#Random selection
scoreboard objectives add bingo.an.selection.options.random dummy
execute store result score cree77 bingo.an.selection.options.random run random value 1..26

#macro
data modify storage bingo:macro.an.random an set value {"x":0}
execute store result storage bingo:macro.an.random an.x int 1 run scoreboard players get cree77 bingo.an.selection.options.random
#file selection
function koncept.bingo:bingo/animation_collecte/cross/random with storage bingo:macro.an.random an

scoreboard objectives remove bingo.an.selection.options.random