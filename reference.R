
# Source of code: https://www.rdocumentation.org/packages/HistData/versions/0.8-4/topics/Nightingale

library(ggplot2)
library(reshape)
library(HistData)

# Combine the "Date", "Disease.rate", "Wounds.rate", and "Other.rate" columns into a new data frame.
nightingale <- Nightingale[ , c(1, 8:10)]
# nightingale

# Melt the data into a new data frame.
m <- melt(data = nightingale, id = "Date")
# m

# Rename the columns.
names(m) <- c("Date", "Cause of Death", "Number of Deaths")
m

m$"Cause of Death" <- sub("\\.rate", "", m$"Cause of Death")
# m$"Cause of Death"

# Separate the data into two parts: "April 1854 - March 1855" and "April 1855 - March 1856".
m$Regime <- ordered( rep(c(rep('Before', 12), rep('After', 12)), 3), 
                          levels=c('Before', 'After'))
# m$Regime
nightingale_1 <- subset(m, Date < as.Date("1855-04-01"))
nightingale_2 <- subset(m, Date >= as.Date("1855-04-01"))
nightingale_1 <- nightingale_1[order(nightingale_1$"Number of Deaths", decreasing = TRUE), ]
nightingale_2 <- nightingale_2[order(nightingale_2$"Number of Deaths", decreasing = TRUE), ]
m <- rbind(nightingale_1, nightingale_2)

coxcombs_1 <- ggplot(nightingale_1,
                   aes(x = factor(Date),
                       y = nightingale_1$"Number of Deaths",
                       fill = nightingale_1$"Cause of Death")) + geom_bar(width = 1, position = "identity", stat = "identity", color = "black") + scale_y_sqrt()
coxcombs_1 + coord_polar(start = 3 * pi/2) + ggtitle("Causes of Mortality in the Army in the East") + xlab("")

coxcombs_2 <- ggplot(nightingale_2,
                     aes(x = factor(Date),
                         y = nightingale_2$"Number of Deaths",
                         fill = nightingale_2$"Cause of Deaths")) + geom_bar(width = 1, position = "identity", stat = "identity", color = "black") + scale_y_sqrt()
coxcombs_2 + coord_polar(start = 3 * pi/2) + ggtitle("Causes of Mortality in the Army in the East") + xlab("")









