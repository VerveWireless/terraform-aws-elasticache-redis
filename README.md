# terraform-aws-elasticache-redis

Terraform module to provision an [`ElastiCache`](https://aws.amazon.com/elasticache/) Redis Cluster

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "example_redis" {
  source          = "git::https://github.com/cloudposse/terraform-aws-elasticache-redis.git?ref=master"
  namespace       = "general"
  name            = "redis"
  stage           = "prod"
  zone_id         = "${var.route53_zone_id}"
  security_groups = ["${var.security_group_id}"]

  vpc_id                       = "${var.vpc_id}"
  subnets                      = "${var.private_subnets}"
  maintenance_window           = "wed:03:00-wed:04:00"
  cluster_size                 = "2"
  instance_type                = "cache.t2.micro"
  engine_version               = "3.2.4"
  alarm_cpu_threshold_percent  = "${var.cache_alarm_cpu_threshold_percent}"
  alarm_memory_threshold_bytes = "${var.cache_alarm_memory_threshold_bytes}"
  apply_immediately            = "true"
  availability_zones           = "${var.availability_zones}"

  automatic_failover = "false"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alarm_actions |  | list | `<list>` | no |
| alarm_cpu_threshold_percent |  | string | `75` | no |
| alarm_memory_threshold_bytes |  | string | `10000000` | no |
| apply_immediately |  | string | `true` | no |
| attributes |  | list | `<list>` | no |
| automatic_failover |  | string | `false` | no |
| availability_zones |  | list | - | yes |
| cluster_size |  | string | `1` | no |
| delimiter |  | string | `-` | no |
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| engine_version |  | string | `3.2.4` | no |
| family |  | string | `redis3.2` | no |
| instance_type |  | string | `cache.t2.micro` | no |
| maintenance_window |  | string | `wed:03:00-wed:04:00` | no |
| name |  | string | `redis` | no |
| namespace |  | string | `global` | no |
| notification_topic_arn |  | string | `` | no |
| port |  | string | `6379` | no |
| security_groups |  | list | - | yes |
| stage |  | string | `default` | no |
| subnets |  | list | `<list>` | no |
| tags |  | map | `<map>` | no |
| vpc_id |  | string | `` | no |
| zone_id |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| host |  |
| id |  |
| port |  |
| primary_endpoint_address |  |
| security_group_id |  |

## License

Apache 2 License. See [`LICENSE`](LICENSE) for full details.
