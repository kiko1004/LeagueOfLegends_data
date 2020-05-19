ddc$win = factor(ddc$win)
plot(ddc$win, ddc$dragonKills, col = "red", main = "Dragon Kills", xlab = "Outcome", ylab = "Num. of dragons killed")
plot(ddc$towerKills, ddc$dragonKills)
cor.test(ddc$towerKills, ddc$dragonKills)
