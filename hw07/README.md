### 1. Вывести список всех удаленных репозиториев для локального.
```bash
test@test:~/mikalai-vabishchevich$ git remote -v
origin  git@github.com:tms-dos17-onl/mikalai-vabishchevich.git (fetch)
origin  git@github.com:tms-dos17-onl/mikalai-vabishchevich.git (push)

```
### 2. Вывести список всех веток.
```bash
test@test:~/mikalai-vabishchevich$ git branch -a
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
```
### 3. Вывести последниe 3 коммитa с помощью git log.
```bash
test@test:~/mikalai-vabishchevich$ git log -n 3
commit 9eb579930daece3ca96caf69deebe671a231cf4e (HEAD -> main, origin/main, origin/HEAD)
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Aug 3 10:14:48 2023 +0300

    Update Readme.md

commit 27967638cd1f80ab76835d039dbfc39ccb91733a
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Aug 3 08:27:38 2023 +0300

    add

commit f19fd5edf74f88e9707c988be44cf8ee3b2156ce
Merge: 0b053f0 edbe0ce
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Aug 3 08:13:02 2023 +0300

    Merge branch 'main' of https://github.com/tms-dos17-onl/mikalai-vabishchevich

```
### 4. Создать пустой файл README.md и сделать коммит.
```bash
test@test:~/mikalai-vabishchevich$ touch README.md
test@test:~/mikalai-vabishchevich$ git add README.md
test@test:~/mikalai-vabishchevich$ git commit -m "Create README.md"
[main b818b7e] Create README.md
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 README.md
```

### 5. Добавить фразу "Hello, DevOps" в README.md файл и сделать коммит.
```bash
test@test:~/mikalai-vabishchevich$ echo "Hello, DevOps" >> README.md
test@test:~/mikalai-vabishchevich$ git add README.md
test@test:~/mikalai-vabishchevich$ git commit -m "Add text README.md"
[main 53355ae] Add text README.md
 1 file changed, 1 insertion(+)

```
### 6. Сделать реверт последнего коммита. Вывести последниe 3 коммитa с помощью git log.
```bash
test@test:~/mikalai-vabishchevich$ git revert HEAD
[main 57b3350] Revert "Add text README.md"
 1 file changed, 1 deletion(-)
test@test:~/mikalai-vabishchevich$ git log -n 3
commit 57b335025b5434894ceaf38cf73d23e48f14cd8b (HEAD -> main)
Author: vabischevich <vabischevich@telsgloba.com>
Date:   Thu Aug 3 08:42:16 2023 +0000

    Revert "Add text README.md"

    This reverts commit 53355ae9cd799cb784161f565c88f7aed6515ef4.

commit 53355ae9cd799cb784161f565c88f7aed6515ef4
Author: vabischevich <vabischevich@telsgloba.com>
Date:   Thu Aug 3 08:40:09 2023 +0000

    Add text README.md

commit b818b7e6f9d845e435701a08910f81d4165823d8
Author: vabischevich <vabischevich@telsgloba.com>
Date:   Thu Aug 3 08:37:35 2023 +0000

    Create README.md
```
### 7. Удалить последние 3 коммита с помощью git reset.
```bash
test@test:~/mikalai-vabishchevich$ git reset 9eb5799
test@test:~/mikalai-vabishchevich$ git log -n 3
commit 9eb579930daece3ca96caf69deebe671a231cf4e (HEAD -> main, origin/main, origin/HEAD)
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Aug 3 10:14:48 2023 +0300

    Update Readme.md

commit 27967638cd1f80ab76835d039dbfc39ccb91733a
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Aug 3 08:27:38 2023 +0300

    add

commit f19fd5edf74f88e9707c988be44cf8ee3b2156ce
Merge: 0b053f0 edbe0ce
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Aug 3 08:13:02 2023 +0300

    Merge branch 'main' of https://github.com/tms-dos17-onl/mikalai-vabishchevich

```
### 8. Вернуть коммит, где добавляется пустой файл README.md. Для этого найти ID коммита в git reflog, а затем сделать cherry-pick.
```bash
test@test:~/mikalai-vabishchevich$ git cherry-pick b818b7e
[main b349ab7] Create README.md
 Date: Thu Aug 3 08:37:35 2023 +0000
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 README.md

```
### 9. Удалить последний коммит с помощью git reset.

```bash
test@test:~/mikalai-vabishchevich$ b349ab7
HEAD is now at b349ab7 Create README.md
```

