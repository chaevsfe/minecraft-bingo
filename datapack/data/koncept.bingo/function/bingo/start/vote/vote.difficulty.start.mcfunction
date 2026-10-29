# Project created by the koncept

scoreboard objectives add bingo.vote.difficulty dummy
scoreboard players set start bingo.vote.difficulty 1

execute unless score mod bingo.companion matches 1 run tellraw @a[tag=bingo.game.player] ["",{"text":"\n\n\n\n\n\n\n"},{"translate":"space.6"},{"text":"[vote]","color":"white",click_event:{action:'run_command',command:"/trigger bingo.vote.standart"}},{"translate":"space.14"},{"text":"[vote]","color":"white",click_event:{action:'run_command',command:"/trigger bingo.vote.difficult"}},{"translate":"space.14"},{"text":"[vote]","color":"white",click_event:{action:'run_command',command:"/trigger bingo.vote.hardcore"}},{"translate":"space.-135"},{"text":"\u0008","font":"koncept:unicode"},{"translate":"space.-22"},{"text":"\u0009","font":"koncept:unicode"},{"translate":"space.-22"},{"text":"\u0010","font":"koncept:unicode"}]

scoreboard players add vote.standart bingo.vote.difficulty 0
scoreboard players add vote.difficult bingo.vote.difficulty 0
scoreboard players add vote.hardcore bingo.vote.difficulty 0

