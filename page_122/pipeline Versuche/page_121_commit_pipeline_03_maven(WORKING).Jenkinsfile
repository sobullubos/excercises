pipeline {
  agent any // wenn nur der Controller existiert, läuft es hier
  stages {
    stage("Checkout") {
      steps {git url: 'https://github.com/sobullubos/JenkinsLearning_Calculator_maven.git', branch: 'main'}
    }
stage('Diagnose mvnw') {
  steps {
    sh '''
      set -eux
      pwd
      ls -la
      # Zeige die ersten Bytes inkl. CR/LF:
      hexdump -C mvnw | sed -n '1,3p' || true
      # Wenn verfügbar, zeigt "file" CRLF an:
      (command -v file && file mvnw) || true
      # Rechte anzeigen:
      stat -c "%A %n" mvnw || true
    '''
  }
}
    stage("Check") {
      steps {
          dir('calculator') {
            sh "echo JAVA_HOME=$JAVA_HOME"
            sh "java -version"
            sh "./mvnw --version"
          }
      }
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