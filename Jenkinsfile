pipeline{
    agent {label 'lebelprivate001'}
    stages{
        stage("memeory of 102 server"){
            steps{
                sh 'ip addr'
                sh 'free -m'
            }
            
        }
            
        }
	agent {label 'labelpublic001'}
	stages{
		stage("Signaling updated with new jar"){
			steps{
			 sh '''chmod 777 /tmp/MasterPath/workspace/TestPipelineMultiLabelWithSCM/Signaling_jar_update.sh
			 sh /tmp/MasterPath/workspace/TestPipelineMultiLabelWithSCM/Signaling_jar_update.sh'''
			}
		}
	}
    
}