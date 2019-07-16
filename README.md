Create a project in the Google Cloud Console and set up billing on that project. Any examples in this guide will be part of the GCP "always free" tier.

initial-scripts/terraform.sh

Adding credentials
https://www.terraform.io/docs/providers/google/getting_started.html#adding-credentials

In order to make requests against the GCP API, you need to authenticate to prove that it's you making the request. The preferred method of provisioning resources with Terraform is to use a GCP service account, a "robot account" that can be granted a limited set of IAM permissions.
From the service account key page in the Cloud Console choose an existing account, or create a new one. Next, download the JSON key file.

export GOOGLE_CLOUD_KEYFILE_JSON={{path}}


