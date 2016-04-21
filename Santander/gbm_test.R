outcomeName<-'TARGET'
 predictorsNames<- names(train)[names(train)!=outcomeName]
objControl <- trainControl(method='cv', number=3, returnResamp='none', 
        summaryFunction = twoClassSummary, classProbs = TRUE)
objModel<- train(train[,predictorsNames], train[,outcomeName],method='gbm',
                 trControl=objControl,
                 metric = "ROC", preProc= c("center","scale"))
summary(objModel)
print(objModel)

print(postResample(pred=predictions, obs=as.factor(test[,"TARGET"])))
