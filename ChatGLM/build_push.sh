algorithm_name=chatglm-finetune-ptuning

account=763104351884

# Get the region defined in the current configuration (default to us-west-2 if none defined)
region=$(aws configure get region)

# Log into Docker
pwd=$(aws ecr get-login-password --region ${region})
docker login --username AWS -p ${pwd} ${account}.dkr.ecr.${region}.amazonaws.com

account=$(aws sts get-caller-identity --query Account --output text)

fullname="${account}.dkr.ecr.${region}.amazonaws.com/${algorithm_name}:latest"

docker build -t ${algorithm_name} .
docker tag ${algorithm_name} ${fullname}
# docker push ${fullname}
