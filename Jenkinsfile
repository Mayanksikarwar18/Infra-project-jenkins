pipeline {

    agent any

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'staging', 'prod'],
            description: 'Target Azure environment'
        )

        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Terraform action'
        )
    }

    environment {
        TF_DIR = 'terraform'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Format Check') {
            steps {
                dir("${TF_DIR}") {
                    bat 'terraform fmt -check -recursive'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'azure-sp-credentials',
                        usernameVariable: 'ARM_CLIENT_ID',
                        passwordVariable: 'ARM_CLIENT_SECRET'
                    ),
                    string(
                        credentialsId: 'azure-tenant-id',
                        variable: 'ARM_TENANT_ID'
                    ),
                    string(
                        credentialsId: 'azure-subscription-id',
                        variable: 'ARM_SUBSCRIPTION_ID'
                    )
                ]) {
                    dir("${TF_DIR}") {
                        bat 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TF_DIR}") {
                    bat 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            when {
                expression {
                    params.ACTION == 'plan' || params.ACTION == 'apply'
                }
            }

            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'azure-sp-credentials',
                        usernameVariable: 'ARM_CLIENT_ID',
                        passwordVariable: 'ARM_CLIENT_SECRET'
                    ),
                    string(
                        credentialsId: 'azure-tenant-id',
                        variable: 'ARM_TENANT_ID'
                    ),
                    string(
                        credentialsId: 'azure-subscription-id',
                        variable: 'ARM_SUBSCRIPTION_ID'
                    ),
                    string(
                        credentialsId: 'tf-admin-password',
                        variable: 'TF_VAR_admin_password'
                    )
                ]) {
                    dir("${TF_DIR}") {
                        bat """
                            terraform plan ^
                            -var-file="environments\\${params.ENVIRONMENT}.tfvars" ^
                            -out="tfplan"
                        """
                    }
                }
            }
        }

        stage('Approval') {
            when {
                expression {
                    params.ACTION == 'apply' || params.ACTION == 'destroy'
                }
            }

            steps {
                input(
                    message: "Proceed with ${params.ACTION} for ${params.ENVIRONMENT}?",
                    ok: 'Proceed'
                )
            }
        }

        stage('Terraform Apply') {
            when {
                expression {
                    params.ACTION == 'apply'
                }
            }

            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'azure-sp-credentials',
                        usernameVariable: 'ARM_CLIENT_ID',
                        passwordVariable: 'ARM_CLIENT_SECRET'
                    ),
                    string(
                        credentialsId: 'azure-tenant-id',
                        variable: 'ARM_TENANT_ID'
                    ),
                    string(
                        credentialsId: 'azure-subscription-id',
                        variable: 'ARM_SUBSCRIPTION_ID'
                    ),
                    string(
                        credentialsId: 'tf-admin-password',
                        variable: 'TF_VAR_admin_password'
                    )
                ]) {
                    dir("${TF_DIR}") {
                        bat 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                expression {
                    params.ACTION == 'destroy'
                }
            }

            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'azure-sp-credentials',
                        usernameVariable: 'ARM_CLIENT_ID',
                        passwordVariable: 'ARM_CLIENT_SECRET'
                    ),
                    string(
                        credentialsId: 'azure-tenant-id',
                        variable: 'ARM_TENANT_ID'
                    ),
                    string(
                        credentialsId: 'azure-subscription-id',
                        variable: 'ARM_SUBSCRIPTION_ID'
                    ),
                    string(
                        credentialsId: 'tf-admin-password',
                        variable: 'TF_VAR_admin_password'
                    )
                ]) {
                    dir("${TF_DIR}") {
                        bat """
                            terraform destroy ^
                            -var-file="environments\\${params.ENVIRONMENT}.tfvars" ^
                            -auto-approve
                        """
                    }
                }
            }
        }

        stage('Terraform Output') {
    when {
        expression {
            params.ACTION == 'apply'
        }
    }

    steps {
        withCredentials([
            usernamePassword(
                credentialsId: 'azure-sp-credentials',
                usernameVariable: 'ARM_CLIENT_ID',
                passwordVariable: 'ARM_CLIENT_SECRET'
            ),
            string(
                credentialsId: 'azure-tenant-id',
                variable: 'ARM_TENANT_ID'
            ),
            string(
                credentialsId: 'azure-subscription-id',
                variable: 'ARM_SUBSCRIPTION_ID'
            )
        ]) {
            dir("${TF_DIR}") {
                bat 'terraform output'
            }
        }
    }
}
    }

    post {
        success {
            echo 'Terraform Pipeline Completed Successfully!'
        }

        failure {
            echo 'Terraform Pipeline Failed!'
        }
    }
}