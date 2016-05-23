# R code to select the SubjectIDs
tmp <- read.csv("motor_completed500.csv")
tmp <- tmp[,1]
write(tmp, file="IDs_MC500.txt", ncol=1)