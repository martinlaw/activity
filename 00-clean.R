library(librarian)
shelf(readxl, here)
se <- read_excel(here("data", "SouthEast.xlsx"))
A <- read_excel(here("data", "A.xlsx"))
B <- read_excel(here("data", "B.xlsx"))
H <- read_excel(here("data", "H.xlsx"))
P <- read_excel(here("data", "P.xlsx"))

# SE
names(se)[names(se)=="Phusical"] <- "PH"
names(se)[names(se)=="Mental"] <- "MH"
# A
# B
B$Age <- NA
# H
names(H)[names(H)=="Physical"] <- "PH"
names(H)[names(H)=="Mental"] <- "MH"
H$Region <- "H"
H$SES5 <- NA
# P
se_clean <- se[, c("Belief", "PH", "MH", "Region", "Smoker", "SES5", "Gender", "Age")]
A_clean <- A[, c("Belief", "PH", "MH", "Region", "Smoker", "SES5", "Gender", "Age")]
B_clean <- B[, c("Belief", "PH", "MH", "Region", "Smoker", "SES5", "Gender", "Age")]
H_clean <- H[, c("Belief", "PH", "MH", "Region", "Smoker", "SES5", "Gender", "Age")]
P_clean <- P[, c("Belief", "PH", "MH", "Region", "Smoker", "SES5", "Gender", "Age")]
data <- rbind(se_clean, A_clean, B_clean, H_clean, P_clean)

### Cleaning
table(data$Belief)
data$Belief[data$Belief=="No"] <- "N"
data$Belief[data$Belief=="Yes"] <- "Y"
table(data$PH)
data$PH[data$PH %in% c("No", "NO")] <- "N"
data$PH[data$PH %in% c("Yes", "YES")] <- "Y"
table(data$MH)
data$MH[data$MH %in% c("No", "NO")] <- "N"
data$MH[data$MH %in% c("Yes", "YES")] <- "Y"
table(data$Region)
# Smoker
table(data$Smoker)
data$Smoker[data$Smoker=="No"] <- "N"
data$Smoker[data$Smoker=="Yes"] <- "Y"
# SES5
table(data$SES5)
# Gender
table(data$Gender)
data$Gender[data$Gender %in% c("Female")] <- "F"
data$Gender[data$Gender %in% c("Male")] <- "M"
# Age
data$Age <- as.numeric(data$Age)

data$Region <- as.factor(data$Region)
data$Smoker <- as.factor(data$Smoker)
data$Belief <- as.factor(data$Belief)
data$PH <- as.factor(data$PH)
data$MH <- as.factor(data$MH)
data$SES5 <- as.factor(data$SES5)
data$Gender <- as.factor(data$Gender)

saveRDS(data, here("data", "data_clean.rds"))
