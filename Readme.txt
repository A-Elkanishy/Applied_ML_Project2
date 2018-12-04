There are two MATLAB scripts to pre-process the data and extract the features. the two scripts are named as 
"Features_Extraction_LDO.m" for the power amplifier signals and "Features_Extraction_RF.m" for the Radio Frequency (RF)
signals. "Plot_Raw_Data.m" script is used to visualize the raw data in plots. The two feature ectraction script were
ran on the raw data which there is an example of it in the datasets folder. the example of raw data file is named 
"Raw_Sensor_Data_Advertising.csv". the features extraction scripts commented in way that can change the generation of
the data set classes such as "profile" and "mode" depending on the raw data file. 
	In the datasets folder, there are two ".mat" files which contain the data sets were used to train and test the
models. "HS_HF_S_LDO.mat" is for the power amplifier signals while "HS_HF_S_RF.mat" is for RF signals.
	The models were trained and tested by the MATLAB classification app.