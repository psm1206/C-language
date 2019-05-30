install.packages("readxl")

library(readxl)

df_exam1 <- read_excel("excel_exam.xlsx")
df_exam2 <- read_excel("c:/practice/excel_exam.xlsx")

df_exam2

mean(df_exam1$english)
mean(df_exam2$science)

df_exam3 <- read_excel("excel_exam_sheet.xlsx", col_names=F, sheet=3)
df_exam3

df_csv_exam <- read.csv("csv_exam.txt", header=F)

df_csv_exam

write.csv(df_exam, file = "df_exam.csv")

save(df_exam1, file = "df_exam1.rda")

load("df_exam1.rda")
rm(df_exam1)

df_exam1
