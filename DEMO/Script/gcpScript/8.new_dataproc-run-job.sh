#!/bin/bash

GCP_PROJECT_NAME=scala-project
GCP_PROJECT_ID=scalaproject-230113
GCS_BUCKET_NAME=${GCP_PROJECT_NAME}-file-bucket

DATAPROC_WORKER_NUM=$1
DATAPROC_CORE_NUM=$2
DATAPROC_CLUSTER_NAME=scala-project-cluster-1master-${DATAPROC_WORKER_NUM}worker-${DATAPROC_CORE_NUM}core


GCS_BUCKET_SRC_FOLDER=${GCS_BUCKET_NAME}/files/src
SCALA_JAR_FILENAME=HelpfulnessRank-assembly-0.1.jar
SCALA_JAR_FILE=files/src/${SCALA_JAR_FILENAME}
SCALA_JAR_FILE_FOR_JOB_SUBMIT=gs://${GCS_BUCKET_SRC_FOLDER}/${SCALA_JAR_FILENAME}

TYPE_COMP=$3
PART=$1
CSV_NAME=demo
DATA_FILENAME=${CSV_NAME}.csv
DATA_FILE=files/data/${DATA_FILENAME}
GCS_BUCKET_DATA_FOLDER=${GCS_BUCKET_NAME}/files/data
DATA_FILE_INPUT_PATH=gs://${GCS_BUCKET_DATA_FOLDER}/${DATA_FILENAME}
FILE_INPUT=${DATA_FILE_INPUT_PATH}
GCS_BUCKET_OUTPUT_FOLDER=${GCS_BUCKET_NAME}/files/output
OUTPUT_FOLDER_PATH=gs://${GCS_BUCKET_OUTPUT_FOLDER}
DIR_OUTPUT=${OUTPUT_FOLDER_PATH}/

gcloud dataproc jobs submit spark --cluster ${DATAPROC_CLUSTER_NAME} --region europe-west1 \
      --class Main \
      --jars ${SCALA_JAR_FILE_FOR_JOB_SUBMIT} \
      --project ${GCP_PROJECT_ID} \
      -- ${TYPE_COMP} True ${FILE_INPUT} ${DIR_OUTPUT} 20 10 ${PART} 3000 && echo "#: JOB TERMINATED"