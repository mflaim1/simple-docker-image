
pipeline{
  agent any
  stages{
    stage ('Initialize'){
      steps{
        sh '''
          echo "PATH=${PATH}"
          echo "M2_HOME=${M2_HOME}"
          '''
      }
    }
    stage ('Build') {
      steps{
        sh "mvn clean install -U -Papp-docker-image"

      }
    }

    stage ('Deploy to INT') {
      steps{
	sh "docker-compose -p app-$BUILD_NUMBER --file src/test/resources/docker-compose.yml up -d mongo
"
	sh "sleep 30"

	sh "docker-compose -p app-$BUILD_NUMBER --file src/test/resources/docker-compose.yml \
     run mongo-docker-demo \
     java -jar /maven/jar/mongo-docker-demo-1.0-SNAPSHOT-jar-with-dependencies.jar mongo"


      }
    }
    stage ('Run INT tests') {
      steps{
	sh"docker-compose -p app-$BUILD_NUMBER --file src/test/resources/docker-compose.yml \
     run mongo-docker-demo-tests \
     mvn -f /maven/code/pom.xml  \
     -Pintegration-test verify"

      }
    }


      }
    post {
        always {
            sh "docker-compose -p app-$BUILD_NUMBER --file src/test/resources/docker-compose.yml down
"
        }
    }
  }
