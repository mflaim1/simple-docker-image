
pipeline{
  agent any
   tools {
    maven 'mvn'
  }
  stages{
    stage ('Initialize'){
      steps{
        sh '''
          echo "PATH=${PATH}"
          echo "M2_HOME=${M2_HOME}"
          '''
      }
    }
    stage ('Build Docker Images') {
      steps{
      
        sh "mvn clean install -U -Papp-docker-image"

      }
    }

    stage ('Deploy to INT') {
      steps{
		sh "docker pull oscarfonts/h2"    

		sh "docker run -d -p 1521:1521 -p 81:81 -v /tmp:/opt/h2-data --name=MyH2Instance oscarfonts/h2"
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
         sh "docker-compose -p app-$BUILD_NUMBER --file src/test/resources/docker-compose.yml down"
       }
    }
  }
