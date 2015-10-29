# Set working directory
# setwd()

new_data <- read.table('afi_reliability.dat', sep=' ')
names(new_data) <- c('R0000100','R0000149','R0214700','R0214800','R0988000','R1020700','R1312200','R1379600','R1379700','R1379800','R1691600','R1760000','R1760100','R1760200')

# Handle missing values
  new_data[new_data == -1] = NA  # Refused 
  new_data[new_data == -2] = NA  # Dont know 
  new_data[new_data == -3] = NA  # Invalid missing 
  new_data[new_data == -4] = NA  # Valid missing 
  new_data[new_data == -5] = NA  # Non-interview 

# If there are values not categorized they will be represented as NA
vallabels = function(data) {
  data$R0214700 <- factor(data$R0214700, levels=c(1.0,2.0,3.0), labels=c("HISPANIC","BLACK","NON-BLACK, NON-HISPANIC"))
  data$R0214800 <- factor(data$R0214800, levels=c(1.0,2.0), labels=c("MALE","FEMALE"))
  data$R0988000 <- cut(data$R0988000, c(0.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,99999.0), labels=c("0 TO 9: < 10","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26 TO 99999: 26+"), right=FALSE)
  data$R1020700 <- cut(data$R1020700, c(0.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,99999.0), labels=c("0 TO 8: < 9","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25 TO 99999: 25+"), right=FALSE)
  data$R1312200 <- cut(data$R1312200, c(0.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,99999.0), labels=c("0 TO 9: < 10","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26 TO 99999: 26+"), right=FALSE)
  data$R1379600 <- cut(data$R1379600, c(0.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,27.0,99999.0), labels=c("0 TO 10: < 11","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27 TO 99999: 27+"), right=FALSE)
  data$R1379700 <- cut(data$R1379700, c(0.0,70.0,71.0,72.0,73.0,74.0,75.0,76.0,77.0,78.0,79.0,80.0,81.0,82.0,83.0,84.0,85.0,86.0,99999.0), labels=c("0 TO 69: < 70","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86 TO 99999: 86+"), right=FALSE)
  data$R1379800 <- cut(data$R1379800, c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,99999.0), labels=c("0: < 1","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17 TO 99999: 17+"), right=FALSE)
  data$R1691600 <- cut(data$R1691600, c(0.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,99999.0), labels=c("0 TO 9: < 10","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26 TO 99999: 26+"), right=FALSE)
  data$R1760000 <- cut(data$R1760000, c(0.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,27.0,99999.0), labels=c("0 TO 10: < 11","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27 TO 99999: 27+"), right=FALSE)
  data$R1760100 <- cut(data$R1760100, c(0.0,70.0,71.0,72.0,73.0,74.0,75.0,76.0,77.0,78.0,79.0,80.0,81.0,82.0,83.0,84.0,85.0,86.0,99999.0), labels=c("0 TO 69: < 70","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86 TO 99999: 86+"), right=FALSE)
  data$R1760200 <- cut(data$R1760200, c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,99999.0), labels=c("0: < 1","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17 TO 99999: 17+"), right=FALSE)
  return(data)
}

varlabels <- c(    "ID# (1-12686) 79",
    "HH ID # 79",
    "RACL/ETHNIC COHORT /SCRNR 79",
    "SEX OF R 79",
    "MALE AGE 1ST HAD INTERCOURSE 83",
    "F AGE 1ST HAD SEXUAL INTERCOURSE 83",
    "MALE AGE 1ST HAD INTERCOURSE 84",
    "F AGE 1ST HAD SEXUAL INTERCOURSE 84",
    "F USE B-DT YR 1ST INTERCOURSE 84",
    "F MO SEXUAL INTERCOURSE 1ST TIME 84",
    "MALE AGE 1ST HAD INTERCOURSE 85",
    "F AGE 1ST HAD SEXUAL INTERCOURSE 85",
    "F USE B-DT YR/1ST INTERCOURSE 85",
    "F MO SEXUAL INTERCOURSE 1ST TIME 85"
)

# Use qnames rather than rnums
qnames = function(data) {
  names(data) <- c("CASEID_1979","HHID_1979","SAMPLE_RACE_1979","SAMPLE_SEX_1979","MFER-15_1983","FFER-92_1983","MFER-15_1984","FFER-92_1984","FFER-92A_1984","FFER-92_M_1984","MFER-15_1985","FFER-92_1985","FFER-92A_1985","FFER-92_M_1985")
  return(data)
}

********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels. 
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
#new_data <- qnames(new_data)
#categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#summary(categories)

************************************************************************************************************
