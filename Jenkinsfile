node {
  checkout scm
  
  def myenv = docker.build 'helloworld:latest'
  myenv.inside{
    sh 'echo myEnvVar = $myEnvVar'
    sh 'echo otherEnvVar = $otherEnvVar'
  }

}
