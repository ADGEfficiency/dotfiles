KEY=~/.ssh/adam.pem
KEYNAME=adam

#  eu-central-1, 18.04
AMI=ami-090f10efc254eaf55
USERDATA=/Users/adam/git/mono/adg-aws/setup.txt
# id = 087085368915

# c5.2xlarge 8 CPU 16 GB
# c5.4xlarge 16 32 GB

# p2.xlarge 4 CPU 61 GB 12 - GPU 12 GB
# p3.2xlarge 8 CPU 61 GB - GPU 16 GB
# a1.4xlarge 16 CPU 32 GB

# r5.2xlarge 8 CPU 64 GB
# r5.12xlarge 48 384 GB

# m4.16xlarge 64 256
# m5.16xlarge 64 256

run-instance() {
  INSTANCE=${1:-t2.micro}
  SIZE=${2:-8}
  IAM="access-s3"
  INSTANCEID=$(aws ec2 run-instances --image-id $AMI --count 1 --instance-type $INSTANCE --key-name $KEYNAME --user-data file://$USERDATA --output text --iam-instance-profile Name=$IAM | awk '/INSTANCE/{print $7}')
  echo $INSTANCEID > /dev/stderr
  sleep 10
  VOLID=$(aws ec2 describe-volumes --filters Name=attachment.instance-id,Values=$INSTANCEID --output text | awk '/VOLUMES/{print $9}') > /dev/stderr
  aws ec2 modify-volume --volume-id $VOLID --size $SIZE > /dev/stderr
  echo $INSTANCEID
}

running-instances () {
  aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, State.Name, InstanceId, PublicDnsName, InstanceType]' --output text | grep running | awk '{print $0}'
}

sshi () {
  INSTANCEID=$1

  ssh-add -K ~/.ssh/id_rsa
  DNS=$(aws ec2 describe-instances --instance-ids $INSTANCEID --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, State.Name, InstanceId, PublicDnsName, InstanceType]' --output text | grep running | awk '{print $4}')
  echo $DNS
  ssh -i $KEY -tt ubuntu@$DNS
}

kill-instances() {
  aws ec2 terminate-instances --instance-ids $(aws ec2 describe-instances --filters  "Name=instance-state-name,Values=pending,running,stopped,stopping" --query "Reservations[].Instances[].[InstanceId]" --output text | tr '\n' ' ')
}
