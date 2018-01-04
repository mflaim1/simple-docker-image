pipeline {
  agent { dockerfile true }
  stages {
    stage('Example'){
        steps{
            echo 'IN STEP'
            sh 'echo myEnvVar = $myEnvVar'
            sh 'echo otherEnvVar = $otherEnvVar'

        }
    }
  }

}
