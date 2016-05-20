#!/bin/bash

## 1. CLONING AND CONFIGURING S3CMD

git clone https://github.com/pcorliss/s3cmd-modification
cd s3cmd-modification
chmod 744 s3cmd
./s3cmd --configure
  # will prompt for access key and secret access key
  # go to: https://db.humanconnectome.org/app/template/Index.vm?login=true
  # push button "Amazon S3 Access Enables"
  # push button "Recreate my AWS credentials"
  # Enter credentials in app
  # For remaining questions: we don't care about security so just leave empty

# add path of program to $PATH to make it accessible from wherever --> for future use best to add the path also to ~/.bashrc
PATH=$PATH=$PATH:`pwd`
