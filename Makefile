plan:
	terraform plan \
		-var "do_token=${DO_PAT}" \
		-var "ssh_key_fingerprint=${DO_SSH}" \
		-var "private_key=${PVT_KEY}" \
		-var "public_key=${PUB_KEY}"

apply:
	terraform apply \
		-var "do_token=${DO_PAT}" \
		-var "ssh_key_fingerprint=${DO_SSH}" \
		-var "private_key=${PVT_KEY}" \
		-var "public_key=${PUB_KEY}"

destroy:
	terraform destroy \
		-var "do_token=${DO_PAT}" \
		-var "ssh_key_fingerprint=${DO_SSH}" \
		-var "private_key=${PVT_KEY}" \
		-var "public_key=${PUB_KEY}"
