# Cloud.gov Provisioning System

This repository holds the terraform configuration (and BOSH vars and ops-files)
to bootstrap our infrastructure.

## Layout

### Terraform

This system is using Terraform 0.11.  Future versions of the main providers
(AWS in particular) [will not work with this
version](https://www.hashicorp.com/blog/deprecating-terraform-0-11-support-in-terraform-providers/).
At some point, we'll need to upgrade to the (much better) 0.12 syntax.

The main terraform directories are:

* `modules`: where we decompose our configuration into [Terraform
  modules](https://www.terraform.io/docs/configuration-0-11/modules.html)
* `modules/stack/base` & `modules/stack/spoke`: the main modules that define
  the bulk of each environment
* `stacks`: the various "environments"

#### Environments

The `main` stack is a template that is used to provision the production,
staging, and development "environments."

> ##### Aside: Multiple environments in one account
>
> Why do I keep putting "environments" in quotes?  One confusing and suboptimal
> point is that the various environments are isolated from each other by being
> in separate VPCs, _not_ separate AWS accounts. This has some knock-on
> effects.
>
> For one, the modules are generally built to namespace themselves:
>
> ``` terraform
> resource "aws_elb" "kubernetes_elb" {
>   name = "${var.stack_description}-kubernetes"
>   ...
> ```
>
> If we didn't do this, then the production, staging and development resources
> would all use the same name - which wouldn't work since they're all in the same
> AWS account.
>
> :shrug:

The `tooling` stack contains our "proto-BOSH", which deploys the tooling BOSH.
The tooling BOSH then deploys the BOSH directors in the main stacks.

The `external` and `dns` stacks are both outside of GovCloud (commercial AWS).

I believe the `test` stack is unused.

### BOSH

The `bosh` directory contains vars and opsfiles.  I'm not sure which directors
use them.

## Development Workflow

Since IaaS is a shared resource (we don't have the money or time to provision
entire stacks for each developer), we never apply this configuration manually.
Instead, all execution is done through the Concourse pipeline, which is
configured to first run `terraform plan`, and then wait for manual triggering
before running `terraform apply`.

If you want to make infrastructure changes:

1. Create a branch and pull-request with your changes and ask for review and
   merge from a teammate.
1. Once the teammate :thumbsup: the changes, head over to the Concourse
   pipeline and review the resultant Terraform plan output.
1. If the plan looks like what you intended, then manually trigger the
   appropriate apply jobs.

## Other Points of Note

You may see `access_key_id_prev` and `aws_key_id_prev` as outputs for our `iam`
modules. [These are used for cred
rotation](https://cloud.gov/docs/ops/runbook/rotating-iam-users/#rotating-iam-user-access-key-ids-and-secret-access-keys)

`modules/stack/spoke` composes `modules/stack/base` and some of the VPC
modules.  It's not entirely clear why, and why the VPC modules weren't simply
included in `base` (removing `spoke` altogether).
