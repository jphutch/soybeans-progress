lapply(c('MASS',
         'stargazer',
         "lfe",
         "ggplot2",
         "dplyr",
         "strucchange",
         "gap",
         "boot",
         "stringr",
         "lme4"), require, character.only = TRUE)

setwd("C:/Users/jhtchns2/work/projects/soybeans-progress/")

df2 <- read.csv("./data/output_data/MG2_Private.csv")
df3 <- read.csv("./data/output_data/MG3_Private.csv")

DF2_CC <- df2 %>%                              # Applying group_by & summarise
  group_by(year) %>%
  summarise(count = n_distinct(company_name))

DF3_CC <- df3 %>%                              # Applying group_by & summarise
  group_by(year) %>%
  summarise(count = n_distinct(company_name))

df2 <- merge(df2,DF2_CC,by="year",all.x=T)
df3 <- merge(df3,DF3_CC,by="year",all.x=T)

df2$il_and_first <- as.numeric(df2$first_il=="IL_and_FIRST")
df3$il_and_first <- as.numeric(df3$first_il=="IL_and_FIRST")

df2_complete <- df2[complete.cases(df2$diff_d)&complete.cases(df2$diff_j),]
df2_reg23 <- df2_complete[(df2_complete$region=="region2")|(df2_complete$region=="region3"),]
df2_reg3 <- df2_complete[(df2_complete$region=="region3"),]
df3_complete <- df3[complete.cases(df3$diff_w),]
df3_reg23 <- df3_complete[(df3_complete$region=="region2")|(df3_complete$region=="region3"),]
df3_reg3 <- df3_complete[(df3_complete$region=="region3"),]

Y = c("diff_j_norm","diff_d_norm","diff_w_norm")

rain =  c('ppt_may', 'ppt_june', 'ppt_july', 'ppt_aug', 'ppt_sept',
          'ppt_may_sqr','ppt_june_sqr','ppt_july_sqr','ppt_aug_sqr','ppt_sept_sqr')

temp    =  c('tmin_5','tmin_6','tmin_7','tmin_8','tmin_9',
             'tmax_5','tmax_6','tmax_7','tmax_8','tmax_9',
             'tmean_5','tmean_6','tmean_7','tmean_8','tmean_9')

var_covars = c("height","lodging_comb","scn_resist","seed_treated")

factors = c("location","maturity_week","planting_week")

covars_w = c("height","lodging_comb","height_w","lodging_comb_w","seed_treated","scn_resist")
factors_w = c("location","maturity_week","maturity_week_w","planting_week")

covars_j = c("height","lodging_comb","height_j","lodging_comb_j","seed_treated","scn_resist")
factors_j = c("location","maturity_week","maturity_week_j","planting_week")

covars_d = c("height","lodging_comb","height_d","lodging_comb_d","seed_treated","scn_resist")
factors_d = c("location","maturity_week","maturity_week_d","planting_week")

fe_formula <- function(outcome,treat,X=var_covars,G=factors,C="location") {
  f <- paste0(outcome,"~",treat,"+",paste(X,collapse="+"),"|",paste(G,collapse="+"),"|","0","|",C)
  return(as.formula(f))
}
lm_formula <- function(outcome,treat,X=var_covars) {
  f <- paste0(outcome,"~",treat,"+",paste(X,collapse="+"))
  return(as.formula(f))
}



df2 <- read.csv("./data/output_data/MG2_Complete_FE.csv")
df3 <- read.csv("./data/output_data/MG3_Complete_FE.csv")

var_covars = c("height","lodging_comb","scn_resist","seed_treated")
covars = c(var_covars,temp,rain)
factors = c("location","maturity_week","planting_week")

REM <- lmer(lm_formula("yield_kg","(1|variety_id)",
                        X=c(covars,"as.factor(location)","as.factor(maturity_week)","as.factor(planting_week)")),
            data=df2)