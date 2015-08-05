library(MplusAutomation)
library(beepr)
library(ggplot2)
jplu=c(11,12,10,13)

new_data <- read.table("E:/Dropbox/SAS/MyFolders/G2Intel/standardized_data.dat", sep=' ')
names(new_data) <- c('C0000100','C0000200','C0005300','C0005400','C0005700','C0578400','C0578700','C0579000','C0579800','C0580100','C0580400','C0580700','C0581000','C0797500','C0797900','C0798200','C0798500','C0799300','C0799600','C0799900','C0800200','C0800500','C0997400','C0997700','C0998500','C0998800','C0999100','C0999400','C0999700','C1197700','C1198500','C1198800','C1199100','C1199400','C1199700','C1506700','C1507500','C1507800','C1508100','C1508400','C1508700','C1564400','C1564700','C1565000','C1565300','C1565600','C1799800','C1800100','C1800400','C1800700','C1801000','C2500700','C2503700','C2503900','C2504300','C2504600','C2529200','C2532200','C2532400','C2532800','C2533100','C2800500','C2803000','C2803200','C2803600','C2803900','C3108500','C3111500','C3111700','C3112100','C3112400','C3612200','C3615200','C3615400','C3615800','C3616100','C3990800','C3993800','C3994000','C3994400','C3994700','C5534800','C5537800','C5538000','C5538400','C5538700')
Gen2Age <- read.csv("E:/Dropbox/SAS/MyFolders/NLSYSAS/Gen2Age.csv")
names(Gen2Age)<-c("CASEID","MCASEID","YEARMONTH_BORN_G2")
Gen2Age$YRB<-floor(Gen2Age$YEARMONTH_BORN_G2/365+1960)
# Handle missing values
new_data[new_data == -1] = NA  # Refused 
new_data[new_data == -2] = NA  # Dont know 
new_data[new_data == -3] = NA  # Invalid missing 
new_data[new_data == -7] = NA  # Missing 

