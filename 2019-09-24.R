library(readxl)
library(tidyverse)
library(janitor)
enrollment_09_24 <- read_excel("class_enrollment_summary_by_term_9.24.19.xlsx", skip = 3) %>% clean_names() 
#enrollment_09_24 %>% filter(course_department == "Government") %>% arrange(desc(total))

enrollment_09_17 <- read_excel("class_enrollment_summary_by_term_9.17.19.xlsx", skip = 3) %>% clean_names() 

enrollment_combined <- enrollment_09_17 %>%
inner_join(enrollment_09_24, by = c("course_id", "course_name", "course_title"), suffix = c("_17", "_24")) %>% 
  mutate(undergrad_drops = u_grad_17 - u_grad_24)

View(enrollment_combined)
