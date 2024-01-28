### 1. Прочитать статью.

### 2. Установить Jenkins.
```bash
test@DESKTOP-SDPV7KD:~$ docker run --name jenkins -d -p 8090:8080 -p 50000:50000 -v jenkins:/var/jenkins_home jenkins/jenkins
test@DESKTOP-SDPV7KD:~$ docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED       STATUS       PORTS                                              NAMES
a0a60d1d46b2   jenkins/jenkins   "/usr/bin/tini -- /u…"   2 hours ago   Up 2 hours   0.0.0.0:50000->50000/tcp, 0.0.0.0:8090->8080/tcp   jenkins
test@DESKTOP-SDPV7KD:~$

```
![Alt text](<image/Screenshot 2023-11-12 184152.png>)
### 3. Создать свой первый pipeline по инструкции "Through the classic UI"
```bash
pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                echo 'Hello world!' 
            }
        }
        stage('Stage 2') {
            steps {
                sh 'hostname'
                sh 'whoami'
            }
        }
    }
}
Started by user test
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/jenkins_home/workspace/test_build
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Stage 1)
[Pipeline] echo
Hello world!
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Stage 2)
[Pipeline] sh
+ hostname
a0a60d1d46b2
[Pipeline] sh
+ whoami
jenkins
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
