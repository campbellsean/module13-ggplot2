# Exercise 1: ggplot2 basics

install.packages('ggplot2')
library(ggplot2)
library(dplyr)

View(mpg)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class), size = 4)

# Strait from lecture
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class))






View(diamonds)
?diamonds
# For this exercise you'll be working with the `diamonds` data set included in the ggplot2 library
# Use `?diamonds` to get more information about this data set (including the column descriptions
# Also check the _column names_ and the _number of rows_ in the data set

# This data set has a lot of rows. To make things a bit more readable,
# use dplyr's `sample_n()` function to get a random 1000 rows from the data set
# Store this sample in a variable `diamonds.sample`
diamonds.sample <- sample_n(diamonds, 1000)

# Start by making a new `ggplot` with the `diamonds.sample` as the data (no geometry yet)
# What do you see?
ggplot(data = diamonds.sample)
# I see a gray blank space.

# Draw a scatter plot (with point geometry) with for the `diamonds.sample` set,
# with the `carat` mapped to the x-position and `price` mapped to the y-position.
ggplot(data = diamonds.sample) + 
  geom_point(mapping = aes(x = carat, y = price), size = 4)

# Draw the same plot as above, but color each of the points based on their clarity.
ggplot(data = diamonds.sample) + 
  geom_point(mapping = aes(x = carat, y = price, color = clarity), size = 4)

# Draw the same plot as above, but for the entire `diamonds` data set. Note this may take
# a few seconds to generate.
ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price, color = clarity), size = 3)

# Draw another scatter plot for `diamonds.sample` of price (y) by carat (x),
# but with all of the dots colored "blue".
# Hint: you'll need to set the color channel, not map a value to it!
ggplot(data = diamonds.sample) + 
  geom_point(mapping = aes(x = carat, y = price), color = 'blue')

# Draw a scatter plot for `diamonds.sample` of `price` by `carat`, where each
# point has an aesthetic _shape_ based on the diamond's `cut`.
ggplot(data = diamonds.sample) + 
  geom_point(mapping = aes(x = carat, y = price, shape = cut, color = clarity))

# Draw a scatter plot for `diamonds.sample` of *`cut`* by `carat`, where each
# point has an aesthetic _size_ based on the diamond's *`price`*
ggplot(data = diamonds.sample) + 
  geom_point(mapping = aes(x = cut, y = carat, size = price))

# Try coloring the above plot based on the diamond's price!
ggplot(data = diamonds.sample) + 
  geom_point(mapping = aes(x = cut, y = carat, size = price, color = price))

# Draw a line plot (with line geometry) for `diamonds.sample`. The x-position should be mapped to
# carat, y-position to price, and color to carat.
ggplot(data = diamonds.sample) +
  geom_line(mapping = aes(x = carat, y = price, color = carat))

# That's kind of messy. Try using `smooth` geometry instead.
ggplot(data = diamonds.sample) +
  geom_smooth(mapping = aes(x = carat, y = price, color = carat))

# Draw a plot with bar geometry (a bar chart), mapping the diamond's `cut` to the x-axis
ggplot(data = diamonds.sample) +
  geom_bar(mapping = aes(x = cut))

# Add an aesthetic property that will _fill_ each bar geometry based on the `clarity` of the diamonds
# What kind of chart do you get?
ggplot(data = diamonds.sample) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

# Draw a histogram of diamond prices.
# Try mapping each bar based on clarity as well!
ggplot(data = diamonds.sample) +
  geom_histogram(mapping = aes(x = price))

# (For a more traditional "bell-curve", make a histogram of diamond `depths`)
ggplot(data = diamonds.sample) +
  geom_histogram(mapping = aes(x = depth))

# Draw a plot of the `diamonds.sample` data (price by carat), with both points for each
# diamond AND smoothed lines for each cut (hint: in a separate color)
# Making the points have some `alpha` transparency will make the plot look nicer
ggplot(data = diamonds.sample) +
  geom_smooth(mapping = aes(x = price, y = carat))

ggplot(data = diamonds.sample, mapping = aes(x = price, y = carat, alpha = 0.5)) +
  geom_point() +
  geom_smooth(se = FALSE)

# multiple geoms (point & smooth)
?geom_smooth

## Bonus
# Draw a bar chart of average diamond prices by clarity, and include "error bars" marking
# the standard error of each measurement.
#
# You can calculate standard error as the _standard deviation_ divided by the square root
# of the number of measurements (prices)

# Start by creating a data frame `diamond.summary` that includes summarized data for each clarity group.
# Your summary data shuld include the mean price and the standard error of the price.


# Then draw the plot. The error bars should stretch from the mean-error to the mean+error.
