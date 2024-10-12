resource "aws_route53_record" "redis_cluster1" {
  zone_id = "Z1044879OVW9DJJRUKKP"
  name    = "redis.gpvicente.com"
  type    = "CNAME"
  ttl     = 60
  records = ["redis.cluster1.gpvicente.com"] 

  set_identifier = "us-east-1-redis-cluster"
  
  weighted_routing_policy {
    weight = 50  
  }

  health_check_id = aws_route53_health_check.redis_cluster1_health_check.id
}


resource "aws_route53_record" "redis_cluster2" {
  zone_id = "Z1044879OVW9DJJRUKKP"
  name    = "redis.gpvicente.com" 
  type    = "CNAME"
  ttl     = 60
  records = ["redis.cluster2.gpvicente.com"] 

  set_identifier = "us-west-2-redis-cluster"
  
  weighted_routing_policy {
    weight = 50 
  }

  health_check_id = aws_route53_health_check.redis_cluster2_health_check.id
}


resource "aws_route53_health_check" "redis_cluster1_health_check" {
  fqdn              = "redis.cluster1.gpvicente.com" 
  type              = "TCP" 
  port              = 26379
  request_interval  = 30
  failure_threshold = 3
}


resource "aws_route53_health_check" "redis_cluster2_health_check" {
  fqdn              = "redis.cluster2.gpvicente.com" 
  type              = "TCP" 
  port              = 26379
  request_interval  = 30
  failure_threshold = 3
}
