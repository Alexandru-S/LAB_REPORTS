data <- within(data, {
      prog <- factor(Date, levels=1:3, labels=c("Tallaght", "Tara St", "Finglas","Dolphins Barn", "Tara St", "Finglas"))
      id <- factor(id)
   })
summary(data)
