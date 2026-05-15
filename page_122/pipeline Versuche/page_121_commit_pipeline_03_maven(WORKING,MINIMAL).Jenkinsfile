pipeline {
  agent any // wenn nur der Controller existiert, läuft es hier
  stages {
    stage("Checkout") {
      steps {git url: 'https://github.com/sobullubos/JenkinsLearning_Calculator_maven.git', branch: 'main'}
    }
    stage("Compile") {
      steps {
          dir('calculator') {
              sh "./mvnw compile"
          }
      }
    }
  }
}