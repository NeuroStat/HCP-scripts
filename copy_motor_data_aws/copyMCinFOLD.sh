#!/bin/bash
subjectlist=IDs_MC500.txt

#maakt een folder in de bovenliggende map
mkdir -p ../hcp

#loopt over de subject IDs
while read -r subject;
do
    mkdir -p ../hcp/$subject

    aws s3 cp \
        s3://hcp-openaccess/HCP/$subject/MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2vol.feat/cope13.feat/stats/cope1.nii.gz \
        ../hcp/$subject/ \
        --region us-east-1

    aws s3 cp \
        s3://hcp-openaccess/HCP/$subject/MNINonLinear/Results/tfMRI_MOTOR/tfMRI_MOTOR_hp200_s4_level2vol.feat/cope13.feat/stats/varcope1.nii.gz \
        ../hcp/$subject/ \
        --region us-east-1
done < $subjectlist

