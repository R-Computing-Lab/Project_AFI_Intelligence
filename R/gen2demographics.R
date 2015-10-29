# Set working directory
# setwd()

new_data <- read.table('gen2demographics.dat', sep=' ')
names(new_data) <- c('C0000100','C0000200','C0005300','C0005400')

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
  return(data)
}

varlabels <- c(    "ID CODE OF CHILD",
    "ID CODE OF MOTHER OF CHILD",
    "RACE OF CHILD (FROM MOTHERS SCREENER 79)",
    "SEX OF CHILD"
)

# Use qnames rather than rnums
qnames = function(data) {
  names(data) <- c("CPUBID_XRND","MPUBID_XRND","CRACE_XRND","CSEX_XRND")
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
