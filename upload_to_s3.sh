#!/bin/sh 
pip install --quiet --no-cache-dir awscli
set -e

#!/bin/sh 

set -e

file_name=$1
local_path=$2
aws_access_key=$3
aws_access_secret=$4
bucket_name=$5
bucket_key=$6



echo "Echo from upload_to_s3.sh file"
echo $file_name
echo $local_path
echo $aws_access_key
echo $aws_access_secret
echo $bucket_name
echo $bucket_key

echo aws --version

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

aws s3 cp --region ap-south-1 --acl bucket-owner-full-control $local_path s3://$bucket_name/fol8/test/$file_name


rm -rf ~/.aws
