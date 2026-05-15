
pipeline {
  agent any // wenn nur der Controller existiert, läuft es hier
  stages {
    stage("Checkout") {
      steps {git url: 'https://github.com/sobullubos/JenkinsLearning_Calculator.git', branch: 'main'}
    }      
    stage('Check') {
      steps {
        sh 'echo JAVA_HOME=$JAVA_HOME'
        sh 'java -version'
        sh './gradlew --version'
      }
    }
    stage('Build') {
      steps {
        sh './gradlew compileJava'
      }
    }
  }
}