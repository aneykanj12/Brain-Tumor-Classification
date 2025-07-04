# Brain-Tumor-Classifier

In this analysis project, given a MRI scan of a human brain, I attempted to use the metrics pulled from the scans to construct a machine learning model to predict if a scan shows signs of a tumor.

## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset_and_preprocessing)
- [Features](#features)
- [Modeling](#modeling)
- [Results](#results)
- [Docker](#docker)
- [Limitations](#limitations)
- [License](#license)

## Overview

Magnetic Resonance Imaging, or MRI for short, is a technique used in the medical field to take scans of inside the body. Applicationally this has many uses and works exceptionally well with brain scans. This project involves using MRI scans taken of the human brain to try to predict if the scan shows signs of a brain tumor. Rather than using machine learning to image process and then classify tumors, I used a dataset that has parallel metrics that describe the image of each brain across 15 features. 

## Dataset

This project has two comma seperated values files both located in the data folder. There is an older version of the dataset called *bt_dataset_t3.csv* which I did not use in this project. Instead I shifted my focus to the *Brain_Tumor.csv* which included a total of 15 features. Of these 15 features, we have 2 categorical and 13 quanitative features. There are 2 class types of positive and negative for tumor detection. The datasets are sourced from Kaggle.

## Features

The features are statistical and texture-based metrics extracted from grayscale MRI scans. Here is a list of all features:

- **Image** - this column shows the image number referred to from the images folder
- **Class** - this column lists the classification for positive (1) and negative (0) for if a brain shows a tumor
- **Mean** - this column gives a number representing the average pixel intensity in the brain scan
- **Variance** - this column gives a number representing the spread for the pixel intensity in the brain scan
- **Standard Deviation** - this column gives a number representing the standard deviation for the pixel intensity in the brain scan
- **Entropy** - this column shows a metric representing the amount of randomness or noise in the pixel intensity for the scan
- **Skewness** - represents a score given the asymmetry or skewness in the distriubtion of pixel internsity which should be normally distributed
- **Kurtosis** - represents a peak/spike level for the highest recorded pixel intensity within a specific area of the brain scan
- **Contrast** - metric used to show how evenly the intensity is spread across the scan
- **Energy** - metric that shows how uniform the or orderly the pixel internsity distribution is
- **ASM** - similar metric to energy
- **Homogeneity** - metric for showing how similar each pixel's internsity is to its neighbors
- **Dissimilarity** - metric for showing a difference in intensity between neighboring pixels
- **Correlation** - given the intensity level of one pixel, here is the probability that the neighboring pixel shares the same intensity
- **Coarseness** - rate of texture change in the brain scan

## Modeling

Before I state which models I used, I want to explain the feature choice decision process. After doing some research and examining the distriubtions between *Class* and all the other features excluding the Image, I noticed some correlation and patterns amongst the features. So to start, the features I knew I could confidently test would be the *mean, standard deviation, class, skewness, homogeneity, correlation, and coarseness*. The features I immediately dropped were the *Image* since it has no meaning for classification, *Variance* since I had *standard deviation* and finally *ASM* which is very similar to the *Energy* metric. Now I noticed some special cases. There was a lot of noise for these features:

- **Entropy** - noise comes from Cerebrospinal Fluid (CSF) and cyst. 
- **Kurtosis** - When metric is low, the scan implies healthy signs and vice versa. However with low values, this has noise with CSF and cyst fluid and high values could indicate noise from image artifacts.
- **Contrast** - noise comes from CSF and cyst fluid similar to *Kurtosis*
- **Energy** - noise includes CSF and cyst fluids as well
- **Dissimilarity** - correlated with *Contrast* so noise is rooted as well

Due to the noisy features, I though it would be best to make a power set of the noisy features. Each set would be unionized with the set of included regular features. Through iterative trial and error, each combination would be tested with all models. However I grouped the noisy features into two groups, one with *Entropy, Kurtosis, and Energy* and a second with *Contrast and Dissimilarity* as the noises are what inspired the group. As for the models, I chose to work with k-Nearest Neighbors, Naive Bayes, Support Vector Machines (Classification) and Logistic Regression.

## Results

After testing the combinations with the 4 models, I reevaluated and applied a random over sampler to the data. This is was due to the fact that in the raw data file, the number of positive to negative classification of brain tumors was not even. By applying this, we get a more even approach at testing. Then I began looking at R-squared correlation values with the remaining features. Initiatilly I achieved 99% accuracy with very high precision, recall, and f-scores amongst all models so I decided to apply feature reduction. From this we eventually arrived at 4 features to explain the classification which were *Mean, Homogeneity, Correlation, and Coarseness* where the logistic regression model performed the best with an accuracy of 95%, f-scores of 95 and 95%, and very high precision and recall scores as well. I examined the SHAP distribution and saw no concerning features on the model.

## Docker

A docker file is included for containerization of both notebooks and the datasets. In a termianl run these command line arguements in order:

- **1)** *docker build -t brain-tumor-app .*
- **2)** *docker run -p 8888:8888 brain-tumor-app*
- **3)** paste this url in the search bar of your browser: *http://localhost:8888*

## Limitations

Not many limitations come to my mind when documentating this however here are a couple:

- The performance of the model is based on the metrics that detail the image scans. The model is not based on any computer vision or sketch recognition which implies a lot of missing holes in the classification
- the raw dataset is small both with features and examples
- No deep learning methods were applied in this project which would have maybe improved the generalization

## License

I license this project under the MIT License
