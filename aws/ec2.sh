#  eu-central-1, 18.04
KEY=~/.ssh/adam.pem
KEYNAME=adam
AMI=ami-090f10efc254eaf55

#  ap-southeast-2, 18.04
KEY=~/.ssh/adam-sydney.pem
KEYNAME=adam-sydney
AMI=ami-0987943c813a8426b

USERDATA=$HOME/dotfiles/aws/setup.txt

# c5.2xlarge 8 CPU 16 GB
# c5.4xlarge 16 32 GB

# p2.xlarge 4 CPU 61 GB 12 - GPU 12 GB
# p3.2xlarge 8 CPU 61 GB - GPU 16 GB
# a1.4xlarge 16 CPU 32 GB

# r5.2xlarge 8 CPU 64 GB
# r5.12xlarge 48 384 GB

# m4.16xlarge 64 256
# m5.16xlarge 64 256

export ADGAWSPROFILE="adg"

run-instance() {
  INSTANCE=${1:-t2.micro}
  SIZE=${2:-32}
  IAM="access-s3"

  INSTANCEID=$(aws ec2 run-instances --profile $ADGAWSPROFILE --image-id $AMI --count 1 --instance-type $INSTANCE --key-name $KEYNAME --user-data file://$USERDATA --output json --iam-instance-profile Name=$IAM | jq -r '.Instances[0].InstanceId')
  echo "\nINSTANCEID $INSTANCEID"
  sleep 20
  VOLID=$(aws ec2 describe-volumes --profile $ADGAWSPROFILE --filters Name=attachment.instance-id,Values=$INSTANCEID --output json | jq -r '.Volumes[0].VolumeId')
  echo "\nVOLID $VOLID"
  aws ec2 modify-volume --profile $ADGAWSPROFILE --volume-id $VOLID --size $SIZE > /dev/stderr
}

running-instances () {
  aws ec2 describe-instances --profile $ADGAWSPROFILE --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, State.Name, InstanceId, PublicDnsName, InstanceType]' --output text | grep running | awk '{print $0}'
}

sshi () {
  INSTANCEID=$1

  ssh-add -K ~/.ssh/id_rsa
  DNS=$(aws ec2 describe-instances --profile $ADGAWSPROFILE --instance-ids $INSTANCEID --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, State.Name, InstanceId, PublicDnsName, InstanceType]' --output text | grep running | awk '{print $4}')
  echo $DNS
  ssh -i $KEY -tt ubuntu@$DNS
}

kill-instances() {
  aws ec2 terminate-instances --profile $ADGAWSPROFILE --instance-ids $(aws ec2 describe-instances --profile $ADGAWSPROFILE --filters  "Name=instance-state-name,Values=pending,running,stopped,stopping" --query "Reservations[].Instances[].[InstanceId]" --output text | tr '\n' ' ')
}
