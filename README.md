# Brain-Tumor-Classifier

In this analysis project, given a MRI scan of a human brain, I attempted to use the metrics pulled from the scans to construct a machine learning model to predict if a scan shows signs of a tumor.

## Table of Contents
- [Overview](#overview)
- [Dataset & Preprocessing](#dataset_and_preprocessing)
- [Features](#features)
- [Modeling](#modeling)
- [Results](#results)
- [Docker](#docker)
- [Limitations](#limitations)
- [License](#license)

## Overview

Magnetic Resonance Imaging, or MRI for short, is a technique used in the medical field to take scans of inside the body. Applicationally this has many uses and works exceptionally well with brain scans. This project involves using MRI scans taken of the human brain to try to predict if the scan shows signs of a brain tumor. Rather than using machine learning to image process and then classify tumors, I used a dataset that has parallel metrics that describe the image of each brain across 15 features. 

## Dataset & Preprocessing

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
- **Dissimiliarity** - metric for showing a difference in intensity between neighboring pixels
- **Correlation** - given the intensity level of one pixel, here is the probability that the neighboring pixel shares the same intensity
- **Coarseness** - rate of texture change in the brain scan


A medical interpretation of these features was used to inform which ones to retain.

## License

I license this project under the MIT License