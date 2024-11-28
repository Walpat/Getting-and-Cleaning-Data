# Getting-and-Cleaning-Data

This repository contains the code to clean and prepare the dataset for further analysis.

## How to Run the Script

1. Clone or download this repository.
2. Place the `UCI HAR Dataset.zip` file in the same directory as this script.
3. Run the `run_analysis.R` script. This script will:
   - Download the dataset if not already present.
   - Merge the training and test sets.
   - Extract columns with mean and standard deviation values.
   - Rename the activities and create a tidy data set.
   - Output a file `tidy_data.txt` containing the cleaned data.

## Requirements
- R (version 4.0 or higher)
- dplyr package

## Output
The output of this script is the tidy data set `tidy_data.txt` which contains the average of each measurement for each activity and each subject.
