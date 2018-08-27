SHELL := /bin/bash
include config.mk
MODULE = $(notdir $(shell pwd))

.PHONY: build bucket deploy delete errors

build:
	zip -r ./resource/$(PROJECTNAME).zip ./index.js
	aws cloudformation package --s3-bucket $(STACK_ROOT) --template-file cloudformation.yaml --output-template-file ./resource/cloudformation.pkg.yaml

bucket:
	aws s3 mb s3://$(STACK_ROOT)

deploy:
	aws s3 cp ./resource/$(PROJECTNAME).zip s3://$(STACK_ROOT)/source_code/$(MODULE).zip
	aws cloudformation deploy --stack-name "$(STACK_ROOT)" --template-file ./resource/cloudformation.pkg.yaml --capabilities CAPABILITY_NAMED_IAM --parameter-overrides StackRoot=$(STACK_ROOT) Account=$(ACCOUNT) ProjectName=$(PROJECTNAME) Region=$(REGION) Module=$(MODULE) SlackVerificationToken=$(SLACK_VERIFICATION_TOKEN) SlackTeamId=$(SLACK_TEAM_ID) CommandName=$(COMMAND_NAME)

delete:
	aws cloudformation delete-stack --stack-name "$(STACK_ROOT)"

errors:
	aws cloudformation describe-stack-events --stack-name "$(STACK_ROOT)"