DT <- read.csv("path/to/your/csv",header=T,stringsAsFactors=F)

## suppose "columnName" is the column of values to be ranked and "group" is the category variable

## using plyr package
library(plyr)                
ddply(DT,transform,valRank = rank(DT$columnName))
ddply(DT,.(group),transform,valRank = rank(info,ties.method = "min"),
      valRankDense = as.integer(factor(info)))

## using base R functions
  do.call(rbind,by(DT,transform,valRank = rank(columnName)))
do.call(rbind,by(DT,DT$group,transform,valRank = rank(info,ties.method = "min"),
                 valRankDense = as.integer(factor(info))))
