library(boot) 

melanoma2 <- melanoma
 
# Factor the basic variables that
# we're interested in
melanoma2$status <- 
  factor(melanoma2$status, 
         levels=c(2,1,3),
         labels=c("Alive", # Reference
                  "Melanoma death", 
                  "Non-melanoma death"))
                  
table1(~ factor(sex) + age + factor(ulcer) + thickness | status, data=melanoma2)