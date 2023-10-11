### 1. Создать Bash скрипт print-value.sh, выводящий значение переменной $VALUE в консоль. Выполнить скрипт 3 раза, передавая каждый раз значение этой переменной разным способом.
```bash
vagrant@ubuntu-xenial:~$ VALUE=test bash print-value.sh
test
vagrant@ubuntu-xenial:~$ bash print-value.sh test
test
vagrant@ubuntu-xenial:~$ export VALUE=test
vagrant@ubuntu-xenial:~$ bash print-value.sh
test
vagrant@ubuntu-xenial:~$ sudo echo "export VALUE=test" >>./.bashrc
vagrant@ubuntu-xenial:~$ source ./.bashrc
vagrant@ubuntu-xenial:~$ bash print-value.sh
test

```
### 2. Создать Shell скрипт check-parity-shell.sh, который принимает число в качестве первого аргумента командной строки, и для чётного числа выводит в консоль строку "чётное", а для нечётного - "нечётное". В случае, если переданный аргумент не является числом, вывести соответствующее сообщение и завершить скрипт с кодом 1.
```bash
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash check-parity-shell.sh 1
Нечетное
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash check-parity-shell.sh 2
Чётное
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash check-parity-shell.sh asd 
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ echo $?
1
```
### 3. Переписать скрипт из предыдущего задания на Bash и назвать его check-parity-oneline.sh таким образом, чтобы он не использовал конструкцию if ... then ... else .. fi.
```bash
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash check-parity-oneline.sh -4
Чётное
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash check-parity-oneline.sh -5
Нечетное
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash check-parity-oneline.sh 1
Нечетное
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash check-parity-oneline.sh 2
Чётное
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash check-parity-oneline.sh qwe
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ echo $?
1
```
### 4. Создать Bash скрипт not-empty-file.sh, который считывает из STDIN имя файла и выводит в STDOUT его имя в случае, если он не является пустым. Проверить работу файла при помощи команды ls | ./not-empty-file.sh | xargs wc -l.
```bash
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ ls | ./not-empty-file.sh | xargs wc -l
  66 README.md
  13 check-parity-oneline.sh
  10 check-parity-shell.sh
  10 generate-testing-matrix.sh
   7 not-empty-file.sh
   3 print-value.sh
   2 test.txt
 111 total
```
### 5. Создать скрипт generate-testing-matrix.sh, в котором объявляется 2 массива (os - массив операционных систем и  - массив архитектур процессора) и который выводит в консоль комбинации всех возможных пар <OS>-<ARCH>. Например, linux-x86, linux-amd64, и т.д.
```bash
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich/hw10$ bash generate-testing-matrix.sh 
Ubuntu x86_64
Ubuntu i686
Fedora x86_64
Fedora i686
Centos x86_64
Centos i686
```
### 6. Обновить файл .github/workflows/validate-shell.yaml, если он не совпадает с https://github.com/tms-dos17-onl/_sandbox/blob/main/.github/workflows/validate-shell.yaml.
```bash

```
### 7. Создать Pull Request (PR) содержащий 5 созданных скриптов.
```bash

```
### 8. (**) Убедиться, что все файлы в репозитории проходят валидацию.
```bash

```