### script to build an SVM classification model and test it in R

library(e1071)
library(rpart)

df <- read.csv("path/to/your/file",header=T,stringsAsFactors=F)
df$DepVar=as.character(df$DepVar)   ## making the dependent variable categorical - necessary to say we need an SVM "classification" model

# split data into a train and test set
index <- 1:nrow(df)
testindex <- sample(index, trunc(length(index)/3))
testset <- df[testindex,]    ## 2/3 of the whole
trainset <- df[-testindex,]  ## 1/3 of the whole

## svm
svm.model <- svm(Type ~ ., data = trainset, cost = 100, gamma = 1)    ## choose the cost and gamma values according to the data
svm.pred <- predict(svm.model, testset[,-which(names(testset) %in% "DepVar")])  ## predicting with the model in the test dataset

plot(testset$IndVar1,testset$DepVar,pch=16)
# abline(svm.model)
points(testset$IndVar1,svm.pred,col="blue",pch=4)


### tuning the model for best values of cost and gamma
### finding the best possible svm model
tuneResult <- tune(svm, DepVar ~ c(IndVar1,IndVar2),  data = trainset,
                   ranges = list(epsilon = seq(0,1,0.1), cost = 2^(2:9)))
print(tuneResult)
# Draw the tuning graph
plot(tuneResult)

##### Finialising on best model
tunedModel <- tuneResult$best.model
tunedModelY <- predict(tunedModel, trainset) 
