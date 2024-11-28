# Codebook

## Variables

- `subject`: The ID of the subject who performed the activity.
- `activity_code`: The code representing the activity performed (1-6). These correspond to the following activities:
  - 1: Walking
  - 2: Walking Upstairs
  - 3: Walking Downstairs
  - 4: Sitting
  - 5: Standing
  - 6: Laying
- `tBodyAcc-mean()-X`, `tBodyAcc-mean()-Y`, `tBodyAcc-mean()-Z`: The mean of the accelerometer readings in the X, Y, and Z directions for body acceleration.
- `tBodyAcc-std()-X`, `tBodyAcc-std()-Y`, `tBodyAcc-std()-Z`: The standard deviation of the accelerometer readings in the X, Y, and Z directions for body acceleration.

## Transformations
- Merged the training and test datasets.
- Extracted only columns related to mean and standard deviation.
- Renamed activities using descriptive names.
- Created a tidy dataset containing the average of each variable for each subject and activity.

