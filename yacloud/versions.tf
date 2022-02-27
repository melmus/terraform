terraform {
  required_version = ">= 1.1.6"
  
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.71.0"
    }
  }
}

provider "yandex" {
  token     = "var.tokeinID"
  cloud_id  = "var.cloudID"
  folder_id = "var.folderID"
  zone      = "ru-central1-b"
}
