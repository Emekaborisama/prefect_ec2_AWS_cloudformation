# Prefect AWS Ec2 Cloudformation 



Before you run the cloud formation command ensure you fill the following data correctly.


- Inside prefect_aws_ec2_cloudformation.yml, replace "xxxx..." with the accurate information or details (Subnet and VPC ID)

- Inside the setup_run_prefect_ec2_agent_bash.sh, replace "xxxx..." with you prefect cloud api key


Note: Ensure your aws credentials are store in the env you are running this script on and also ensure that your enable public ip on the subnet so you can ssh to the subnet and view the logs

## Steps to run
- Clone this repo 

- To run the cloud formation use the command below

```python

aws cloudformation create-stack --stack-name my-stack --template-body file://prefect_aws_ec2_cloudformation.yml


```


To delete cloud formation stack use the command below

```bash

aws cloudformation delete-stack --stack-name my-stack

```

Ps: works with prefect cloud

