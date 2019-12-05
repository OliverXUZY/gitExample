rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  a = as.numeric(args[1])
} else {
  cat('usage: Rscript myscript.R <a> <b> <output file>', file=stderr())
  stop()
}
library(MASS)
data = read.csv(paste('datadump_s5-00',a,'.csv',sep=''))
datacon=data[,c('winrole','gamemode','mapname','operator','primaryweapon','haswon','objectivelocation','primarygrip','primaryunderbarrel','primarybarrel','secondaryweapontype')]
data_1 = datacon[datacon['haswon']==1,]
count_role_mode = table(data_1$winrole,data_1$gamemode)
count_role_mode_all = table(datacon$winrole,datacon$gamemode)
ratio_role_mode = count_role_mode/count_role_mode_all
write.csv(ratio_role_mode,paste('role_mode',a,'.csv',sep=''))
count_role_map_all = table(datacon$winrole,datacon$mapname)
count_role_map = table(data_1$winrole,data_1$mapname)
ratio_role_map = count_role_map/count_role_map_all
write.csv(ratio_role_map,paste('role_map',a,'.csv',sep=''))
count_map_operator_all = table(datacon$mapname,datacon$operator)
count_map_operator = table(data_1$mapname,data_1$operator)
ratio_map_operator = count_map_operator/count_map_operator_all
write.csv(ratio_map_operator,paste('map_operator',a,'.csv',sep=''))
count_map_weapon_all = table(datacon$mapname,datacon$primaryweapon)
count_map_weapon = table(data_1$mapname,data_1$primaryweapon)
ratio_map_weapon=count_map_weapon/count_map_weapon_all
write.csv(ratio_map_weapon,paste('map_weapon',a,'.csv',sep=''))
datar = data[,c('haswon','primarygrip','primaryunderbarrel','primarybarrel','secondaryweapontype','role','nbkills',
'clearancelevel')]
logistic = glm(haswon~., data= datar, family=binomial)
coef = data.frame(feature =rownames(data.frame(coefficients(logistic)))[c(-1,-6,-10)], coef = data.frame(coefficients(logistic))[c(-1,-6,-10),] )
write.csv(coef,paste('logistic',a,'.csv',sep=''))
