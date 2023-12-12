// pipeline {
//     agent {
//         docker {
//             image 'node:20.10.0-alpine3.18' 
//             args '-p 3000:3000' 
//         }
//     }
//     stages {
//         stage('Build') { 
//             steps {
//                 sh 'npm install' 
//             }
//         }
//     }
// }
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // This step checks out your source code
                checkout scm
            }
        }
        stage("Build") {
            steps {
                echo "Building the app....."
            }
        }
        stage("Test") {
            steps {
                echo "Testing the app..."
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the app..."
            }
        }
    }
}