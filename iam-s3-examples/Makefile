.PHONY: all decrypt destroy fmt graph plan

all: fmt
	terraform apply

decrypt:
	terraform output hippo_service_aws_secret_access_key_encrypted | base64 --decode | keybase pgp decrypt

destroy:
	terraform destroy

fmt:
	terraform fmt

graph:
    terraform graph

plan:
    terraform plan
