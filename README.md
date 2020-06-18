---
title: "README"
author: "Henrique Magri Marcon"
date: "17/06/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

#Getting and Cleaning Data Course - Final problem

##Variable names
. Various /activities/ are analyzed, they are stored as "activities".
. train_label: coded description of activity
. train_data: measured properties
. train_subject: factor to classify subjects
. train: binding of data + label + subject
. The same applies for test dataset
. full_dataset: binding of train and test datasets
. Means: mean of each variable
. Deviations: standard deviations of each variable
. full_data_mean: mean splited by subject and activity
