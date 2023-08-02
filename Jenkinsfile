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


pipeline {
  agent any
  environment {
    
    JD_IMAGE = 'lapulga/angular_default_image'
    registryCredential = 'Tobirama' // Update this with your actual Docker registry credentials ID
    K8S_NAMESPACE = 'kubernetes-dashboard' // Update this with the target Kubernetes namespace
     // Update this with your desired Kubernetes deployment name
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
        sh "kubectl apply -f kubernetes/deployment.yml --namespace=${K8S_NAMESPACE}"
      }
    }

    stage('Run Tests') {
      steps {
        sh "kubectl logs deployment/${K8S_DEPLOYMENT_NAME} --namespace=${K8S_NAMESPACE}"
      }
    }
  }
}
