terraform {
  required_providers {
      docker = {
        source = "kreuzwerker/docker"
        } 
      }
    }
provider "docker" {}

resource "docker_image" "nginx" {
    name =  "nginx:alpine"
}

resource "docker_container" "nginx" {
    name = "miser2-terraform"
    image = docker_image.nginx.image_id

    ports {
        internal = 80
        external = 8081
    }
}