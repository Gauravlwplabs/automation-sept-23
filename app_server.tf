module "autoscaling" {
  source        = "terraform-aws-modules/autoscaling/aws"
  version       = "6.10.0"
  name          = "app-server-asg-${local.vpc_name_local}"
  instance_name = "app-server-${local.vpc_name_local}"

  key_name                  = aws_key_pair.this.key_name
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  default_instance_warmup   = 300
  health_check_type         = "EC2"
  vpc_zone_identifier       = [element([for each_subnet in aws_subnet.pri_sub : each_subnet.id], 0)]

  initial_lifecycle_hooks = [
    {
      name                 = "ExampleStartupLifeCycleHook"
      default_result       = "CONTINUE"
      heartbeat_timeout    = 60
      lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
      # This could be a rendered data resource
      notification_metadata = jsonencode({ "hello" = "world" })
    },
    {
      name                 = "ExampleTerminationLifeCycleHook"
      default_result       = "CONTINUE"
      heartbeat_timeout    = 180
      lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
      # This could be a rendered data resource
      notification_metadata = jsonencode({ "goodbye" = "world" })
    }
  ]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      checkpoint_delay             = 600
      checkpoint_percentages       = [35, 70, 100]
      instance_warmup              = 300
      min_healthy_percentage       = 50
      auto_rollback                = true
      scale_in_protected_instances = "Refresh"
      standby_instances            = "Terminate"
    }
    triggers = ["tag"]
  }

  # Launch template
  launch_template_name        = "app-server-${local.vpc_name_local}"
  launch_template_description = "launch template for application server"
  update_default_version      = true

  image_id          = var.app_server_image_id
  instance_type     = var.app_server_instance_type
  ebs_optimized     = true
  enable_monitoring = true


  security_groups = [aws_security_group.allow_app_server.id]


  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 10
        volume_type           = "gp2"
      }
      }, {
      device_name = "/dev/sda1"
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 10
        volume_type           = "gp2"
      }
    }
  ]

  cpu_options = {
    core_count       = 1
    threads_per_core = 1
  }

  # Target scaling policy schedule based on average CPU load
  scaling_policies = {
    avg-cpu-policy-greater-than-90 = {
      policy_type               = "TargetTrackingScaling"
      estimated_instance_warmup = 1200
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 90.0
      }
    }
  }
  tags = {
    Environment = "dev"
  }
}