# If there are values not categorized they will be represented as NA
vallabels = function(data) {
  data$C0000100 <- cut(data$C0000100, c(1.0,9999999.0), labels=c("1 TO 9999999: See Min & Max values below for range as of this release"), right=FALSE)
  data$C0000200 <- cut(data$C0000200, c(1.0,12686.0), labels=c("1 TO 12686: NLSY79 Public ID"), right=FALSE)
  data$C0005300 <- factor(data$C0005300, levels=c(1.0,2.0,3.0), labels=c("HISPANIC","BLACK","NON-BLACK, NON-HISPANIC"))
  data$C0005400 <- factor(data$C0005400, levels=c(1.0,2.0), labels=c("MALE","FEMALE"))
  data$C0005700 <- cut(data$C0005700, c(1970.0,1979.0,1980.0,1981.0,1982.0,1983.0,1984.0,1985.0,1986.0,1987.0,1988.0,1989.0,1990.0,1991.0,1992.0,1993.0,1994.0,1995.0,1996.0,1997.0,1998.0,1999.0,2000.0,2001.0,2002.0,2003.0,2004.0,2005.0,2006.0,2007.0,2008.0,2009.0,2010.0,2011.0,2012.0,1978.0), labels=c("1970 TO 1978: < before 1979","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012"), right=FALSE)
  data$C0578400 <- cut(data$C0578400, c(0.0,1.0,100.0,200.0,300.0,400.0,500.0,600.0,700.0,800.0,900.0,1000.0,1100.0,1200.0,1300.0,1400.0,1500.0,9999999.0), labels=c("0","1 TO 99","100 TO 199","200 TO 299","300 TO 399","400 TO 499","500 TO 599","600 TO 699","700 TO 799","800 TO 899","900 TO 999","1000 TO 1099","1100 TO 1199","1200 TO 1299","1300 TO 1399","1400 TO 1499","1500 TO 9999999: 1500+"), right=FALSE)
  data$C0578700 <- cut(data$C0578700, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0579000 <- cut(data$C0579000, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0579800 <- cut(data$C0579800, c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,99999.0), labels=c("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16 TO 99999: 16+"), right=FALSE)
  data$C0580100 <- cut(data$C0580100, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0580400 <- cut(data$C0580400, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0580700 <- cut(data$C0580700, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0581000 <- cut(data$C0581000, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0797500 <- cut(data$C0797500, c(0.0,1.0,100.0,200.0,300.0,400.0,500.0,600.0,700.0,800.0,900.0,1000.0,1100.0,1200.0,1300.0,1400.0,1500.0,9999999.0), labels=c("0","1 TO 99","100 TO 199","200 TO 299","300 TO 399","400 TO 499","500 TO 599","600 TO 699","700 TO 799","800 TO 899","900 TO 999","1000 TO 1099","1100 TO 1199","1200 TO 1299","1300 TO 1399","1400 TO 1499","1500 TO 9999999: 1500+"), right=FALSE)
  data$C0797900 <- cut(data$C0797900, c(0.0,1.0,100.0,200.0,300.0,400.0,500.0,600.0,700.0,800.0,900.0,1000.0,1100.0,1200.0,1300.0,1400.0,1500.0,9999999.0), labels=c("0","1 TO 99","100 TO 199","200 TO 299","300 TO 399","400 TO 499","500 TO 599","600 TO 699","700 TO 799","800 TO 899","900 TO 999","1000 TO 1099","1100 TO 1199","1200 TO 1299","1300 TO 1399","1400 TO 1499","1500 TO 9999999: 1500+"), right=FALSE)
  data$C0798200 <- cut(data$C0798200, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0798500 <- cut(data$C0798500, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0799300 <- cut(data$C0799300, c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,99999.0), labels=c("0: < 1","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17 TO 99999: 17+"), right=FALSE)
  data$C0799600 <- cut(data$C0799600, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0799900 <- cut(data$C0799900, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0800200 <- cut(data$C0800200, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0800500 <- cut(data$C0800500, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0997400 <- cut(data$C0997400, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0997700 <- cut(data$C0997700, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0998500 <- cut(data$C0998500, c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,99999.0), labels=c("0: < 1","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17 TO 99999: 17+"), right=FALSE)
  data$C0998800 <- cut(data$C0998800, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0999100 <- cut(data$C0999100, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0999400 <- cut(data$C0999400, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C0999700 <- cut(data$C0999700, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1197700 <- cut(data$C1197700, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1198500 <- cut(data$C1198500, c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,99999.0), labels=c("0: < 1","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17 TO 99999: 17+"), right=FALSE)
  data$C1198800 <- cut(data$C1198800, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1199100 <- cut(data$C1199100, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1199400 <- cut(data$C1199400, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1199700 <- cut(data$C1199700, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1506700 <- cut(data$C1506700, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1507500 <- cut(data$C1507500, c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,99999.0), labels=c("0: < 1","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17 TO 99999: 17+"), right=FALSE)
  data$C1507800 <- cut(data$C1507800, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1508100 <- cut(data$C1508100, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1508400 <- cut(data$C1508400, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1508700 <- cut(data$C1508700, c(0.0,65.0,70.0,85.0,100.0,115.0,130.0,145.0,9999.0), labels=c("0 TO 64","65 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 144","145 TO 9999: 145 +"), right=FALSE)
  data$C1564400 <- factor(data$C1564400, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C1564700 <- cut(data$C1564700, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C1565000 <- cut(data$C1565000, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C1565300 <- cut(data$C1565300, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C1565600 <- cut(data$C1565600, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C1799800 <- factor(data$C1799800, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C1800100 <- cut(data$C1800100, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999"), right=FALSE)
  data$C1800400 <- cut(data$C1800400, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999"), right=FALSE)
  data$C1800700 <- cut(data$C1800700, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999"), right=FALSE)
  data$C1801000 <- cut(data$C1801000, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999"), right=FALSE)
  data$C2500700 <- factor(data$C2500700, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C2503700 <- cut(data$C2503700, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2503900 <- cut(data$C2503900, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2504300 <- cut(data$C2504300, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2504600 <- cut(data$C2504600, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2529200 <- factor(data$C2529200, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C2532200 <- cut(data$C2532200, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2532400 <- cut(data$C2532400, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2532800 <- cut(data$C2532800, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2533100 <- cut(data$C2533100, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2800500 <- factor(data$C2800500, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C2803000 <- cut(data$C2803000, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2803200 <- cut(data$C2803200, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2803600 <- cut(data$C2803600, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C2803900 <- cut(data$C2803900, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3108500 <- factor(data$C3108500, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C3111500 <- cut(data$C3111500, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3111700 <- cut(data$C3111700, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3112100 <- cut(data$C3112100, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3112400 <- cut(data$C3112400, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3612200 <- factor(data$C3612200, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C3615200 <- cut(data$C3615200, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3615400 <- cut(data$C3615400, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3615800 <- cut(data$C3615800, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3616100 <- cut(data$C3616100, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3990800 <- factor(data$C3990800, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C3993800 <- cut(data$C3993800, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3994000 <- cut(data$C3994000, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3994400 <- cut(data$C3994400, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C3994700 <- cut(data$C3994700, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C5534800 <- factor(data$C5534800, levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), labels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"))
  data$C5537800 <- cut(data$C5537800, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C5538000 <- cut(data$C5538000, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C5538400 <- cut(data$C5538400, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  data$C5538700 <- cut(data$C5538700, c(0.0,70.0,85.0,100.0,115.0,130.0,999999.0), labels=c("0 TO 69","70 TO 84","85 TO 99","100 TO 114","115 TO 129","130 TO 999999: 130 +"), right=FALSE)
  return(data)
}

varlabels <- c(    "ID CODE OF CHILD",
                   "ID CODE OF MOTHER OF CHILD",
                   "RACE OF CHILD (FROM MOTHERS SCREENER 79)",
                   "SEX OF CHILD",
                   "DATE OF BIRTH OF CHILD - YEAR",
                   "MEMORY FOR LOCATION: STD SCORE 86",
                   "VERBAL MEMORY A & B (WORDS) STD SCORE 86",
                   "VERBAL MEMORY C (STORY) STD SCORE 86",
                   "DIGIT SPAN: TOTAL STD SCORE 86",
                   "PIAT MATH: TOTAL STD SCORE 86",
                   "PIAT READ REC: TOTAL STD SCORE 86",
                   "PIAT READ COMP: TOTAL STD SCORE 86",
                   "PPVT: TOTAL STD SCORE 86",
                   "BODY PARTS: STANDARD SCORE 88",
                   "MEMORY FOR LOCATION: STD SCORE 88",
                   "VERBAL MEMORY A & B (WORDS) STD SCORE 88",
                   "VERBAL MEMORY C (STORY) STD SCORE 88",
                   "DIGIT SPAN: TOTAL STD SCORE 88",
                   "PIAT MATH: TOTAL STD SCORE 88",
                   "PIAT READ REC: TOTAL STD SCORE 88",
                   "PIAT READ COMP: TOTAL STD SCORE 88",
                   "PPVT: TOTAL STD SCORE 88",
                   "VERBAL MEMORY A & B (WORDS) STD SCORE 90",
                   "VERBAL MEMORY C (STORY) STD SCORE 90",
                   "DIGIT SPAN: TOTAL STD SCORE 90",
                   "PIAT MATH: TOTAL STD SCORE 90",
                   "PIAT READ REC: TOTAL STD SCORE 90",
                   "PIAT READ COMP: TOTAL STD SCORE 90",
                   "PPVT: TOTAL STD SCORE 90",
                   "VERB MEM A & B (WORDS): STAND SCORE -92",
                   "DIGIT SPAN: TOTAL STANDARD SCORE - 92",
                   "PIAT MATH: TOTAL STANDARD SCORE - 92",
                   "PIAT READ REC: TOTAL STNDRD SCORE - 92",
                   "PIAT READ COMP: TOTAL STAND SCORE - 92",
                   "PPVT: TOTAL STANDARD SCORE - 92",
                   "VERB MEM A & B (WORDS): STAND SCORE -94",
                   "DIGIT SPAN: TOTAL STANDARD SCORE - 94",
                   "PIAT MATH: TOTAL STANDARD SCORE - 94",
                   "PIAT READ REC: TOTAL STNDRD SCORE - 94",
                   "PIAT READ COMP: TOTAL STAND SCORE - 94",
                   "PPVT: TOTAL STANDARD SCORE - 94",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 96",
                   "PIAT MATH: TOTAL STANDARD SCORE 96",
                   "PIAT READ REC: TOTAL STNDRD SCORE 96",
                   "PIAT READ COMP: TOTAL STAND SCORE 96",
                   "PPVT: TOTAL STANDARD SCORE 96",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 1998",
                   "PIAT MATH: TOTAL STANDARD SCORE 1998",
                   "PIAT READ REC: TOTAL STNDRD SCORE 1998",
                   "PIAT READ COMP: TOTAL STAND SCORE 1998",
                   "PPVT: TOTAL STANDARD SCORE 1998",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 2000",
                   "PIAT MATH: TOTAL STANDARD SCORE 2000",
                   "PIAT READ REC: TOTAL STNDRD SCORE 2000",
                   "PIAT READ COMP: TOTAL STAND SCORE 2000",
                   "PPVT: TOTAL STANDARD SCORE 2000",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 2002",
                   "PIAT MATH: TOTAL STANDARD SCORE 2002",
                   "PIAT READ REC: TOTAL STNDRD SCORE 2002",
                   "PIAT READ COMP: TOTAL STAND SCORE 2002",
                   "PPVT: TOTAL STANDARD SCORE 2002",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 2004",
                   "PIAT MATH: TOTAL STANDARD SCORE 2004",
                   "PIAT READ REC: TOTAL STNDRD SCORE 2004",
                   "PIAT READ COMP: TOTAL STAND SCORE 2004",
                   "PPVT: TOTAL STANDARD SCORE 2004",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 2006",
                   "PIAT MATH: TOTAL STANDARD SCORE 2006",
                   "PIAT READ REC: TOTAL STNDRD SCORE 2006",
                   "PIAT READ COMP: TOTAL STAND SCORE 2006",
                   "PPVT: TOTAL STANDARD SCORE 2006",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 2008",
                   "PIAT MATH: TOTAL STANDARD SCORE 2008",
                   "PIAT READ REC: TOTAL STNDRD SCORE 2008",
                   "PIAT READ COMP: TOTAL STAND SCORE 2008",
                   "PPVT: TOTAL STANDARD SCORE 2008",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 2010",
                   "PIAT MATH: TOTAL STANDARD SCORE 2010",
                   "PIAT READ REC: TOTAL STNDRD SCORE 2010",
                   "PIAT READ COMP: TOTAL STAND SCORE 2010",
                   "PPVT: TOTAL STANDARD SCORE 2010",
                   "DIGIT SPAN: TOTAL STANDARD SCORE 2012",
                   "PIAT MATH: TOTAL STANDARD SCORE 2012",
                   "PIAT READ REC: TOTAL STNDRD SCORE 2012",
                   "PIAT READ COMP: TOTAL STAND SCORE 2012",
                   "PPVT: TOTAL STANDARD SCORE 2012"
)

# Use qnames rather than rnums
qnames = function(data) {
  names(data) <- c("CASEID","MCASEID","CRACE","CSEX","CYRB","LOCAZ1986_1986","VERBAZ1986_1986","VERBCZ1986_1986","DIGITZ1986_1986","MATHZ1986_1986","RECOGZ1986_1986","COMPZ1986_1986","PPVTZ1986_1986","BODYZ1988_1988","LOCAZ1988_1988","VERBAZ1988_1988","VERBCZ1988_1988","DIGITZ1988_1988","MATHZ1988_1988","RECOGZ1988_1988","COMPZ1988_1988","PPVTZ1988_1988","VERBAZ1990_1990","VERBCZ1990_1990","DIGITZ1990_1990","MATHZ1990_1990","RECOGZ1990_1990","COMPZ1990_1990","PPVTZ1990_1990","VERBAZ1992_1992","DIGITZ1992_1992","MATHZ1992_1992","RECOGZ1992_1992","COMPZ1992_1992","PPVTZ1992_1992","VERBAZ1994_1994","DIGITZ1994_1994","MATHZ1994_1994","RECOGZ1994_1994","COMPZ1994_1994","PPVTZ1994_1994","DIGITZ1996_1996","MATHZ1996_1996","RECOGZ1996_1996","COMPZ1996_1996","PPVTZ1996_1996","DIGITZ1998_1998","MATHZ1998_1998","RECOGZ1998_1998","COMPZ1998_1998","PPVTZ1998_1998","DIGITZ2000_2000","MATHZ2000_2000","RECOGZ2000_2000","COMPZ2000_2000","PPVTZ2000_2000","DIGITZ2002_2002","MATHZ2002_2002","RECOGZ2002_2002","COMPZ2002_2002","PPVTZ2002_2002","DIGITZ2004_2004","MATHZ2004_2004","RECOGZ2004_2004","COMPZ2004_2004","PPVTZ2004_2004","DIGITZ2006_2006","MATHZ2006_2006","RECOGZ2006_2006","COMPZ2006_2006","PPVTZ2006_2006","DIGITZ2008_2008","MATHZ2008_2008","RECOGZ2008_2008","COMPZ2008_2008","PPVTZ2008_2008","DIGITZ2010_2010","MATHZ2010_2010","RECOGZ2010_2010","COMPZ2010_2010","PPVTZ2010_2010","DIGITZ2012_2012","MATHZ2012_2012","RECOGZ2012_2012","COMPZ2012_2012","PPVTZ2012_2012")
  return(data)
}


substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}

total_data <- qnames(new_data)
total_data$YRB<-Gen2Age$YRB
x<-names(total_data)
xframe=data.frame(as.character(x),substrRight(x,4),stringsAsFactors=FALSE)
names(xframe)<-c("varname","year")
xframe$year<-as.numeric(xframe$year)
xframe<-na.omit(xframe)
x<-NULL
total_data$ASEID<-(substrRight(total_data$CASEID,2))
for (i in seq(1986,2012, by=2)) {
  List<-list()
  for (j in 1:length(xframe$year)){
    if (xframe$year[j]==i) List[[length(List)+1]] <- xframe$varname[j]
    assign(paste0("y",i),  List)
  }
}
total_data$ROUND<- rep(-9999, length(total_data[,1]))
total_data$ROUND[total_data$ROUND == -9999] = NA
total_data$AGE<- rep(-9999, length(total_data[,1]))
total_data$AGE[total_data$AGE == -9999] = NA
List<-list()
for (i in seq(1986,2012, by=2)) { 
  dataframe<-data.frame(total_data$CASEID,total_data$ASEID,
                        total_data$MCASEID,total_data$YRB,
                        total_data$AGE,total_data$ROUND)
  names(dataframe)<-c("CASEID","ASEID","MCASEID","YRB","AGE","ROUND")
  dataframe$AGE<- as.numeric(i-total_data$YRB)
  dataframe$AGE[dataframe$AGE < 0] <- NA
  
  
  
  for (n in 1:eval(parse(text=paste0("length(y",i,")")))) {
    
    varname<-eval(parse(text=paste0("total_data$",
                                    eval(parse(text=paste0("y",i,"[[",n,"]]"))))))
    eval(parse(text=paste0("dataframe$",eval(parse(text=paste0("y",i,"[[",n,"]]")))
                           ,"<-varname")))
    dataframe$ROUND<-i
    assign(paste0("TotalVars_",i),  dataframe)
  }
}

masterlist<-substr(names(TotalVars_2012), 1, 4)
for (i in seq(1986,2012, by=2)) { 
  crosslist<-names(eval(parse(text= paste0("TotalVars_",i))))
  crosslist<-substr(crosslist, 1, 4)
  eval(parse(text= paste0( "CommonVars_",i,
                           " <- TotalVars_",i,"[ , crosslist %in%  masterlist ]")))
}

G_at_<-data.frame(total_data$CASEID,total_data$ASEID,total_data$MCASEID,total_data$YRB)
names(G_at_)<-c("CASEID","ASEID","MCASEID","YRB")
G_at_$AGE  <- rep(-9999, length(G_at_[,1]))   
G_at_$ROUND  <- rep(-9999, length(G_at_[,1]))   
G_at_$DIGIT<- rep(-9999, length(G_at_[,1]))

G_at_$MATH<- rep(-9999, length(G_at_[,1]))

G_at_$RECOG<- rep(-9999, length(G_at_[,1]))

G_at_$COMP<- rep(-9999, length(G_at_[,1]))

G_at_$PPVT <- rep(-9999, length(G_at_[,1]))
G_at_[G_at_ == -9999] = NA
for (x in 1:length(jplu)) { 
  j=jplu[x]
  dataframe<-G_at_
  for (n in 1:length(G_at_[,1])) {
    for (i in seq(1986,2012, by=2)) { 
      Age_Match= eval(parse(text=paste0("CommonVars_",i,"$AGE[",n,"] == ",j)))
      if (isTRUE(Age_Match))
        dataframe[n,]<- eval(parse(text= paste0("CommonVars_",i,"[",n,",]")))
    }  
    #if (is.na(dataframe$DIGIT[n])) dataframe$DIGIT[n]<- sum(c(dataframe$DIGITF[n], dataframe$DIGITB[n]))
  }
  #  write.table(dataframe, file=paste0("E:/Dropbox/MPlus/G2Intel/1 years/G_around_",j,".csv"), row.names=FALSE, col.names=FALSE,na="-9999", sep=",")
  
  assign(paste0("G_at_",j),  dataframe)
  
}
for (x in 1:length(jplu[1:3])) { 
  j=jplu[x]
  dataframe<- eval(parse(text= paste0("G_at_",j)))
  
  jplus=jplu[x+1]
  for (n in 1:length(dataframe[,1])) {
    for (w in 1:length(dataframe[1,])) {
      NA_Test= dataframe[n,w]
      if (is.na(NA_Test))
        dataframe[n,w]<- eval(parse(text= paste0("G_at_",jplus,"[",n,",",w,"]")))    
    }
  }
  #  write.table(dataframe, file=paste0("E:/Dropbox/MPlus/G2Intel/2 years/G_around_",j,jplus,".csv"), row.names=FALSE, col.names=FALSE,na="-9999", sep=",")
  
  assign(paste0("G_around_",j,jplus),  dataframe)
  
}
for (x in 1:length(jplu[1:2])) { 
  j=jplu[x]
  jplus=jplu[x+1]
  jplusplus=jplu[x+2]
  dataframe<- eval(parse(text= paste0("G_around_",j,jplus)))
  for (n in 1:length(dataframe[,1])) {
    for (w in 1:length(dataframe[1,])) {
      NA_Test= dataframe[n,w]
      if (is.na(NA_Test))
        dataframe[n,w]<- eval(parse(text= paste0("G_at_",jplusplus,"[",n,",",w,"]")))    
    }
  }
  # write.table(dataframe, file=paste0("E:/Dropbox/MPlus/G2Intel/3 years/G_around_",j,jplus,jplusplus,".csv"), row.names=FALSE, col.names=FALSE,na="-9999", sep=",")
  
  assign(paste0("G_around_",j,jplus,jplusplus),  dataframe)
  
}

for (x in 1:length(jplu[1])) { 
  j=jplu[x]
  jplus=jplu[x+1]
  jplusplus=jplu[x+2]
  jplusplusplus=jplu[x+3]
  dataframe<- eval(parse(text= paste0("G_around_",j,jplus,jplusplus)))
  for (n in 1:length(dataframe[,1])) {
    for (w in 1:length(dataframe[1,])) {
      NA_Test= dataframe[n,w]
      if (is.na(NA_Test))
        dataframe[n,w]<- eval(parse(text= paste0("G_at_",jplusplusplus,"[",n,",",w,"]")))    
    }
  }
  # write.table(dataframe, file=paste0("E:/Dropbox/MPlus/G2Intel/4 years/G_around_",j,jplus,jplusplus,jplusplusplus,".csv"), row.names=FALSE, col.names=FALSE,na="-9999", sep=",")
  
  mplus <- mplusObject(
    TITLE = paste0("CFA G_around_",j,jplus,jplusplus,jplusplusplus,";"),
    
    usevariables  = 
      c("CASEID","ASEID","MCASEID","YRB","AGE","ROUND","DIGIT",
        "MATH", "RECOG", "COMP", "PPVT"),
    VARIABLE="USEVARIABLES ARE DIGIT MATH RECOG  COMP PPVT;
    CLUSTER = MCASEID;
    auxiliary =CASEID ASEID;",
    
    ANALYSIS = "TYPE= complex;
    
    ESTIMATOR=MLR;
    iterations=200000;",
    MODEL = "g by DIGIT MATH RECOG COMP PPVT;",
    OUTPUT = "STANDARDIZED;",
    SAVEDATA=paste0("FILE IS CFA_G_around_",j,jplus,jplusplus,jplusplusplus,".csv; 
                    SAVE IS fscores; 
                    FORMAT IS free;"),
    rdata=dataframe)
  res<- mplusModeler(mplus, modelout = paste0("E:/Dropbox/MPlus/G2Intel/1112zcenter/G_around_",j,jplus,jplusplus,jplusplusplus,".inp"), run = 0L)
  
  prepareMplusData(dataframe, paste0("E:/Dropbox/MPlus/G2Intel/1112zcenter/G_around_",j,jplus,jplusplus,jplusplusplus,".dat"))
  
  assign(paste0("G_around_",j,jplus,jplusplus,jplusplusplus),  dataframe)
  assign(paste0("mplus_G_around_",j,jplus,jplusplus,jplusplusplus),  mplus)
}
runModels(directory ="E:/Dropbox/MPlus/G2Intel/1112zcenter/")
ModelSummaries_1112zcenter<-extractModelSummaries(target = "E:/Dropbox/MPlus/G2Intel/1112zcenter")


write.table(ModelSummaries_1112zcenter, file="E:/Dropbox/MPlus/G2Intel/1112zcenter/ModelSummaries_1112zcenter.csv",row.names=FALSE, na="-9999", sep=",")
beep()
