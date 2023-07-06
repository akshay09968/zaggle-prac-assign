pipeline {
  agent any
  environment {
    JD_IMAGE = 'lapulga/angular_default_imaage'
    registryCredential = '970d8df2-fffb-4375-9c21-191eda3f2bc9'
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
