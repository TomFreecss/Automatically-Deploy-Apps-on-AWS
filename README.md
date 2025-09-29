The file in this repo allow the user to deploy his own html web-app and update it automatically (I use open with GitPod) and then performing
- aws configure, this will set your own access credentials and region for your AWS account, I strongly reccomend to  use an IAM User with Admin access rather than your root account
- go in terra_folder directory (cd terra_folder)
- terraform init, terraform apply
- go in bootstrap directory (cd bootstrap)
- terraform init, terraform apply
- the whole infrastructure will be set, now you only need to actually build and push the image on ECR as we are using a FARGATE type of launch with ECS to do so you can either:
  a. run a manual workflow from GitHub actions
  b. edit the your index.html file and then push the change in the repository, you can do it both from the UI of VS Code or by using the command line with the usual
    git add .
    git push origin main
  when git finds an edit in your html file it will automaticallyh run the workflow and rebuild the image in the ECR, ECR is set to use the latest image built (each image has its own tag)
  - you can check the state of your web app just by copy pasting the DNS of the ALB that has been built by performing the first terraform apply, you can find the ALB DNS on your AWS console in EC2 section under Load Balancers
  - after you have finished you can wipe all the items by performing terraform destroy both on terra_folder anb bootstrap
  - There could be an error in which you won't be allowed to destroy ECR because there in an image in it, if it happens just go into the AWS console and remove manually all images in the ECR of this project, after this step you can re run terraform destroy
 
    
  
Pre requisites
- You must set your secrets in the repo, specifically AWS_ACCESS_KEY_ID of your IAM Account, SECRET_ACCESS_KEY, AWS_DEFAULT_REGION. Be sure that your default region in terraform files will match this one. 
running this repo will automatically download the 2 technical pre requisites for this to work
- AWS CLI v2 & Terraform
