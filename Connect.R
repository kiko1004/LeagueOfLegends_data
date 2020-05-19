library(httr)
library(jsonlite)
library(dplyr)
dd <- teams #currently empty, must load new with read.csv when reopen
matchid <- c(2479909972:2479910972) #Updated for 1000
apiK <- "hidden" #must be updated
for (i in matchid) {
  link <- paste("https://eun1.api.riotgames.com/lol/match/v4/matches/",i,apiK, sep = "")
  res = GET(link)
  data = fromJSON(rawToChar(res$content))
  teams <- data$teams
  participants <- data$participants
  dd <- bind_rows(dd, teams)
}

ddc <- dd[,-16]
newdd <- distinct(ddc)
Agregated_match=newdd %>% 
  group_by(win) %>% 
  summarise(firstDragon=sum(firstDragon,na.rm=T), firstBaron=sum(firstBaron),
            firstRiftHerald = sum(firstRiftHerald), AverageDragonKills = mean(dragonKills))

write.csv(Agregated_match,"Agregated Match Data.csv")
write.csv(ddc, "Cleaned Raw Data.csv")
write.csv(dd, "Dirty Raw Data.csv")
