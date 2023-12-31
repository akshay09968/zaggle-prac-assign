// pipeline {
//   agent any
//   environment {
//     JD_IMAGE = 'lapulga/angular_default_image'
//     registryCredential = 'Hashirama'
//   }
//       stages {
//     stage('Clone Repository') {
//       steps {
//         git branch: 'main', url: 'https://github.com/akshay09968/zaggle-prac-assign.git'
//       }
//     }
        
//     stage('Build Docker Image') {
//       steps {
//         script {
//           sh "sudo docker build -t ${JD_IMAGE} ."
//         }
//       }
//     }



// stage('Push Image to Docker Registry') {
//   steps {
//     script {
//       docker.withRegistry('https://registry.example.com', 'registryCredential') {
//         sh "docker push ${JD_IMAGE}"
//       }
//     }
//   }
// }


//     stage('Create Docker Service') {
//       steps {
//         sh "sudo docker service create --name angular_default_image --replicas 1 ${JD_IMAGE}"
//       }
//     }

//     // stage('Configure Container Networking') {
//     //   steps {
//     //     sh 'sudo docker network create --driver overlay mynetwork'
//     //     sh 'sudo docker service update --network-add mynetwork phase_5'
//     //   }
//     // }
    
//     stage('Run Tests') {
//       steps {
//         sh 'sudo docker service logs angular_default_image'
//       }
//     }

//     // stage('Cleanup') {
//     //   steps {
//     //     sh 'sudo docker service rm phase_5'
//     //     sh 'sudo docker network rm mynetwork'
//     //   }
//     // }
//   }
// }


// pipeline {
//   agent any
//   environment {
    
//     JD_IMAGE = 'lapulga/angular_default_image'
//     registryCredential = 'Tobirama' // Update this with your actual Docker registry credentials ID
//     K8S_NAMESPACE = 'default' // Update this with the target Kubernetes namespace
//   }
//   stages {
//     stage('Clone Repository') {
//       steps {
//         git branch: 'main', url: 'https://github.com/akshay09968/zaggle-prac-assign.git'
//       }
//     }
        
//     stage('Build Docker Image') {
//       steps {
//         script {
//           sh "docker build -t ${JD_IMAGE} ."
//         }
//       }
//     }

//     stage('Push Image to Docker Registry') {
//       steps {
//         script {
//           docker.withRegistry('', registryCredential) {
//             sh "docker push ${JD_IMAGE}"
//           }
//         }
//       }
//     }

//     stage('Deploy to Kubernetes') {
//       steps {
//         sh "minikube stop"
//         sh "minikube delete"
//         sh "minikube start --driver=virtualbox"
//         // sh "kubectl apply -f kubernetes/deployment.yml --namespace=${K8S_NAMESPACE}"
//       }
//     }

//     stage('Clean up') {
//       steps {
//             // Cleanup steps
//             sh 'minikube stop'
//             sh 'minikube delete'
//         }
//     }
// }
// }


pipeline {
  agent any
  environment { 
    JD_IMAGE = 'lapulga/angular_default_image'
    registryCredential = 'Tobirama' // Update this with your actual Docker registry credentials ID
    K8S_NAMESPACE = 'default' // Update this with the target Kubernetes namespace
    KUBE_POD_NAME = 'my-angular-pod'
  }
  stages {
    stage('Clone Repository') {
      steps {
        git branch: 'main', url: 'https://github.com/akshay09968/zaggle-prac-assign.git'
      }
    }
        
    stage('Build Docker Image') {
      steps {
        script {
          sh "docker build -t ${JD_IMAGE} ."
        }
      }
    }

    stage('Push Image to Docker Registry') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            sh "docker push ${JD_IMAGE}"
          }
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        // sh "minikube stop"
        // sh "minikube delete"
        // sh "minikube start --driver=virtualbox --profile=my-minikube"
        // sh "kubectl run $KUBE_POD_NAME --image=$DOCKER_IMAGE --restart=Always --port=80 --namespace=$KUBE_NAMESPACE"
        // sh "minikube stop -p minikube" // Stop the specified profile
        // sh "minikube delete -p minikube" // Delete the specified profile
        sh "minikube start --driver=virtualbox --profile=minikube"
        sh "kubectl apply -f deployment.yml --namespace=${K8S_NAMESPACE}"
        }
    }

    stage('Checking whether pod is created or not'){
      steps{
        sleep 60
        sh "kubectl get deployments --namespace=${K8S_NAMESPACE}"
        sh "kubectl describe pods --namespace=${K8S_NAMESPACE}"
      }
    }

    stage('Clean up') {
      steps {
            // Cleanup steps
            sh 'minikube stop'
            sh 'minikube delete'
        }
    }
}
}
