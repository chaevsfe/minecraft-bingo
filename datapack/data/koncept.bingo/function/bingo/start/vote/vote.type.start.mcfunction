# Project created by the koncept

scoreboard objectives add bingo.vote.type dummy
scoreboard players set start bingo.vote.type 1

execute unless score mod bingo.companion matches 1 run tellraw @a[tag=bingo.game.player] [{"translate":"bingo.settings.vote","color":"#ffcc64"}]

execute unless score mod bingo.companion matches 1 run tellraw @a[tag=bingo.game.player] ["",{"text":"\n\n\n\n\n\n\n"},{"translate":"space.6"},{"text":"[vote]","color":"white",click_event:{action:'run_command',command:"/trigger bingo.vote.line"}},{"translate":"space.14"},{"text":"[vote]","color":"white",click_event:{action:'run_command',command:"/trigger bingo.vote.cross"}},{"translate":"space.14"},{"text":"[vote]","color":"white",click_event:{action:'run_command',command:"/trigger bingo.vote.full_house"}},{"translate":"space.-135"},{"text":"\u0005","font":"koncept:unicode"},{"translate":"space.-22"},{"text":"\u0006","font":"koncept:unicode"},{"translate":"space.-22"},{"text":"\u0007","font":"koncept:unicode"}]

scoreboard players add vote.line bingo.vote.type 0
scoreboard players add vote.cross bingo.vote.type 0
scoreboard players add vote.full_house bingo.vote.type 0
