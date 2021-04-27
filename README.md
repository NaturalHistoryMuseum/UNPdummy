# UNPdummy
Send dummy UNP data to audioBLAST!

## Temperature data
Source: https://en.climate-data.org/europe/united-kingdom/england/london-1/
Interpolated min/max to nearest day, sine model between interpolated minimum (midnight) and interpolated maximum (noon).
Model has minor non-continuity at midnight

## Humidity data
Source: https://en.climate-data.org/europe/united-kingdom/england/london-1/
Monthly maximum taken to be source value, monthly minimum 5% lower
Interpolated min/max to nearest day, sine model with maximum at dawn for each day
Model has minor non-continuity at midnight
