.PHONY: all decrypt destroy fmt

all: fmt
	terraform apply

decrypt:
	terraform output nicewrk_service_aws_secret_access_key_encrypted | base64 --decode | keybase pgp decrypt

destroy:
	terraform destroy

fmt:
	terraform fmt
