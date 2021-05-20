# Illini Esports Growth and Engagement Analysis
## Authors
* Edward Tang
* Shengan Zhou
* Jingyao Qian
* Kun Yu

# Introduction
## Illini Esports Background
Illini Esports is a Registered Student Organization that has the goal of driving and supporting the cores of Esports at Illinois. The organization supports many casual and competitive communities.

## Dataset Information
The dataset includes historical data dating back to March 2019. All datasets were pulled from the Discord Server Insights section. The datasets selected for analysis include Joins “guild-activation.csv”, Communication “guild-communicators.csv”, Message Activity “guild-message-activity.csv”, Voice Activity “guild-voice-activity.csv”.

## Research Question
With the following datasets, we plan on comparing the changes in membership and engagement across the year. First, we will observe which time periods of maximum growth and engagement using the “guild-activation” and “guild-communicators" files. We expect that after Quad Day, growth and engagement would be the most. After observing the maximum growth and engagement, we were interested in the effect of COVID-19 on membership and engagement. We defined the non-COVID time period as March 29th 2019 (oldest datapoint) until December 31st 2019 (before US lockdowns were set). For the COVID time period, we defined the days following December 31st 2019 to March 27th 2021. As a result of lockdown orders, people were forced to stay at home. Thus, we interested to see if more players would join and engage in games and community events. To measure engagement, we used “guild-message-activity”, “guild-voice-activity", in addition to the previous datafiles to observe for changes in joins and engagement during the pandemic.

