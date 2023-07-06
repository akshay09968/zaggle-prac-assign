pipeline {
  agent any
  environment {
    JD_IMAGE = 'lapulga/angular_default_image'
    registryCredential = 'Hashirama'
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
        sh "sudo docker build -t ${JD_IMAGE} ."
      }
    }
  }


    stage('Push Image to Docker Registry') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            sh "sudo docker push ${JD_IMAGE}"
          }
        }
      }
    }

    stage('Create Docker Service') {
      steps {
        sh "sudo docker service create --name angular_default_image --replicas 1 ${JD_IMAGE}"
      }
    }

    // stage('Configure Container Networking') {
    //   steps {
    //     sh 'sudo docker network create --driver overlay mynetwork'
    //     sh 'sudo docker service update --network-add mynetwork phase_5'
    //   }
    // }
    
    stage('Run Tests') {
      steps {
        sh 'sudo docker service logs angular_default_image'
      }
    }

    // stage('Cleanup') {
    //   steps {
    //     sh 'sudo docker service rm phase_5'
    //     sh 'sudo docker network rm mynetwork'
    //   }
    // }
  }
}
