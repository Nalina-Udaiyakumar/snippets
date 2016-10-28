### Script to extract some match details from an scorecard link

## libraries
library(XML)
library(stringr)
library(RCurl)

## match url
url<-"http://www.espncricinfo.com/indian-premier-league-2016/engine/match/980901.html"

## parsing the webpage
newrep.doc=htmlParse(url)

## getting playerid for all players in the match
players=xpathSApply(newrep.doc,"//*/a[@class='playerName']",xmlValue) ## extracting player names
# players=gsub("[^[:alnum:]['-]", " ", players)
players=gsub("[^[a-zA-Z]|\\s|\\,]"," ",players) ## removing any symbols from names
players=data.frame(str_trim(players))  ## removing extra whitespaces
colnames(players)="Player"
playerids=xpathSApply(newrep.doc,"//*/a[@class='playerName']",xmlAttrs) ## extracting player links
playerids=t(playerids)
playerids=as.data.frame(playerids[,"href"])
colnames(playerids)="PlayerID"
players=cbind(players,playerids)
players[,"PlayerID"]=str_sub(players[,"PlayerID"],start=as.integer(str_locate(players[,"PlayerID"],"player/")[,2])+1,
                             end=as.integer(str_locate(players[,"PlayerID"],".html")[,1])-1)
players[,"PlayerID"]=str_trim(players[,"PlayerID"])

## getting the team names
teams=str_trim((xpathSApply(newrep.doc, "//*/th[@class='th-innings-heading']",xmlValue)))
teams=str_trim(teams)

## some more details
result=xpathSApply(newrep.doc,"//*/div[@class='innings-requirement']",xmlValue)
result=str_trim(result)
link=xpathSApply(newrep.doc,"//*/div[@class='space-top-bottom-5']",xmlValue)
link=str_replace_all(link,"\n","")
link=str_trim(link)
series=link[1]
series=str_trim(series)
