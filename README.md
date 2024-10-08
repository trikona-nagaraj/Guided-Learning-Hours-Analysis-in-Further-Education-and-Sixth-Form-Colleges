---

# Guided Learning Hours Analysis in Further Education and Sixth Form Colleges

## Summary
The project revolves around a detailed statistical analysis using SAS Programming (Statistical Analysis Software) conducted on guided learning hours per learner across two distinct types of UK educational institutions - Further Education (FE) colleges and Sixth Form colleges. The analysis encompasses several crucial stages, beginning with data import, merging, data cleaning, anomaly detection, exploratory data analysis (EDA), and culminating in relevant statistical modeling to derive meaningful insights.
## Major Insights 📊
The analysis primarily focuses on examining guided learning hours per learner concerning various factors, such as region, institution type, size, and three-year data for each institute. It identifies an inverse relationship between the institute type and size with the total guided learning hours needed. However, an interesting contradiction is observed in small-size institutes, where sixth form colleges, despite being more numerous, require higher GLH (guided learning hours) for a single learner than FE colleges' learners.

## Methods Implemented 🛠️
### 1. Data Import 📥
   - Commands utilized: DATA, INFILE, DSD, DLM, FIRSTOBS, MISSOVER, INFORMAT, INPUT, LABEL, SET, IF statement, PROC PRINT, etc.
### 2. Data Cleaning 🧹
   - Handle missing values
   - Calculate average GLH for three years
   - Introduce variables: Average Glh hours, Glh per learner, Total Glh per learner, Size (of the institute)
### 3. Anomalies Detection and Handling 🕵️‍♂️
   - Identify extreme values in the data
   - Normalize data using log transformation
### 4. Exploratory Data Analysis (EDA) 📊
   - Summarize dependent and independent variables
   - Analyze GLH per learner by institute type and size, effect of region and year on GLH per learner

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/783ca30d-148f-4a48-8b65-db3bb80f10c9)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/ff1af3c0-87a1-4e4f-afb3-31cf0255c3f5)


### 5. Statistical Modelling 📈
   - T-test, ANOVA analysis on different factors affecting GLH per learner

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/571f2864-3c3a-4994-a6dc-96742322f49a)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/e1456f20-a2f7-4069-a94a-3730c7750c1a)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/4a119e35-0e37-4b5f-bbde-b084a5c89a7c)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/128ce757-6a19-4c7c-9235-aebb2b72be30)


## Results  📝
The detailed analysis presents significant findings:

- Effect of Institute Type and Size on GLH per learner
  
![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/5a013e4b-730f-4e93-b375-2a481f069764)

•	Summarizing the above information, we can state that there is an inverse relationship between the institute type and size with the total GL hours needed. However, we find a contrary in small-size institutes, though sixth form colleges are more in number high GL hours needed for a single learner than FE colleges learner.

  
- Effect of Region and Year on GLH per learner

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/06fd5add-5b0e-42aa-b4a1-3c8b02d055ed)

•	Summarizing the above information, we can say that a few regions needed more learning hours in year 3 but some decreased in the 3rd year. Every region had low learning hours needed in year 1.


- Effect of Institute Type on GLH per learner

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/52605ce9-f45d-4d91-bd1b-50d65907bb0d)

The scatter plot shows that there is a variation in the two groups and sixth form college has low variance. The box plot depicts the data to median and mean overlap in FE colleges and half of the data in sixth form li below the median. 
• Summarizing the above results state that there is a difference between the two variables and FE colleges mean is greater than Further education college by 1.06 as this may be due to lack of data of the sixth form colleges.


- Effect of ‘REGION’ on GLH per learner



![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/88078e61-20c1-40ef-bf3d-4984699865bf)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/5121130a-107a-473b-8ea1-ca92847d967c)

There are 9 regions where the colleges are spread among which ‘South East’ and ‘North West’ regions have a higher number of observations and the scatter plot shows that ‘East Midlands’ and ‘South West’ regions there are a minimum number of observations. And the box plot shows that the mean for each region is above the median and they do not overlap except for ‘South West’ region. 


##  Conclusions 📝

We can conclude that there is an inverse relationship between the institute type and size with the total GL hours needed. However, we find a contrary in small-size institutes, though sixth form colleges are more in number high GL hours needed for a single learner than FE colleges learner. When region and year are taken into consideration few regions needed more learning hours in year 3 but some decreased in the 3rd year also every region had low learning hours needed in year 1. The statistical models show a significant relationship between all the factors in each group and there are few combinations high correlation is found but there is no normality in the data. 

---

