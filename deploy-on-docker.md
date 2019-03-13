# NodeApp - Docker

By: Edwin Montoya Munera - emontoya@eafit.edu.co

# Correr el código en contenedores de Docker

## Instalar Docker

### En AWS Amazon Linux - programa AWS Educate

      # imagen: Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-0080e4c5bc078760e
      # imagen: Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-035be7bafff33b6b6 (64-bit x86) / ami-0217d483951e4cec3 (64-bit Arm)
      # guia: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

      $ sudo yum update -y

      # para Amazon Linux AMI
      $ sudo yum install docker

      # para Amazon Linux 2 AMI
      $ sudo amazon-linux-extras install docker

      $ sudo service docker start
      $ sudo usermod -a -G docker ec2-user
      $ reboot

      instalar docker-compose: https://docs.docker.com/compose/install/

      $ sudo curl -L https://github.com/docker/compose/releases/download/1.24.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
      $ sudo chmod +x /usr/local/bin/docker-compose

### En Ubuntu:

      $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu$(lsb_release -cs) stable"
      $ sudo apt-get update
      $ sudo apt-get install docker-ce

### Centos 7

    source: https://docs.docker.com/install/linux/docker-ce/centos/

    $ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    $ sudo yum install docker-ce
    $ sudo systemctl start docker
    $ sudo systemctl enable docker
    $ sudo usermod -aG docker user1

    instalar docker-compose: https://docs.docker.com/compose/install/

    $ sudo curl -L https://github.com/docker/compose/releases/download/1.24.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

    $ sudo chmod +x /usr/local/bin/docker-compose


### En Windows:

Descargar el instalador grafico oficial de [Docker](https://docs.docker.com/docker-for-windows/install/)

### En MacOS:

Descargar el instalador grafico oficial de [Docker](https://docs.docker.com/docker-for-mac/install/)

## Descargar el proyecto github y build en Docker

      $ cd /tmp/
      $ mkdir apps
      $ cd apps
      $ git clone https://github.com/st0263eafit/NodeApp.git
      $ cd NodeApp
      $ docker build . -t emontoya/nodeapp

## Descargar imagen desde docker hub

      $ docker pull emontoya/nodeapp

## Ejecutar manualmente la app:

      $ docker run -d -p 80:8000 --name mynodeapp emontoya/nodeapp
      
## Abra un browser y entre a la url: 

      http://<ip/nombre-servidor>
