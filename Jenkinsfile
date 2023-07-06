pipeline {
  agent any
  environment {
    JD_IMAGE = 'lapulga/angular_default_imaage'
    registryCredential = 'a917496c-0229-4f17-b853-5a70b6e3b082'
  }
  stages {
    stage('Clone Repository') {
      steps {
        git 'https://github.com/akshay09968/zaggle-prac-assign.git'
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
        sh "sudo docker service create --name phase_5 --replicas 1 ${JD_IMAGE}"
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
        sh 'sudo docker service logs phase_5'
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
