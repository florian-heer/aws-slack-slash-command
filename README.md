# aws-slack-slash-command
This skeleton creates a usable url to insert into slack slash configuration
## Project Settings
Make sure you have installed make.
```
make --version
```
If you are on Windows check this out https://chocolatey.org/packages/make
## Configuration
Copy config_example.mk and rename it to config.mk and fill out every field
## Deploy your Stack to the AWS Cloud
```
make bucket
make build
make deploy
```
## Delete the created Stack in the Cloud
```
make delete
```
Hint: "make delete" will not delete the S3 Bucket you created with "make bucket"
## Slack integration
Copy the URL from Output of the created Cloudformation Stack into the slack slash configuration field for the URL.