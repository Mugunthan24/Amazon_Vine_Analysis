# Amazon_Vine_Analysis
Using PySpark and AWS to analyze big data.

## Overview of Analysis
A dataset for videogame reviews written by members of the paid Amazon Vine program is being analyzed. PySpark was used to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin. Subsequently, SQL was then used to determine if there is any bias toward favorable reviews from Vine members in the dataset.

## Results
The subsequent sections will provide information for each group (vine members vs. non-vine members).

### Number of Paid Reviews
![image_name](https://github.com/Mugunthan24/Amazon_Vine_Analysis/blob/main/Images/Number_of_Paid_Reviews.png)

The total number of paid reviews is 90.

### Number of Unpaid Reviews
![image_name](https://github.com/Mugunthan24/Amazon_Vine_Analysis/blob/main/Images/Number_of_Unpaid_Reviews.png)

The total number of unpaid reviews is 37,831.

### Number of Paid 5-Star Reviews
![image_name](https://github.com/Mugunthan24/Amazon_Vine_Analysis/blob/main/Images/Number_of_Paid_5-Star_Reviews.png)

The total number of unpaid reviews is 44.

### Number of Unpaid 5-Star Reviews
![image_name](https://github.com/Mugunthan24/Amazon_Vine_Analysis/blob/main/Images/Number_of_Unpaid_5-Star_Reviews.png)

The total number of unpaid reviews is 14,704.

### Percentage of 5-Star Reviews (Paid)
![image_name](https://github.com/Mugunthan24/Amazon_Vine_Analysis/blob/main/Images/Percentage_of_Paid_5-Star_Reviews.png)

The percentage of paid 5-star reviews is 49%.

### Percentage of 5-Star Reviews (Unpaid)
![image_name](https://github.com/Mugunthan24/Amazon_Vine_Analysis/blob/main/Images/Percentage_of_Unpaid_5-Star_Reviews.png)

The percentage of unpaid 5-star reviews is 39%.

## Summary
The subsequent paragraphs will look at the potential presence of positivity bias and provide a recommendation for additional analysis.

### Potential of Positivity Bias
Looking at the percentage of paid 5-star reviews implies that nearly half of people who purchase the videogame will give it 5-stars, while the percentage of unpaid 5-star reviews implies that only 38.9% of those who purchase the video game will give it 5-stars. Positivity bias exists in the reviews for the Vine Program because the number of total reviews from the vine program (90), is substantially lower than the total reviews provided by those not in the vine program (37,831). Since the sample size for the non-vine reviews is higher, it is also more likely to be accurate.

### Recommendation
Instead of seperating the reviews by whether a review came from a vine-member or not, the reviews can be examined together. For example, getting the percentage of 5-star using the entire dataset and not seperating the reviews into groups. 

