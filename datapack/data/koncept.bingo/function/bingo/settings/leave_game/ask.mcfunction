# Project created by the koncept

execute as @s[tag=bingo.game.player] at @s run scoreboard players enable @s bingo.leave.game.yes

execute as @s[tag=!bingo.game.player] at @s run tellraw @s [{"translate":"bingo.quit.not_in_game","color":"red"}]

execute as @s[tag=bingo.game.player] at @s run tellraw @s [{"translate":"bingo.quit.confirm","color":"#ffcc64"},{"text":" [✔]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.leave.game.yes"}}]

scoreboard players reset @s .bingo.leave.game

