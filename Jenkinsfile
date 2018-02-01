
pipeline{
  agent any
   tools {
    maven 'mvn'
  }

  myPipeline()

   post {
   	  always {
         sh "docker-compose -p app-$BUILD_NUMBER --file src/test/resources/docker-compose.yml down"
       }
    }
  }
