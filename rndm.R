set.seed(1234)
trainCtl<-trainControl(method="cv",5)
trainDt<-train[1:100,]
modelRf<-train(TARGET~.,data=trainDt,method="rf",trControl=trainCtl,ntree=250, importance=TRUE)
varImp(modelRf)
plot.train(modelRf)
testDt<-test[1:100,]
testDt$TARGET<--1
predRf<-predict(modelRf,testDt)
