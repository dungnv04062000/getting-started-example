def CredentialsId = "dockerDevopsID"
def image = "dungnv46/getting-started"
// def artifactoryRegistry = 'http://ec2-13-213-66-189.ap-southeast-1.compute.amazonaws.com:9000'

pipeline {
    agent any
    stages {
        stage('Check out git') {
            steps {
                // This step checks out your source code
                checkout scm
            }
        }
        stage("Build Image") {
            steps {
                echo "Building the app with image $image:v1.$BUILD_NUMBER....."
                sh "docker build -t $image:v1.$BUILD_NUMBER -f Dockerfile ."
            }
        }
        stage("Push Image to DockerHub") {
            steps {
                echo "Push image $image:v1.$BUILD_NUMBER....."
                // script {
                //     try{
                //         // Login Artifactory
                //         withCredentials([usernamePassword(credentialsId: 'dockerDevopsID', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                //                 sh "docker login -u $USERNAME -p $PASSWORD $artifactoryRegistry"
                //         }
                //         echo "Login successfully....."
                //         //sh "docker tag $image-single:$BUILD_NUMBER"
                //         //sh "docker push $image-single:v1.$BUILD_NUMBER"
                //     } catch(e){
                //         echo "push image exception-" + e.toString()
                //     }
                // }
                withCredentials([usernamePassword(credentialsId: 'dockerDevopsID', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                                sh "docker login -u $USERNAME -p $PASSWORD docker.io"
                        }
                        echo "Login successfully....."
                        //sh "docker push $image-single:v1.$BUILD_NUMBER"
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the app with image $image:v1.$BUILD_NUMBER..."
                sh "docker run -it --name $image -p 9701:3000 -h $image-dev $image:v1.$BUILD_NUMBER"
                // script {
                //     try{
                //         sh "docker run -it --name $image -p 9701:3000 -h $image-dev $image:v1.$BUILD_NUMBER"
                //         echo "Deploying the app successfully with image $image:$BUILD_NUMBER"
                //     } catch(e){
                //         echo "deloy image exception-" + e.toString()
                //     }
                // }
            }
        }
        stage("Remove image") {
                steps {
                    echo "Remove image $image:v1.$BUILD_NUMBER ..."
                    // sh "docker rmi $image:v1.$BUILD_NUMBER"
                    sh "docker system prune -- volumes"
                    sh "y"
                }
        }
        }
}