import boto3
import paramiko
import os

def lambda_handler(event, context):
    s3_bucket_name=event['Records'][0]['s3']['bucket']['name']
    s3_key=event['Records'][0]['s3']['object']['key']
    print(s3_bucket_name)
    print(s3_key)

    
    # connect to s3
    
    s3_client = boto3.client('s3')
    
    local_war_path='/tmp/application.war'
    s3_client.download_file(s3_bucket_name, s3_key, local_war_path)
    
    # # Retrieve ec2 instance details 
    
    ec2_client = boto3.client('ec2')
    
    response = ec2_client.describe_instances(
                    Filters=[
                        {
                            'Name': 'tag:Environment',
                            'Values': [
                                'dev',
                            ]
                        },
                    ],
                )
    
    private_ip_address=response["Reservations"][0]["Instances"][0]["PrivateIpAddress"]
    
    print(private_ip_address)
    
    s3_client.download_file("keybucketforlambda123455", "keypair", "/tmp/file.pem")
    
    os.system("cat /tmp/file.pem")
    
    key = paramiko.RSAKey.from_private_key_file("/tmp/file.pem")
    
    # Connect to EC2 instance via ssh
    
    ssh_client = paramiko.SSHClient()
    ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh_client.connect(
        hostname=private_ip_address,
        username="ec2-user",
        pkey=key,
        )
    
    print("connected to: "+private_ip_address)
    
    # copy the file to ec2 instance
    
    sftp_client = ssh_client.open_sftp()
    remote_file_path="/tmp/application.war"
    sftp_client.put(local_war_path,remote_file_path)
    sftp_client.close()
    
    ssh_client.close()
