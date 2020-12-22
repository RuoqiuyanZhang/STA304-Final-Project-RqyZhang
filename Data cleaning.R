# load the complete dataset NHANES and tidyverse
#install.packages("tidyverse")
library(tidyverse)
# install.packages(’NHANES’)
library(NHANES)

# data cleaning and variable selection into smaller dataset
small.nhanes <- na.omit(NHANES[NHANES$SurveyYr=="2011_12"
                               & NHANES$Age > 17,c(1,3,4,13,46,69)])
small.nhanes <- as.data.frame(small.nhanes %>%
                                group_by(ID) %>% filter(row_number()==1) )
nrow(small.nhanes)
length(unique(small.nhanes$ID))