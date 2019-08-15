# NodeApp

# 1. Descargar y ejecutar la AppWeb Manualmente.

1. AppWeb nodejs de prueba
2. Aprovisionar 'manualmente' una VM en EC2 en Amazon
    2.1 ver video: https://drive.google.com/file/d/1ITGHTak0gdUv3m1izGxQM0eNpNmvvNuU/view?usp=sharing 
    2.2 abra los puertos 80 (appweb),  8080 (jenkins), 22 (ssh)
    2.3 deseable: asigne una IP fija
    2.4 opcional: solicite un dominio para esta IP
3. Entrar al Servidor, descargar la imagen docker de la appweb o crearla/publicarla la primera vez:

    3.1 Primera vez:

        $ git clone https://github.com/st0263eafit/NodeApp.git
        $ cd NodeApp
        $ docker build . -t emontoya/nodeapp
        $ docker login
        username: ...
        password: ...
        $ docker push emontoya/nodeapp

    3.2 Segunda vez:

        $ docker pull emontoya/nodeapp

4. Ejecutar el servidor:

        $ docker run -d --name mynodeapp -p 80:8000 emontoya/nodeapp

5. Abra browser y entre:

    http://<ip-amazon>

# 2. Para Integración y Entrega Continua, vamos a utilizar jenkins en Docker

1. Instalar y Ejecutar Docker en el servidor Amazon:

    $ cd NodeApp/jenkins-docker
    $ docker build . -t emontoya/jenkins
    $ docker run -d --name myjenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home:/var/jenkins_home emontoya/jenkins

// cuando corre la 1a vez, la clave de 'admin' la deja en '/var/jenkins_home/secrets/initialAdminPassword'  

2. Si requiere entrar al contenedor de jenkins:

    $ docker exec -u 0 -it myjenkins bash
    4fadb656de56e# 

    // realizar login a docker:

    4fadb656de56e# docker login:
    username: ...
    password: ...


3.  Configure la 1a vez jenkins:

    browser: http://<ip-amazon>:8080
    password: ....    # ver password en '/var/jenkins_home/secrets/initialAdminPassword' 

    default config, configure un primer usuario: admin clave: defina uno propio

    instale los plugins: 'CloudBees Docker build and Publish plugin', 'Github Pull Requests'

4. Crear en jenkins el job: 'nodeapp-build-publish' y 'nodeapp-pipeline'

5. Crear API KEY para webhook

6. Crear URL para webhook

7. Configurar webhook en github del proyecto, para que llame el job pipeline en jenkins

referencias:

* https://dzone.com/articles/adding-agithub-webhook-in-your-jenkins-pipeline
* https://github.com/papaludwig/docker-tutorials/tree/master/jenkins
* https://medium.com/@schogini/running-docker-inside-and-outside-of-a-jenkins-container-along-with-docker-compose-a-tiny-c908c21557aa
* https://www.youtube.com/watch?v=iMPUUROWI84
* https://github.com/Buffer0x7cd/jenkins-docker/
* https://medium.com/@manav503/how-to-build-docker-images-inside-a-jenkins-container-d59944102f30
* https://container-solutions.com/running-docker-in-jenkins-in-docker/