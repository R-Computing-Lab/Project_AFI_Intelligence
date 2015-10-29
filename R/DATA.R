####DATA
#file_drive= "C:"
file_drive="E:"
directory = "/Dropbox/"
cleaned_CFA_G_around_910811 <- read.csv(paste(file_drive,directory,"SAS/MyFolders/79/kidsintl/cleaned_CFA_G_around_910811.csv",sep=""), header=FALSE)
names(cleaned_CFA_G_around_910811)<-c("CASEID","ASEID","G_G2","G_SE_G2","MCASEID")
G_G2<-cleaned_CFA_G_around_910811