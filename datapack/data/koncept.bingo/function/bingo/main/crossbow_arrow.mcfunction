# Project created by the koncept

#arrow
execute as @s[nbt={Inventory: [{components: {"minecraft:charged_projectiles": [{components: {"minecraft:intangible_projectile": {}}, id: "minecraft:arrow"}]},count: 1,id:"minecraft:crossbow"}]}] run function koncept.bingo:bingo/advancement/crossbow_arrow
execute as @s[nbt={Inventory: [{components: {"minecraft:charged_projectiles": [{id: "minecraft:arrow"}]}, count: 1, id: "minecraft:crossbow"}]}] run function koncept.bingo:bingo/advancement/crossbow_arrow

#tipped_arrow
execute as @s[nbt={Inventory: [{components: {"minecraft:charged_projectiles": [{components: {"minecraft:intangible_projectile": {}}, id: "minecraft:tipped_arrow"}]},count: 1,id:"minecraft:crossbow"}]}] run function koncept.bingo:bingo/advancement/crossbow_arrow
execute as @s[nbt={Inventory: [{components: {"minecraft:charged_projectiles": [{components: {"minecraft:potion_contents": {}}, id: "minecraft:tipped_arrow"}]}, count: 1, id: "minecraft:crossbow"}]}] run function koncept.bingo:bingo/advancement/crossbow_arrow

#spectral_arrow
execute as @s[nbt={Inventory: [{components: {"minecraft:charged_projectiles": [{components: {"minecraft:intangible_projectile": {}}, id: "minecraft:spectral_arrow"}]},count: 1,id:"minecraft:crossbow"}]}] run function koncept.bingo:bingo/advancement/crossbow_arrow
execute as @s[nbt={Inventory: [{components: {"minecraft:charged_projectiles": [{id: "minecraft:spectral_arrow"}]}, count: 1, id: "minecraft:crossbow"}]}] run function koncept.bingo:bingo/advancement/crossbow_arrow