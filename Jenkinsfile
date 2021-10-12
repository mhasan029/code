pipeline{
    agent none
    stages{
        stage("memeory of 102 server"){
		agent {label 'lebelprivate001'}
            steps{
                sh 'ip addr'
                sh 'free -m'
            }
            
        }
            
	
		stage("Signaling updated with new jar"){
		agent {label 'labelpublic001'}
			steps{
			 sh '''chmod 777 /tmp/MasterPath/workspace/TestPipelineMultiLabelWithSCM/Signaling_jar_update.sh
			 sh /tmp/MasterPath/workspace/TestPipelineMultiLabelWithSCM/Signaling_jar_update.sh'''
			}
		}
	}
}
    
