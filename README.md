# terraform_config

Terraform module to enable AWS config service

## Terraform example

``` terraform
module "config-eu-west-1" {
  source = "git::https://github.com/virsas/terraform_config.git?ref=v1.0.0"
  name = "config-eu-west-1"
  bucket = module.s3_config.name
  // Optional variables 
  // Valid values: One_Hour, Three_Hours, Six_Hours, Twelve_Hours, TwentyFour_Hours
  // Default value: TwentyFour_Hours
  frequency = "TwentyFour_Hours"
  // Default value: eu-west-1
  region = "eu-west-1"
  // The account ID
  organization = "123456789012"
}
```
