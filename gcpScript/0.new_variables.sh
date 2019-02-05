#!/bin/bash

#RUN_SESSION=20181122114000

GCP_PROJECT_NAME=scala-project
GCP_PROJECT_ID=scalaproject-230113

GCS_BUCKET_NAME=${GCP_PROJECT_NAME}-file-bucket
GCS_BUCKET_ZONE=europe-west1
GCS_BUCKET_CLASS=regional

GCS_BUCKET_DATA_FOLDER=${GCS_BUCKET_NAME}/files/data
GCS_BUCKET_SRC_FOLDER=${GCS_BUCKET_NAME}/files/src
GCS_BUCKET_OUTPUT_FOLDER=${GCS_BUCKET_NAME}/files/output

#GCS_SRC_BUCKET_NAME=${GCP_PROJECT_NAME}-src-bucket
#GCS_SRC_BUCKET_ZONE=europe-west1
#GCS_SRC_BUCKET_CLASS=regional

#HelpfulnessRank-assembly-0.1.jar
SCALA_JAR_FILENAME=HelpfulnessRank-assembly-0.1.jar
SCALA_JAR_FILE=files/src/${SCALA_JAR_FILENAME}
#SCALA_JAR_FILE_LOCALPATH=file://$(pwd)
SCALA_RUNNABLE_CLASS=Main

SCALA_JAR_FILE_FOR_JOB_SUBMIT=gs://${GCS_BUCKET_SRC_FOLDER}/${SCALA_JAR_FILENAME}

DATA_FILENAME=3prod10users24review.csv
DATA_FILE=files/data/${DATA_FILENAME}

DATA_FILE_INPUT_PATH=gs://${GCS_BUCKET_DATA_FOLDER}/${DATA_FILENAME}

OUTPUT_FOLDER_NAME=output
OUTPUT_FOLDER=files/${OUTPUT_FOLDER_NAME}/

OUTPUT_FOLDER_PATH=gs://${GCS_BUCKET_OUTPUT_FOLDER}

FILE_FOLDER_NAME=files
FILE_FOLDER_PATH=${FILE_FOLDER_NAME}

#General or Product
#TYPE_COMP=General
TYPE_COMP=Product
DEMO=TRUE
FILE_INPUT=${DATA_FILE_INPUT_PATH}
DIR_OUTPUT=${OUTPUT_FOLDER_PATH}/
#DIR_OUTPUT=/files/output/
#DIR_OUTPUT=/home/matteo/IdeaProjects/ScalaProject/dataOutput/
LAMBDA=20
ITER=10
PART=4
TIMEOUT=3000



DATAPROC_CLUSTER_NAME=scala-project-cluster
DATAPROC_CLUSTER_REGION=europe-west1
DATAPROC_CLUSTER_ZONE=europe-west1-d

DATAPROC_MASTER_NUM=1
DATAPROC_MASTER_DISK_TIPE=pd-standard
DATAPROC_MASTER_DISK_SIZE=16GB
DATAPROC_MASTER_MACHINE_TYPE=n1-standard-2

DATAPROC_WORKER_NUM=3
DATAPROC_WORKER_DISK_TIPE=pd-standard
DATAPROC_WORKER_DISK_SIZE=16GB
DATAPROC_WORKER_MACHINE_TYPE=n1-standard-2