### 10. Переключиться на ветку main или master. Если ветка называется master, то переименовать её в main.
```bash

```
### 11. Скопировать файл https://github.com/tms-dos17-onl/_sandbox/blob/main/.github/workflows/validate-shell.yaml, положить его по такому же относительному пути в репозиторий. Создать коммит и запушить его в удаленный репозиторий.
```bash

test@test:~/mikalai-vabishchevich$ git commit -m "git add validate-shell.yaml"
[main 5e1de16] git add validate-shell.yaml
 1 file changed, 24 insertions(+)
 create mode 100644 .github/workflows/validate-shell.yaml

 Admin@DESKTOP-SDPV7KD MINGW64 /d/devops_curs/mikalai-vabishchevich (main)
$ ls -la ./.github/workflows/
total 1
drwxr-xr-x 1 Admin 197121   0 авг  3 01:11 ./
drwxr-xr-x 1 Admin 197121   0 авг  3 01:11 ../
-rw-r--r-- 1 Admin 197121 493 авг  3 01:11 validate-shell.yaml
```
### 12. Создать из ветки main ветку develop. Переключиться на неё и создать README.md в корне репозитория. Написать в этом файле какие инструменты DevOps вам знакомы и с какими вы бы хотели познакомиться больше всего (2-3 пункта).
```bash
test@test:~/mikalai-vabishchevich$ git branch develop
test@test:~/mikalai-vabishchevich$ git branch --list
  develop
* main

test@test:~/mikalai-vabishchevich$ git branch --list
* develop
  main
test@test:~/mikalai-vabishchevich$ echo -e "Ansible\nDoker\nAWS\n" > README.md
test@test:~/mikalai-vabishchevich$ git add README.md
test@test:~/mikalai-vabishchevich$ git commit -m "Creade README.md task 12"
[develop cce7cb1] Creade README.md task 12
 1 file changed, 4 insertions(+)
```
### 13. Создать из ветки main ветку support и создать там файлик LICENSE с содержимым https://www.apache.org/licenses/LICENSE-2.0.txt. Создать коммит. Вывести последниe 3 коммитa.
```bash
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$  git branch support
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$  git checkout support
Switched to branch 'support'
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ curl -ko LICENSE https://www.apache.org/licenses/LICENSE-2.0.txt
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11358  100 11358    0     0  58742      0 --:--:-- --:--:-- --:--:-- 58849

test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$  git add LICENSE
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ git commit
[main 390cc0f] Merge branch 'support'

```
### 14. Переключиться обратно на ветку main и создать там файлик LICENSE с содержимым https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt. Создать коммит. Вывести последниe 3 коммитa.
```bash
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ git checkout main
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ curl -ko LICENSE https://raw.githubusercontent.com/git/git-scm.com/main/MIT-LICENSE.txt
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1072  100  1072    0     0   3239      0 --:--:-- --:--:-- --:--:--  3238
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ git commit -am "Сorrecting LICENSE (mail)"
[main c835481] Сorrecting LICENSE (mail)
 1 file changed, 4 deletions(-)
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ git log -n 3
commit 63058a18f6a04a4de3bdd84f9c3dd0ddeed25558 (HEAD -> main, origin/main, origin/HEAD)
Author: Mikalai <mikalai@test.test>
Date:   Fri Aug 4 18:55:17 2023 +0300

    Create HW9

commit eb29e679286d6674322b5adfe2e24a8658d53636
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Aug 3 16:58:23 2023 +0300

    Create README.md

commit cc4982278a46bfcb179e434484dbd7cf18ab092c
Author: kolai23 <q3181309@gmail.com>
Date:   Thu Aug 3 14:42:33 2023 +0300

    Update README.md

```
### 15. Сделать merge ветки support в ветку main и решить конфликты путем выбора содержимого только одной лицензии.
```bash
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ git merge support
Auto-merging LICENSE
CONFLICT (content): Merge conflict in LICENSE
Automatic merge failed; fix conflicts and then commit the result.
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ git add LICENSE
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:
        modified:   LICENSE
test@DESKTOP-SDPV7KD:/mnt/d/devops_curs/mikalai-vabishchevich$ git commit

```
### 16. Переключиться на ветку develop и сделать rebase относительно ветки main.
```bash
test@test:~/mikalai-vabishchevich$ git checkout develop
Switched to branch 'develop'
test@test:~/mikalai-vabishchevich$ git rebase main
Successfully rebased and updated refs/heads/develop.
test@test:~/mikalai-vabishchevich$ git merge develop
Updating 38271ba..4466b92
Fast-forward
 README.md | 4 ++++
 1 file changed, 4 insertions(+)
 
```
### 17. Вывести историю последних 10 коммитов в виде графа с помощью команды git log -10 --oneline --graph.
```bash
* 4466b92 (HEAD -> develop) Creade README.md task 12
*   38271ba (origin/main, origin/HEAD, main) Create MERGE Support->Main
|\
| * e130cc1 (support) Create file LICENSE
* | 7ace4e4 Create file LICENSE (main)
|/
* 45b402f Add workflows file validate-shell.yaml
* b349ab7 Create README.md
* 9eb5799 Update Readme.md
* 2796763 add
*   f19fd5e Merge branch 'main' of https://github.com/tms-dos17-onl/mikalai-vabishchevich
|\
| * edbe0ce Update Readme.md

```
### 18. Зайти в свой репозиторий на GitHub и создать Pull Request из ветки develop в ветку main.
```bash
Merge pull request #13 from tms-dos17-onl/develop
Pull request merge
kolai23pushed 4 commits to main • 38271ba…0d3a7b2 • 1 minute ago

```

