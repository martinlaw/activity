library(librarian)
shelf(readxl, here)
se <- read_excel(here("data", "SouthEast.xlsx"))
A <- read_excel(here("data", "A.xlsx"))
B <- read_excel(here("data", "B.xlsx"))
H <- read_excel(here("data", "H.xlsx"))
P <- read_excel(here("data", "P.xlsx"))

head(se)

# ph, mh, belief, age
# SE
names(se)
names(se)[names(se)=="Phusical"] <- "PH"
names(se)[names(se)=="Mental"] <- "MH"
# A
names(A)
# B
names(B)
# H
names(H)
names(H)[names(H)=="Physical"] <- "PH"
names(H)[names(H)=="Mental"] <- "MH"
H$Region <- NA
# P
names(P)

se_clean <- se[, c("Belief", "PH", "MH", "Region")]
A_clean <- A[, c("Belief", "PH", "MH", "Region")]
B_clean <- B[, c("Belief", "PH", "MH", "Region")]
H_clean <- H[, c("Belief", "PH", "MH", "Region")]
P_clean <- P[, c("Belief", "PH", "MH", "Region")]

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


