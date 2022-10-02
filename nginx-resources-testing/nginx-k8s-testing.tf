
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-testing"
    labels = {
      App = "Store-testing"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "store-testing"
      }
    }
    template {
      metadata {
        labels = {
          App = "store-testing"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "nginx-testing"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
