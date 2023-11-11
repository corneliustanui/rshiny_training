# load packages
library(dplyr)
library(stringr)
library(forcats)
library(ggplot2)

# load data
STIdata <- read.csv(file = "./Data/STIData.csv", 
                    stringsAsFactors=TRUE)
# clean data 
STIdata1 <- STIdata %>% 
  
  # keep only positive and negative cases, and non-blank sex
  filter(CaseStatus %in% c("Positive", "Negative") & Sex != "") %>% 
  
  # keep only relevant variables 
  select(c(CaseStatus, Date, Age = A1Age, Sex, Occupation = A2Occupation,
           Church = A3Church, LevelOfEducation = A4LevelOfEducation,
           MaritalStatus = A5MaritalStatus, Weight, Height,
           DurationOfillness, WhyhaveSTI = E8WhyhaveSTI, Typeofsti,
           Usedcondom = N11Usedcondom, TakenAlcohol = N13TakenAlcohol,
           SexDebut = N2SexDebut, AgeFirstSex)) %>% 
  
  # remove numbers in value labels and convert to upper case
  mutate(CaseStatus = toupper(stringr::str_replace(CaseStatus, "\\d", "")),
         Date = toupper(stringr::str_replace(Date, "\\d", "")),
         Sex = toupper(stringr::str_replace(Sex, "\\d", "")),
         Occupation = toupper(stringr::str_replace(Occupation, "\\d", "")),
         Church = toupper(stringr::str_replace(Church, "\\d", "")),
         LevelOfEducation = toupper(stringr::str_replace(LevelOfEducation, "\\d", "")),
         MaritalStatus = toupper(stringr::str_replace(MaritalStatus, "\\d", "")),
         WhyhaveSTI = toupper(stringr::str_replace(WhyhaveSTI, "\\d", "")),
         Typeofsti = toupper(stringr::str_replace(Typeofsti, "\\d\\)", "")),
         Usedcondom = toupper(stringr::str_replace(Usedcondom, "\\d", "")),
         TakenAlcohol = toupper(stringr::str_replace(TakenAlcohol, "\\d", "")),
         AgeFirstSex = toupper(AgeFirstSex)) %>% 
  
  # convert var names to upper case
  rename_with(str_to_upper)

# write data
saveRDS(object = STIdata1, 
        file = "./Data/Clean STI Data.rds")


plot1_data <- STIdata1 %>% 
  group_by(OCCUPATION, SEX, CASESTATUS) %>% 
  summarise(AGE = round(mean(AGE, na.rm = TRUE), 1)) %>% 
  group_by(OCCUPATION, SEX) %>% 
  mutate(INDEX = sum(AGE))


plot1 <- plot1_data %>% 
  ggplot(aes(x = fct_reorder(OCCUPATION, INDEX, .desc = TRUE),
             y = AGE, 
             fill = SEX)) +
  geom_col() +
  facet_wrap( ~ CASESTATUS, scales = "free")+
  coord_flip() +
  labs(title = "STI Status by Employment, Age and Sex", 
       x = "OCCUPATION",
       y = "AGE",
       caption = "Source: Survey Data, 2009") +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"))

plot1

plo2 <- plot1_data %>% 
  ggplot(aes(x = "", y = AGE, fill = CASESTATUS))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) +
  scale_fill_grey() +  
  theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )+ 
  theme(axis.text.x=element_blank())
plo2
