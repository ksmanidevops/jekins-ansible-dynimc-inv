

pipeline {
  agent { 
  label 'ansible'
  }
  environment {
   AWS_EC2_PRIVATE_KEY=credentials('myawskey') 
  }
  
  stages {
    
    //Get the Code from GitHub Repo
    stage('CheckOutCode'){
      steps{
        git credentialsId: 'fb4342db-b55e-41ae-a3da-38f72d0cc493', url: 'https://github.com/ksmanidevops/jekins-ansible-dynimc-inv.git'
      }
    }
     
    //Using Terrafrom can create the Servers
    
    stage('CreateServers'){
      steps{
       sh "terraform  -chdir=terraformscripts init"
       sh "terraform  -chdir=terraformscripts apply --auto-approve"
      }
    }
    
    //Run the playbook
    stage('RunPlaybook') {
      steps {
        sh "whoami"
        //List the dymaic inventory just for verification
        sh "ansible-inventory --graph -i inventory/aws_ec2.yaml"
        //Run playbook using dynamic inventory & limit exuection only fo tomcatservers.
        sh "ansible-playbook -i inventory/aws_ec2.yaml  playbooks/installTomcat9amazonlinux.yaml -u ec2-user --private-key=$AWS_EC2_PRIVATE_KEY --limit tomcatservers --ssh-common-args='-o StrictHostKeyChecking=no'"
      }
    }
  
  }//stages closing
}//pipeline closing
