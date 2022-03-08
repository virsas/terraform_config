# tfmod_config

Terraform module to enable AWS config service

## Terraform example

``` terraform
module "config-eu-west-1" {
  source = "github.com/virsas/tfmod_config"
  name = "config-eu-west-1"
  bucket = module.s3_config.name
  // Optional variables 
  // Valid values: One_Hour, Three_Hours, Six_Hours, Twelve_Hours, TwentyFour_Hours
  // Default value: TwentyFour_Hours
  frequency = "TwentyFour_Hours"
  // Default value: eu-west-1
  region = "eu-west-1"
}
```
