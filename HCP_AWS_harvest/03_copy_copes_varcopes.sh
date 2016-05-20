#!/bin/bash

# Specify where to save the data
OutDir=$HOME/HPC_copes
mkdir $OutDir

# On how many cores?
Cores=7

# Make variable $Subj with all subject id's
IFS=$'\n' read -d '' -r -a Subj < Ids.txt

# Make an iterable array of paradigms and contrasts per paradigm

ParsList=('SOCIAL' 'EMOTION' 'RELATIONAL' 'LANGUAGE' 'GAMBLING' 'WM' 'MOTOR');
ConsList=(6 6 6 6 6 30 26)


for sub in "${Subj[@]}" ; do

  SubDir=$OutDir/$sub/
  mkdir $SubDir

  for par in {0..6}; do

    for con in $(seq 1 ${ConsList[par]}); do
      RemoteFileCope=s3://hcp-openaccess/HCP_900/$Subj\/MNINonLinear/Results/tfMRI_${ParsList[par]}\/tfMRI_${ParsList[par]}\_hp200_s4_level2vol.feat/cope$con\.feat/stats/cope1.nii.gz
      LocalFileCope=$SubDir\/$Subj\_${ParsList[par]}\_$con\_cope.nii.gz
      s3cmd get $RemoteFileCope $LocalFileCope
      RemoteFileVarCope=s3://hcp-openaccess/HCP_900/$Subj\/MNINonLinear/Results/tfMRI_${ParsList[par]}\/tfMRI_${ParsList[par]}\_hp200_s4_level2vol.feat/cope$con\.feat/stats/varcope1.nii.gz
      LocalFileVarCope=$SubDir\/$Subj\_${ParsList[par]}\_$con\_varcope.nii.gz
      s3cmd get $RemoteFileVarCope $LocalFileVarCope

    done

  done

done | parallel -j $Cores
