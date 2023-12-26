## Description
Scrape the transistor count table from Wikipedia, clean it, create a chart, then run a simple linear regression model

![transistors](https://github.com/jhjanicki/transistors/assets/6565011/5972c008-7a2c-4fae-b5ae-c0699aa80ffc)

## Regression Results
### Residuals:
- Min: -32.137
- 1Q (First Quartile): -9.142
- Median: 4.712
- 3Q (Third Quartile): 11.927
- Max: 17.372

### Coefficients:
#### Intercept:
- Estimate: 2002.13710557297554
- Std. Error: 0.93109741304623
- t value: 2150.298
- Pr(>|t|): < 0.0000000000000002 (highly significant)
#### transistor_count:
- Estimate: 0.00000000036704
- Std. Error: 0.00000000005091
- t value: 7.209
- Pr(>|t|): 0.00000000000721 (highly significant)

### Residual Standard Error:
- Value: 13.51
- Degrees of Freedom: 241

### Model Fit Measures:
- Multiple R-squared: 0.1774
- Adjusted R-squared: 0.174
- F-statistic: 51.97
- p-value: 0.000000000007213 (highly significant)

### Analysis:
- Residuals: The distribution of residuals shows a range of values with a median close to 0, indicating that the residuals are centered around 0, a desirable characteristic.
- Coefficients: Both the intercept and the coefficient for transistor_count are statistically significant, as indicated by the low p-values.
- Residual Standard Error: The value of 13.51 represents the standard deviation of the residuals, indicating the average distance that the observed values fall from the regression line.
- Model Fit Measures: The R-squared value of 0.1774 indicates that the model explains approximately 17.74% of the variance in the response variable. The adjusted R-squared value is similar, suggesting that the model's explanatory power is not significantly affected by the number of predictors.

### Conclusion:
The model appears to have statistical significance, as indicated by the highly significant p-values for the coefficients and the F-statistic. However, the R-squared value of 0.1774 suggests that the model explains only a modest proportion of the variance in the response variable. While the model has statistical significance, the low R-squared value indicates that it may not be a good fit for explaining the variability in the data.

## Data
https://en.wikipedia.org/wiki/Transistor_count
