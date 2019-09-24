job "nginx" {
  region = "global"
  datacenters = ["dc1"]
  group "webserver" {
    count = 1 
    #NOTE: THIS IS YOUR SCALE NUMBER
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }
  task "nginx" {
    driver = "docker"
    config {
      image = "nginx:latest"
      port_map {
      web = 80
   }
 }
  service {
    name = "nginx"
    port = "web"
    check {
      name = "alive"
      type = "tcp"
      interval = "10s"
      timeout = "2s"
     }
  }
  resources {
     cpu = 500 # 500 Mhz
     memory = 64 # 64MB
     network {
       mbits = 10
       port "web" {
         static = "80" 
         #DON'T DO THIS! WILL EXPLAIN
         #Nomad likes to assign dynamic ports to avoid service port conflicts. 
         #Static port entries should be reserved only for load balancer containers.
      }
     }
    }
   }
  }
}