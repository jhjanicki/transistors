## Description
Scrape the transistor count table from Wikipedia, clean it, create a chart, then run a simple linear regression model

![transistors](https://github.com/jhjanicki/transistors/assets/6565011/5972c008-7a2c-4fae-b5ae-c0699aa80ffc)

## Linear Regression Results
### Residuals:
The distribution of residuals provides information about the model's ability to capture the variation in the response variable.
- Min: -32.137
- 1Q (First Quartile): -9.142
- Median: 4.712
- 3Q (Third Quartile): 11.927
- Max: 17.372

### Coefficients:
The coefficients table provides information about the estimated effects of the predictor variable on the response variable.
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
The model fit measures provide information about the overall fit of the model to the data, including the amount of variance explained by the model and the significance of the model as a whole.
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
The model appears to have statistical significance, as indicated by the highly significant p-values for the coefficients and the F-statistic. However, the R-squared value of 0.1774 suggests that the model explains only a modest proportion of the variance in the response variable.

## Exponential Regression Results
### Residuals:
- Min: -14.658
- 1Q (First Quartile): -2.142
- Median: -0.450
- 3Q (Third Quartile): 1.373
- Max: 42.701

### Coefficients:
#### Intercept:
- Estimate: 1953.26222
- Std. Error: 1.06522
- t value: 1833.66
- Pr(>|t|): <0.0000000000000002 (highly significant)
#### log_transistors:
- Estimate: 2.79878
- Std. Error: 0.05599
- t value: 49.99
- Pr(>|t|): <0.0000000000000002 (highly significant)

### Model Fit Measures:
- Residual standard error: 4.419 on 241 degrees of freedom
- Multiple R-squared: 0.912
- Adjusted R-squared: 0.9117
- F-statistic: 2499 on 1 and 241 degrees of freedom
- p-value: < 0.00000000000000022 (highly significant)

### Analysis:
- Residuals: The distribution of residuals indicates the variability in the model's predictions, with a range of values and quartiles that provide insight into the spread of the residuals.
- Coefficients: Both the intercept and the coefficient for log_transistors are highly significant, as indicated by the low p-values, suggesting a strong relationship between the predictor and the response variable.
- Model Fit Measures: The high R-squared value of 0.912 indicates that the model explains approximately 91.2% of the variance in the response variable, suggesting a strong fit to the data.

### Conclusion:
The exponential regression model demonstrates a strong fit to the data, as indicated by the highly significant coefficients and the high R-squared value. The model effectively explains a substantial proportion of the variance in the response variable, suggesting that it captures the exponential relationship between the predictor variable transistor_count and the response variable year.

## Data
https://en.wikipedia.org/wiki/Transistor_count
