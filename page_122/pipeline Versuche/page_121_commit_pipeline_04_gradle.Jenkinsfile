pipeline {
  agent any // wenn nur der Controller existiert, läuft es hier
  stages {
    stage("Checkout") {
      steps {git url: 'https://github.com/sobullubos/JenkinsLearning_Calculator.git', branch: 'main'}
    }      
    stage('Build') {
      steps {
          sh './gradlew compileJava'
      }
    }
  }
}