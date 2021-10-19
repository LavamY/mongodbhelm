# HELM DEPLOY TERRAFORM KUBERNETES MODULE

### This Module Deploys and configures Helm charts

### Required Providers
```
 provider "helm" {
      version = "~> 1.0"
```

### Use:
```
module "chart_helm" {
  source      = "../helm_deploy"
  helm_config = local.metrics_server
}
```
### Inputs:

| Variable | Value | 
|------|-------------|
|  repository            | The https endpoint of the repo |
|  name                  | The Name of the Helm Chart Deployment |
|  namespace             | The Namespace where the helm chart will be deployed |
|  chart                 | The Name of the Helm Chart |
|  chart_version         | The Version of the Helm Chart |
|  repository_username   | If Repo has username |
|  repository_password   | If Repo has password | 
|  default_values        | Values to be used as defaults on deployment |
|  extra_values          | Values that change with each deployment |

*The ```locals.tf``` is a good place where most of the default parameters should be configured for Helm Deployment:*
- Each Section contains settings for the corresponding service
- Those are the default settings for the helm values and shouldnt be altered unless necessary

```An Example of a locals block:
locals {
  metrics_server = merge({
    namespace     = "monitoring"
    repository    = "https://charts.helm.sh/stable"
    name          = "metrics-server"
    chart         = "metrics-server"
    chart_version = "2.6.0"
    default_values = local.metrics_server_values
    },
    var.metrics_server
  )

metrics_server_values = <<ENDYAML
    serviceAccount:
      name:
      annotations:
ENDYAML       
}
```


### The extra_values Variable
- The Extra Values Variable should be used to customize or pass in any Helm deployment specific values.
*If Using Terragrunt , those can be passed in through the live repository*

```An example of Extra Values would be as follows:
extra_values = <<ENDYAML 
 controller:
   publishService:
      enabled: true
   ingressClass: nginx
   replicaCount: 1
   minAvailable: 1 
 ENDYAML 
```

### There are more input variables, but the most prevalent ones are listed in the chart above 
