# kops-terraform-demo
A kubernetes cluster using kops and terraform

Reference: https://kops.sigs.k8s.io/terraform/

IAM Configuration: https://kops.sigs.k8s.io/getting_started/aws/

In order to ssh into the control plane, ssh into the bastion loadbalancer and go from there
```bash
ssh -i ~/.ssh/key -A -J USERNAME@BastionLoadbalancerDNSName USERNAME@ControlplanePrivateIP

```

 - After accessing the control plane through the bastion, 
    - you can download a new config file or generate a new one. 
    - revert the control plane address back to local host (make sure to set up port forwarding during the inital ssh command so)


configure backend in tf file generated by kops to ensure state functions properly:
```
terraform {
  backend "s3" {
    bucket         = "tf-state-kops-stage"
    region         = "us-east-1"
    dynamodb_table = "tf-kops-locks"
    encrypt        = true
    key            = "cloud-fam/terraform.tfstate"

  }
```

- I added a helm install script for a simple cms deployment but I still need to configure networking and dns to properly expose the service
