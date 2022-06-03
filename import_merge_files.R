library(data.table)
library(readr)
library(here)

setwd("C:/Users/Fabian Scheifele/Documents/GitHub/greeninno_complexity/data/csvs")
tbl_fread <- list.files(pattern = "*.csv") %>% 
  map_df(~fread(., header=T, fill = T,
                   sep= ";", na.strings = c("",NA), data.table = F,
                   stringsAsFactors = FALSE))

saveRDS(tbl_fread, file=here("data","y02_allpatents.rds"))
write.csv(tbl_fread, file=here("data","y02_allpatents.csv"), quote = FALSE, row.names = TRUE) 

