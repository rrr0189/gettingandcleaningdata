###############################################################################

Thank you for taking the time to look through this project!

NOTE: If you are unable to execute run_analysis.R then a .csv file containing
      the Data Set described in #5 is in this repo. Load it into R to view.

NOTE: The code book is provided in .html format (which looks much nicer than 
      the .md file!).

###############################################################################

LOADING THE SCRIPT: 

Place run_analysis.R in the same directory as your downloaded copy of the
folder "UCI HAR Dataset" as it was provided for the assignment. 

(I have the script assume that the UCI HAR Dataset is in the same directory
as the analysis file.)

###############################################################################

This README will refer to 2 READMEs - the "tidy README" (which is the one
you are currently reading) and the "UCI README."

###############################################################################

RE: WHY VARIABLES ARE NOT ALL LOWER CASE
    
    - You may notice that not all variables are lowercase. Remember that 
      this is a "WHEN POSSIBLE" novelty; it would have been difficult on the
      eyes if we had to read 'freqBodyAccelJerkMeanX' as
      'freqbodyacceljerkmeanx.'

###############################################################################

RE: WHY ALL ROWS ARE UNIQUE

    - Explained below, all rows are unique since each subject/activity 
    combination takes place over a unique time interval. Per
      the UCI README, the measurements were "sampled in fixed-width sliding 
      windows of 2.56 sec and 50% overlap (128 readings/window)."

###############################################################################

RE: FULFILLMENT OF THE 4 TIDY DATA COMPONENTS

    RE: (1) Each variable has its own column.
        
        - A preliminary set of variables measures a unique combination of: 
            (1) time/angle prefix,
            (2) accelerometer/gyroscope measurement tools to capture 
                acceleration or velocity (respectively), 
            (3) gravity/body components of acceleration, and 
            (4) x/y/z direction.
          On a subset of these variables, additional kinds of variables were
          obtained (and are thus unique as well):
            (5) jerk calculation,
            (6) magnitude (Euclidean norm) calculation,
            (7) fast fourier transform calculation.
          Finally, each measurement expresses only one of the following:
            (8) mean/standard deviation calculation.
            
          Therefore, all variables pertain to their own distinct column. 
          
        - Note on the Inclusion of the Magnitude Variables
        
            - The inclusion of the magnitude variables will still have 
              this tidy data component fulfilled. Some may say that the 
              Euclidean norm of (x,y,z) is redundant and can be calculated
              from the already-existing x/y/z measurements in the data 
              set (and is thus not an independent measurement). However, 
              the tidy data set contains the MEANS of the individual components, 
              thus the data will differ from the included mean magnitude 
              variables if we were to take the "Euclidean norm of the AVERAGE
              (x,y,z)" (i.e. the tidy data has the "AVERAGE Euclidean norm of 
              the (x,y,z)"). This is an important note to make, despite the
              normalization of the features (to be bounded within [-1, 1] to
              ease gradient descent).
    
    RE: (2) Each different observation of each variable has its own row.
    
        - Each observation is uniquely characterized by a [subject/activity/
          time interval] combination. That is, within the groups that have the 
          same [subject/activity] combination, each observation has a unique 
          instance of time over which the variables were measured.
          This was explained in the UCI README.
          
        - Nevertheless, I have chosen to omit a "time" column since all data 
          is expressed in one data table; there is no need to uniquely 
          distinguish each row by its time interval since no tables need to be
          linked by primary keys, so we simply take the positional index of each 
          row in the lone data table as an indicator of uniqueness.
    
    RE: (3) There is one table for each "kind" of variable.
    
        - I have chosen a long format for this tidy data, hence all
          measurements pertain to all subjects/activity/time interval 
          combinations.
    
    RE: (4) If there are multiple tables, then each table should include a 
            primary key column.
        
        - There is only one table here. See justifications in (2) and (3) if
          needed.

###############################################################################

RE: RENAMING THE VARIABLES  

    RE: Standardizing the Names
    
        - After extracting those variables only pertaining to mean and standard 
          deviation calculations, variable names were standardized to be 
          alphanumeric.
          
        - At the beginning of this README, I stated why I chose NOT to make all
        the variable names lower case.

    RE: From 't' to 'time' 
    
        - As stated in the UCI README, the 't' prefix indicates time. 
          This name change is intuitive.
          
        - When 't' was not the first letter in the variable name, it was
          changed to 'Time'.
    
    RE: From 'f' to 'freq'
        - As stated in the UCI README, the 'f' prefix refers to frequency.
        
    RE: from 'std' to 'Std'
    
        - This component of the variables' names was mostly left unchanged
        since 'Std' is a common abbreviation for standard deviation. 
        Leave it to the codebook to further clarify this.
          
      
    RE: from 'Acc' to 'Accel'
      
        - 'Acceleration' is a long word and 'Acc' is not entirely interpretable,
          so I chose the happy medium of 'Accel' as a further clarification
          that the variable measures the gravity/body component of acceleration. 
    
    RE: from 'mean' to 'Mean'
        
        - This capitalization was made for the sake of readability of the
          variable names.
    
    RE: from "BodyBody" to "Body"
        
        - "BodyBody" is interpreted as a typo per the UCI README and thus
          changed to "Body."
    

###############################################################################

RE: ALTERING CATEGORICAL (FACTOR) VARIABLES' VALUES

    RE: 'subject'
      
        - Besides changing 'subject' into a factor variable, no other changes
          were made.
    
    RE: 'activity'
    
        - Each integer value was replaced with its corresponding activity
          (per the UCI README and activity target labels) to become 
          character vectors.

###############################################################################

RE: OMISSION OF THE meanFreq AND gravityMean VARIABLES

    - These variables were omitted since meanFreq() is a weighted average
      rather than an empirical mean of the underlying data.
      
    - Per the UCI README, gravityMean is not clearly interpreted to be a mean()
      calculation; these variables are omitted from the tidy set.
      
###############################################################################

The following links were used as guidance:

https://www.transtats.bts.gov/Fields.asp?Table_ID=236&SYS_Table_Name=T_ONTIME&User_Table_Name=On-Time%20Performance&Year_Info=1&First_Year=1987&Last_Year=2017&Rate_Info=0&Frequency=Monthly&Data_Frequency=Annual,Quarterly,Monthly

https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/



  