# Analysis and Results
## Time Periods of Joins and Communicators
### New members
New member join data was aggregated by the sum of all members for each month. The majority of joins occurred during September and August, which makes sense as new students are exposed to the organization on Quad Day.
![New Member Joins Across the Year](https://github.com/progressEdd/Illini-Esports-Analysis/blob/master/Rplot01.png)

### Communicating Members
Visiting communicator data was aggregated by the sum of total communicated, which is the percent communicated multiplied by the visitors. The majority of communications occurs in August, September, and October, which makes sense as right after Quad Day, most students do not have midterms or exams until mid to late October. Furthermore, Illini Esports also hosts community events such as weekly pickup games, tournament viewing parties, or trivia nights.
![All Communicating Members](https://github.com/progressEdd/Illini-Esports-Analysis/blob/master/Rplot02.png)

## Joins During The Pandemic
As a result of the stay at home orders, leisure time has increased. Furthermore, without in person events or outdoor activities, online gaming in addition to video chat can stabilize social relationships by helping people stay in touch. We hypothesize the total joins will have a significant increase in new users.

The first file “guild-activation.csv” contains dates and total new members. The response variable is new_members. The first categorical variable we created is the months from January to December. Then, another categorical variable we created is year_typeCovid which has two levels: ”Normal” and “COVID”. If the month is during the pandemic, we count it as “COVID”. We run the multiple regression to find the relationship between two categorical variables and the new_members. The regression summary is shown below.

```
Call:
lm(formula = new_members ~ month + year_type, data = joins)

Residuals:
   Min     1Q Median     3Q    Max 
-8.759 -2.195 -0.612  0.808 85.469 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)     1.98132    0.80555   2.460  0.01414 *  
monthFebruary   0.26401    0.96935   0.272  0.78543    
monthMarch     -0.01493    0.95690  -0.016  0.98756    
monthApril      0.60450    0.98228   0.615  0.53848    
monthMay       -0.36969    0.97461  -0.379  0.70456    
monthJune      -0.46217    0.98228  -0.471  0.63814    
monthJuly      -0.30518    0.97461  -0.313  0.75428    
monthAugust     6.54966    0.97461   6.720 3.70e-11 ***
monthSeptember  4.28783    0.98228   4.365 1.46e-05 ***
monthOctober    2.22708    0.97461   2.285  0.02260 *  
monthNovember   2.25450    0.98228   2.295  0.02201 *  
monthDecember  -0.78905    0.97461  -0.810  0.41844    
year_typeCovid  1.22836    0.44590   2.755  0.00602 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.283 on 716 degrees of freedom
Multiple R-squared:  0.1475,	Adjusted R-squared:  0.1332 
F-statistic: 10.32 on 12 and 716 DF,  p-value: < 2.2e-16
```
From the result above, we can see that COVID still has a significant effect on the new members since its p-value (0.00602) is smaller than alpha (0.05). The coefficient of COVID is positive (1.22836) which indicates a positive relationship with new members, and a significant effect on new joins. August and September are also significant factors in predicting new members. August has the largest proportion of total new joins. Overall, there were more new joins in the COVID months.

## Engagement During The Pandemic
### Message Activity
A regression model was generated to determine factors that are significant to message activity. We set an alpha level of 0.05. COVID had a significant effect on the message activity (P-value<2e-16<0.05). Since the coefficient of COVID is negative, COVID had a negative relationship with messages and a significant effect on message engagement. August September, October, November, and April are also significant to the message activity as their P-values are less than 0.05.

```
Call:
lm(formula = messages ~ month + year_type, data = messages)

Residuals:
    Min      1Q  Median      3Q     Max 
-533.72 -131.98  -34.98   68.19 2435.80 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)     370.7838    37.3808   9.919  < 2e-16 ***
monthFebruary     0.7405    44.9820   0.016  0.98687    
monthMarch       19.0476    44.4043   0.429  0.66808    
monthApril      153.6371    45.5819   3.371  0.00079 ***
monthMay         24.6162    45.2261   0.544  0.58641    
monthJune       -73.9795    45.5819  -1.623  0.10503    
monthJuly       -42.4322    45.2261  -0.938  0.34845    
monthAugust     210.2452    45.2261   4.649 3.98e-06 ***
monthSeptember  433.9371    45.5819   9.520  < 2e-16 ***
monthOctober    261.9549    45.2261   5.792 1.04e-08 ***
monthNovember   109.9371    45.5819   2.412  0.01612 *  
monthDecember   -79.8354    45.2261  -1.765  0.07795 .  
year_typeCovid -193.5419    20.6915  -9.354  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 245.1 on 716 degrees of freedom
Multiple R-squared:  0.369,	Adjusted R-squared:  0.3584 
F-statistic: 34.89 on 12 and 716 DF,  p-value: < 2.2e-16
```

### Voice Activity
Another regression model for voice activity was generated to investigate which factors affect voice activity. The variables we selected include month, speaking_minutes in voice channels and year_type. We set an alpha level of 0.05. COVID had a significant effect on voice activity (p-value <1.81e-08 <0.05). The coefficient of COVID is positive, which indicates COVID had a positive effect on voice engagement. September, October, November, April, May, June, and July are significant to the voice activity, as all p-values are less than 0.05.

```
Call:
lm(formula = speaking_minutes ~ month + year_type, data = voices)

Residuals:
    Min      1Q  Median      3Q     Max 
-928.94 -287.96  -21.33  150.04 2268.59 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)      238.42      68.62   3.475 0.000542 ***
monthFebruary     53.85      82.57   0.652 0.514493    
monthMarch       261.27      81.51   3.205 0.001409 ** 
monthApril      -217.09      83.67  -2.595 0.009665 ** 
monthMay        -269.06      83.02  -3.241 0.001246 ** 
monthJune       -225.25      83.67  -2.692 0.007265 ** 
monthJuly       -265.07      83.02  -3.193 0.001470 ** 
monthAugust      142.77      83.02   1.720 0.085914 .  
monthSeptember   474.25      83.67   5.668 2.09e-08 ***
monthOctober     463.99      83.02   5.589 3.25e-08 ***
monthNovember    256.21      83.67   3.062 0.002280 ** 
monthDecember     -9.41      83.02  -0.113 0.909785    
year_typeCovid   216.28      37.98   5.694 1.81e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 450 on 716 degrees of freedom
Multiple R-squared:  0.2877,	Adjusted R-squared:  0.2757 
F-statistic:  24.1 on 12 and 716 DF,  p-value: < 2.2e-16
```
After analyzing the voice and message activity, we determined that COVID affects engagement for both channels. It is surprising that text channel activity decreased significantly. Given the opposite correlation coefficients for voice and message activities, the effect of the pandemic on engagement is inconclusive. For text channels, COVID led to less activity and engagement. For voice channels, COVID led to increased voice activity during the pandemic.

# Conclusion
## Summary
There are significantly more joins and engagement during August, September, and October. In regards to the effect from the pandemic, joins and voice activity had an overall increase, while messages had an overall decrease.
## Discussion
The insights from non-COVID joins and engagement agree tacit knowledge that Quad Day increases members and engagement. The interesting insights occurred in the analysis of engagement. Voice activity saw an increase while messages had an overall decrease. The increases in voice activity are likely due to the following factors: 
  1) members might prefer voice communication over text, speaking is easier compared to typing; 
  2) it is easier to join a voice channel and speak in your own private home compared to in public; 
  3) members may have not fully committed to the organization, as membership is free dues are not collected; 
  4) it is possible that a reoccurring group of individuals contribute significantly to the high total speaking minutes, as Discord Insights do not have metrics to track individual voice activity (possibly to protect user privacy). 

If Illini Esports wishes to improve engagement, the organization should consider hosting community events during either the fall — to capitalize on the new users — or during the winter and spring — during times of low activity.
