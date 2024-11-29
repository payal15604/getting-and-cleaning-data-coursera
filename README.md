# Getting and Cleaning Data Project

## Author
Payal  

## Blog Post
Getting and Cleaning Data Review  

## Data Source
The data used in this project is obtained from the UC Irvine Machine Learning Repository.  

## Goal of the Project
1. To create a tidy data set by cleaning and processing raw data.  
2. To host the project in a GitHub repository containing:
   - **An R script (`run_analysis.R`)** for performing the data cleaning and analysis.
   - **A CodeBook.md** that describes:
     - The dataset and its variables.  
     - The transformations and steps performed to clean the data.  
   - **This README.md**, which explains the project and guides the user on how to execute the scripts.

## Steps to Run the Project
1. Download the dataset from the UC Irvine Repository.  
2. Save and extract the dataset into your working directory.  
3. Run the script `run_analysis.R` to:
   - Merge training and test sets to create one dataset.  
   - Extract measurements of mean and standard deviation.  
   - Use descriptive activity names for clarity.  
   - Label the dataset with descriptive variable names.  
   - Create a second, independent tidy dataset with the average of each variable for each activity and subject.  
4. Output:  
   - The script generates a tidy dataset saved as `tidy_dataset.txt`.

## Repository Structure
- **`run_analysis.R`**: The R script to clean and tidy the data.  
- **`CodeBook.md`**: Details the dataset, variables, and transformations applied.  
- **`README.md`**: This file, explaining the project and its components.

## Dependencies
The script requires the following R packages:
- `dplyr`

Install them using the command:  
```R
install.packages("dplyr")
