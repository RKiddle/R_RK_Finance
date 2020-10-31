library(tidyquant)
library(tidyverse)
.rs.restartR()
inoptions("getSymbols.warning4.0"=FALSE)
options("getSymbols.yahoo.warning"=FALSE)
# Downloading Apple price using quantmod

getSymbols("AAPL", from = '2017-01-01',
           to = "2018-03-01",warnings = FALSE,
           auto.assign = TRUE)

head(AAPL)

class(AAPL)

chart_Series(AAPL)

chart_Series(AAPL['2017-12/2018-03'])

tickers = c("AAPL", "NFLX", "AMZN", "K", "O")

getSymbols(tickers,
           from = "2017-01-01",
           to = "2017-01-15")

prices <- map(tickers,function(x) Ad(get(x)))
prices <- reduce(prices,merge)
colnames(prices) <- tickers

head(prices)

class(prices)

prices %>%
  group_by(symbol) %>%
  slice(1)

prices %>%
  ggplot(aes(x = date, y = adjusted, color = symbol)) +
  geom_line()

prices %>%
  ggplot(aes(x = date, y = adjusted, color = symbol)) +
  geom_line() +
  facet_wrap(~symbol,scales = 'free_y') +
  theme_classic() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Price Chart") +
  scale_x_date(date_breaks = "month",
               date_labels = "%b\n%y")

getSymbols("NFLX", from = '2017-01-01',
           to = "2018-03-01",warnings = FALSE,
           auto.assign = TRUE)
head(NFLX)

chart_Series(NFLX)
