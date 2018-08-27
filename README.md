# aws-slack-slash-command
This skeleton creates a usable url to insert into slack slash configuration
## Project Settings
Make sure you have installed make.
```
make --version
```
If you are on Windows check this out https://chocolatey.org/packages/make
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