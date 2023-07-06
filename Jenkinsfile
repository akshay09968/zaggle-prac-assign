 pipeline {
  agent any

  stages {
    stage('Clone') {
      steps {
        git branch: 'master', url: 'https://github.com/akshay09968/jenkins-practice-assignment.git'
      }
    }

    stage('install') {
      steps {
        sh 'npm install'
      }
    }

        stage('Build') {
      steps {
        sh 'ng build --prod'
      }
    }
    
    stage('Push to Git') {
      steps {
        sh 'git add .'
        sh 'git commit -m "Jenkins build"'
        sh 'git push origin master'
      }
    }
  }
}

