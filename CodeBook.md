# CodeBook

## Dataset
The original dataset comes from the UC Irvine Machine Learning Repository and contains data from the Human Activity Recognition Using Smartphones project.

## Variables
- **Subject**: An identifier for the subject who performed the activity.  
- **Activity**: The type of activity performed (e.g., walking, standing).  
- **Feature Variables**: Measurements of various features (mean, standard deviation, etc.).  

## Data Cleaning Steps
1. **Merging Data**:
   - Combine training and test datasets into one complete dataset.  

2. **Extracting Mean and Standard Deviation**:
   - Extract only measurements of mean and standard deviation.

3. **Descriptive Activity Names**:
   - Replace activity codes with descriptive activity names.  

4. **Labeling Variables**:
   - Appropriately label the dataset with descriptive variable names.  

5. **Tidy Dataset**:
   - Create a tidy dataset with the average of each variable for each activity and subject.

## Output
- **`tidy_dataset.txt`**: A tidy dataset with summarized data.
