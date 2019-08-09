
### Libraries
# Includes ggplot2, tibble, tidyr, readr, purrr, dplyr.
library(tidyverse)
# Includes table formatting tools.
library(table1)

### Data was copied from https://understandinguncertainty.org/node/214

### Background on Nightingale's Coxcombs can be read at https://understandinguncertainty.org/coxcombs

### Build table.
#read.delim() is a variation of read.table() that imports data as a data frame.
nightingale <- read.delim(file = "data.txt", header = FALSE, row.names = NULL, sep = "\t", dec = ".")
nightingale

### Format data frame.
# Columns
label(nightingale$V1) <- "Months"
label(nightingale$V2) <- "Average Size of Army"
label(nightingale$V3) <- "Deaths: Zymotic Diseases"
label(nightingale$V4) <- "Deaths: Wounds & Injuries"
label(nightingale$V5) <- "Deaths: All Other Causes"
label(nightingale$V6) <- "Annual Rate of Mortality per 1000: Zymotic Diseases"
label(nightingale$V7) <- "Annual Rate of Mortality per 1000: Wounds & Injuries"
label(nightingale$V8) <- "Annual Rate of Mortality per 1000: All Other Causes"
# Units
units(nightingale$V6) <- "12000D/S"
units(nightingale$V7) <- "12000D/S"
units(nightingale$V8) <- "12000D/S"

### Re-build table.
nightingale <- table1(~ V1 | V1, V2, V3, V4, V5, V6, V7, V8, data = nightingale)

### "...the second column represents S, the third column represent D, and the sixth column represents 12000D/S."

# Create a bar graph.

nightingale_bar <- ggplot(data = nightingale) +
                   geom_bar(mapping = aes(x = V1, fill = V1),
                            show.legend = FALSE, width = 1) +
                   theme(aspect.ratio = 1) +
                   labs(x = NULL, y = NULL)

nightingale_bar + coord_flip()
nightingale_bar + coord_polar()

data_diamonds <- diamonds
data_diamonds

bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()




