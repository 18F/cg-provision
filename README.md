# cg-provision
Scripts and configuration for provisioning infrastructure used in cloud.gov

Manual steps to create the world:

1. Make sure you have [terraform](https://www.terraform.io/), awscli, and jq installed
 1. Mac OSX users can install all of these with homebrew
1. Create S3 bucket with versioning enabled to store terraform state
1. Create S3 bucket with versioning enabled to store concourse credentials
  1. Copy `./ci/credentials.yml.example` to `cg-provision.yml`
  1. Fill out `cg-provision.yml` with proper values
  1. Upload `cg-provision.yml` into the concourse credentials bucket
1. Clone [`cg-deploy-bosh` repository](https://github.com/18F/cg-deploy-bosh)
  1. Copy `cg-deploy-bosh/credentials.example.yml` to `cg-deploy-bosh.yml`.
  1. Fill `cg-deploy-bosh.yml` as much as you can. (You will need to modify this later)
  1. Upload `cg-deploy-bosh.yml` into the concourse credentials bucket
1. Create S3 bucket with versioning enabled to store BOSH manifest secrets
1. [Upload any IAM server certificates](https://github.com/18F/https#loading-the-cert-into-amazon-web-services)
1. Copy `./scripts/environment.default.sh` to `./scripts/environment.sh` and edit as appropriate
1. Run `./scripts/bootstrap.sh apply`
1. Login to the Concourse instance URL you see in the output
  1. Select `terraform-provision` pipeline in the menu
    1. Unpause the pipeline if paused
    1. Run the `bootstrap-tooling` job
    1. Once `bootstrap-tooling` is finished, run both `bootstrap-staging` and `bootstrap-production`
    1. Make a note of all the outputs
      1. Modify the `cg-deploy-bosh.yml` you created earlier, and fill in with proper values from the outputs
      1. Re-upload `cg-deploy-bosh.yml` to the concourse credentials bucket
  1. Select `bootstrap` pipeline in the menu
    1. Run the `setup-vpc-peering` job
  1. Select `deploy-bosh` pipeline in the menu
    1. Unpause the pipeline if paused
    1. Upload a JSON file called `master-bosh-state.json` with contents of just `{}` to the BOSH manifest secrets bucket
    1. Upload a properly filled and [encrypted secrets file](https://docs.cloud.gov/ops/updating-cf/#updating-secrets-yml) for masterbosh to the BOSH manifest secrets bucket
    1. Upload a [properly encrypted ssh key](https://github.com/18F/cg-pipeline-tasks/blob/master/generate_key.sh) for masterbosh to the BOSH manifest secrets bucket
    1. Run `deploy-master-bosh` job
    1. Upload a properly filled and [encrypted secrets file](https://docs.cloud.gov/ops/updating-cf/#updating-secrets-yml) for toolingbosh to the BOSH manifest secrets bucket
    1. Upload the CA cert (`properties.hm.director_account.ca_cert` from the secrets) for tooling bosh to the BOSH manifest secrets bucket
    1. Run `deploy-tooling-bosh` job
  1. Select `bootstrap` pipeline in the menu
    1. Run the `teardown-vpc-peering` job
1. Run `./scripts/bootstrap.sh destroy`