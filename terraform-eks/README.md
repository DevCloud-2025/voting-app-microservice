# terraform-eks
A sample repository to create EKS on AWS using Terraform.

### Install AWS CLI 

As the first step, you need to install AWS CLI as we will use the AWS CLI (`aws configure`) command to connect Terraform with AWS in the next steps.

Follow the below link to Install AWS CLI.
```
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```

### Install Terraform

Next, Install Terraform using the below link.
```
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```

### Connect Terraform with AWS

Its very easy to connect  terraform with AWS. Run `aws configure` command and provide the AWS Security credentials as shown in the video.

### Configuration

1. **change dir**:
    ```bash

    cd infrastructures
    ```



2. **Initialize Terraform**:
    ```bash
    terraform init
    ```

3. **Plan**:
    ```bash
    terraform plan
    ```

4. **Apply the configuration**:
    ```bash
    terraform apply -auto-approve
    ```

 **Confirm the changes** when prompted.

6. **Clean up**
     ```bash
    terraform destroy -auto-approve
    ```
