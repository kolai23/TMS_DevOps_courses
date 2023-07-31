1. Вывести список всех удаленных репозиториев для локального.
```bash
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs
$ git clone https://github.com/tms-dos17-onl/mikalai-vabishchevich.git
Cloning into 'mikalai-vabishchevich'...
remote: Enumerating objects: 38, done.
remote: Counting objects: 100% (38/38), done.
remote: Compressing objects: 100% (31/31), done.
remote: Total 38 (delta 10), reused 33 (delta 5), pack-reused 0
Receiving objects: 100% (38/38), 74.08 KiB | 677.00 KiB/s, done.
Resolving deltas: 100% (10/10), done.
```
2. Вывести список всех веток.
```bash
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git remote -v
origin  https://github.com/tms-dos17-onl/mikalai-vabishchevich.git (fetch)
origin  https://github.com/tms-dos17-onl/mikalai-vabishchevich.git (push)
```
3. Вывести последниe 3 коммитa с помощью git log.
```bash
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git log -n 3
commit d09ee8cba4a936740650d00eb0e6102894a89901 (HEAD -> main, origin/main, origin/HEAD)
Author: kolai23 <q3181309@gmail.com>
Date:   Fri Jul 21 16:03:02 2023 +0300

    add

commit 875a35c765b82c00caae38644aa9481e6ef571f1
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Jul 20 01:37:05 2023 +0300

    add hw3 hw4(task 1,2,3,4)

commit 68f7ac6031db3fb202afbecd0ffb6f59a6521c0a
Author: kolai23 <q3181309@gmail.com>
Date:   Wed Jul 19 23:22:07 2023 +0300

    update 19.07
```
4. Создать пустой файл README.md и сделать коммит.
```bash
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        hw08/

nothing added to commit but untracked files present (use "git add" to track)

Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git add hw08/README.md
warning: LF will be replaced by CRLF in hw08/README.md.
The file will have its original line endings in your working directory

Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   hw08/README.md
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git commit -m "add Readme.md"
[main 4b40e4c] add Readme.md
 1 file changed, 1 insertion(+)
 create mode 100644 hw08/README.md
```
5. Добавить фразу "Hello, DevOps" в README.md файл и сделать коммит.
```bash
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ echo "Hello, DevOps">> ./hw08/README.md
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git add .
warning: LF will be replaced by CRLF in hw08/README.md.
The file will have its original line endings in your working directory
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git commit -m "add text Readme.md"
[main bc36baf] add text Readme.md
 1 file changed, 1 insertion(+)
```
6. Сделать реверт последнего коммита. Вывести последниe 3 коммитa с помощью git log.
```bash
Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ git log -n 3
commit bc36baf0a05da77f84933e4a9db5b64611184039 (HEAD -> main)
Author: kolai23 <q3181309@gmail.com>
Date:   Sun Jul 30 20:57:47 2023 +0300

    add text Readme.md

commit 4b40e4c684ac877108657840592d4da23bead329
Author: kolai23 <q3181309@gmail.com>
Date:   Sun Jul 30 20:49:25 2023 +0300

    add Readme.md

commit d09ee8cba4a936740650d00eb0e6102894a89901 (origin/main, origin/HEAD)
Author: kolai23 <q3181309@gmail.com>
Date:   Fri Jul 21 16:03:02 2023 +0300

    add
```
7. Удалить последние 3 коммита с помощью git reset.
```bash

```
8. Вернуть коммит, где добавляется пустой файл README.md. Для этого найти ID коммита в git reflog, а затем сделать cherry-pick.
```bash

```
9. Удалить последний коммит с помощью git reset.
```bash

```
10. Переключиться на ветку main или master. Если ветка называется master, то переименовать её в main.
```bash

```
10. Переключиться на ветку main или master. Если ветка называется master, то переименовать её в main.
```bash

```
11. Скопировать файл https://github.com/tms-dos17-onl/_sandbox/blob/main/.github/workflows/validate-shell.yaml, положить его по такому же относительному пути в репозиторий. Создать коммит и запушить его в удаленный репозиторий.
```bash

```
12. Создать из ветки main ветку develop. Переключиться на неё и создать README.md в корне репозитория. Написать в этом файле какие инструменты DevOps вам знакомы и с какими вы бы хотели познакомиться больше всего (2-3 пункта).
```bash

```
13. Создать из ветки main ветку support и создать там файлик LICENSE с содержимым https://www.apache.org/licenses/LICENSE-2.0.txt. Создать коммит. Вывести последниe 3 коммитa.

14. Переключиться обратно на ветку main и создать там файлик LICENSE с содержимым https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt. Создать коммит. Вывести последниe 3 коммитa.15. Сделать merge ветки support в ветку main и решить конфликты путем выбора содержимого только одной лицензии.
```bash

```
16. Переключиться на ветку develop и сделать rebase относительно ветки main.17. Вывести историю последних 10 коммитов в виде графа с помощью команды git log -10 --oneline --graph.
```bash

```
18. Зайти в свой репозиторий на GitHub и создать Pull Request из ветки develop в ветку main.
```bash

```

