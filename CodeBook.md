# Data Dictionary

### subject
###### An identifier of the subject who carried out the experiment.
    1..30 .Integer representing subject

### activity
###### The activity performed.         
  1. LAYING 
  2. SITTING 
  3. STANDING 
  4. WALKING 
  5. WALKING_DOWNSTAIRS 
  6. WALKING_UPSTAIRS

### tBodyAcc.mean.X ... fBodyBodyGyroJerkMag.std
###### Measurement average per feature.
    prefix 't' to denote time domain signals
    prefix 'f' to donate frequency domain signals
    
    Jerk Jerk signal
    Mag Magnitude signal

    .mean mean value
    .std standard deviation value

    .X X-axial signal
    .Y Y-axial signal
    .Z Z-axial signal