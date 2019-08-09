
# Includes ggplot2, tibble, tidyr, readr, purrr, dplyr.
library(tidyverse)

# Data was copied from https://understandinguncertainty.org/node/214

# Background on Nightingale's Coxcombs can be read at https://understandinguncertainty.org/coxcombs

# read.delim() is a variation of read.table() that imports data as a data frame.
nightingale <- read.delim(file = "data.txt", header = FALSE, row.names = NULL, sep = "\t", dec = ".")
nightingale

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




