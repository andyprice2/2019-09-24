library(readxl)
library(tidyverse)
library(janitor)
enrollment_09_24 <- read_excel("class_enrollment_summary_by_term_9.24.19.xlsx", skip = 3) %>% clean_names()

enrollment_09_24 %>% filter(course_department == "Government") %>% arrange(desc(total))
