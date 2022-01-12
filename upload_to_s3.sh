#!/bin/sh 
pip install --quiet --no-cache-dir awscli
set -e

#!/bin/sh 

set -e

local_path=$1
aws_access_key=$2
aws_access_secret=$3
bucket_name=$4
bucket_key=$5



echo "Echo from upload_to_s3.sh file"
echo $local_path
echo $aws_access_key
echo $aws_access_secret
echo $bucket_name
echo $bucket_key

# if [ -z "$S3_BUCKET" ]; then
#   echo "S3_BUCKET is not set. Quitting."
#   exit 1
# fi
# if [ -z "$AWS_ACCESS_KEY_ID" ]; then
#   echo "AWS_ACCESS_KEY_ID is not set. Quitting."
#   exit 1
# fi
# if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
#   echo "AWS_SECRET_ACCESS_KEY is not set. Quitting."
#   exit 1
# fi

# if [-z "$FILE"]; then
#   echo "FILE is not set. Quitting"
#   exit 1
# fi

# if [ -z "$AWS_REGION"]; then
#   AWS_REGION="us-east-1"
# fi

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = $aws_access_key
aws_secret_access_key = $aws_access_secret" > ~/.aws/credentials

#aws s3 cp $local_path s3://$bucket_name/$bucket_key \
#  --region 'us-east-2' $*

rm -rf ~/.aws
