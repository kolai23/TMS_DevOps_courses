### 1. Установить MySQL на VM
```bash
vagrant@ubuntu-xenial:~$ sudo apt update
vagrant@ubuntu-xenial:~$ sudo apt install mysql-server
vagrant@ubuntu-xenial:~$ sudo systemctl start mysql.service
vagrant@ubuntu-xenial:~$ sudo mysql
```
### 2. (**) Настроить Multi-Primary репликацию для MySQL на 2 VM согласно инструкции.

### 3. Создать схему БД clinic и наполнить её данными используя скрипты из https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture18/mysql/initdb.d/data.
```
vagrant@ubuntu-focal:~$ sudo mysql -u root -p < schema.sql
Enter password:
vagrant@ubuntu-focal:~$ sudo mysql -u root -p < data.sql
Enter password:
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| clinic             |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test1_db           |
| test_db            |
+--------------------+
7 rows in set (0.01 sec)

```


### 4. Создать бэкап базы данных clinic.
```
mysql> select * from Doctor;
+----+----------------+--------------------+---------------+-----------------------------+------------+
| id | FirstName      | LastName           | Telephone     | Email                       | BirthDate  |
+----+----------------+--------------------+---------------+-----------------------------+------------+
|  1 | Андрей         | Быков              | +37529XXXXXXX | andrey.bykov@clinic.com     | 1966-06-22 |
|  2 | Иван           | Купитман           | +37529XXXXXXX | ivan.kupitman@clinic.com    | 1963-03-13 |
|  3 | Дмитрий        | Левин              | +37529XXXXXXX | dmitry.levin@clinic.com     | 1986-01-15 |
|  4 | Варвара        | Черноус            | +37529XXXXXXX | varvara.chernous@clinic.com | 1988-04-14 |
|  5 | Глеб           | Романенко          | +37529XXXXXXX | gleb.romanenko@clinic.com   | 1984-09-19 |
|  6 | Семён          | Лобанов            | +37529XXXXXXX | semen.lobanoff@clinic.com   | 1983-11-22 |
+----+----------------+--------------------+---------------+-----------------------------+------------+
6 rows in set (0.00 sec)




```
### 5. Написать следующие SQL запросы:
- Вывести всех врачей, работающих в терапевтическом отделении.
- Вывести в каких отделениях побывал каждый пациент.
- Обновить дату приёма для пациента Ивана Иванова на 2022-02-09.
- Удалить врача Андрея Быкова и все его приёмы.
- Добавить нового врача Фила Ричардса и новую пациентку Василису Васильеву и записать её к Филу Ричардсу на приём на 2022-02-14.

```bash
mysql> select D.LastName, D.FirstName, Dep.Name, J.Title FROM Job as J, Doctor as D, Department as Dep WHERE J.Department_id=Dep.id and D.id=J.Doctor_id and Dep.Name='Терапевтический';
+--------------------+----------------+--------------------------------+----------------------------------+
| LastName           | FirstName      | Name                           | Title                            |
+--------------------+----------------+--------------------------------+----------------------------------+
| Быков              | Андрей         | Терапевтический                | Заведующий                       |
| Черноус            | Варвара        | Терапевтический                | Врач 2-й категории               |
| Романенко          | Глеб           | Терапевтический                | Врач 2-й категории               |
| Лобанов            | Семён          | Терапевтический                | Врач 2-й категории               |
+--------------------+----------------+--------------------------------+----------------------------------+
4 rows in set (0.01 sec)


mysql> select P.LastName, P.FirstName,A.Date,R.Number,D.Name FROM Patient as P, Appointment as A, Room as R, Department as D WHERE P.id=A.Patient_id and A.Room_id=R.id and R.Department_id=D.id;
+------------------+------------+---------------------+--------+---------------------------------------------+
| LastName         | FirstName  | Date                | Number | Name                                        |
+------------------+------------+---------------------+--------+---------------------------------------------+
| Сидоров          | Сидор      | 2022-01-09 00:00:00 |    101 | Терапевтический                             |
| Семёнова         | Анна       | 2022-02-03 00:00:00 |    102 | Терапевтический                             |
| Попова           | Елена      | 2022-02-01 00:00:00 |    104 | Терапевтический                             |
| Иванов           | Иван       | 2022-01-09 00:00:00 |    201 | Кожно-венерологический                      |
| Петров           | Пётр       | 2022-01-08 00:00:00 |    202 | Кожно-венерологический                      |
| Петров           | Пётр       | 2022-01-09 00:00:00 |    202 | Кожно-венерологический                      |
+------------------+------------+---------------------+--------+---------------------------------------------+
6 rows in set (0.00 sec)


mysql> UPDATE Appointment SET Appointment.Date = '2022-02-09' WHERE Appointment.Patient_id IN ( SELECT Patient.id FROM Patient WHERE Patient.FirstName = 'Иван' AND Patient.LastName = 'Иванов');


mysql> select P.LastName, P.FirstName,A.Date,R.Number,D.Name FROM Patient as P, Appointment as A, Room as R, Department as D WHERE P.id=A.Patient_id and A.Room_id=R.id and R.Department_id=D.id and P.LastName='Иванов';
+--------------+-----------+---------------------+--------+---------------------------------------------+
| LastName     | FirstName | Date                | Number | Name                                        |
+--------------+-----------+---------------------+--------+---------------------------------------------+
| Иванов       | Иван      | 2022-02-09 00:00:00 |    201 | Кожно-венерологический                      |
+--------------+-----------+---------------------+--------+---------------------------------------------+
1 row in set (0.00 sec)


INSERT INTO Doctor 
VALUES (7, 'Фил', 'Ричардса', '+37529XXXXXXX', 'phill.richards@clinic.com', '1980-10-10');


INSERT INTO Patient
VALUES (7, 'Алабаев', 'Тимур', '1995-10-10', 'Тилимилитрямдия', '+37517XXXXXXX', 'timur.alabaev@exempl.com');


INSERT INTO Appointment 
VALUES (7, '2022-03-14', 6, 7, 5);

```

### 6. Восстановить базу данных clinic из бэкапа и проверить, что данные соответствуют состоянию базы данных до внесенных в предыдущем задании изменений.
```bash
vagrant@ubuntu-focal:~$ sudo mysqldump -uroot -pvagrant1234 clinic > clinic_dump01.sql

vagrant@ubuntu-focal:~$ sudo mysql -uroot -pvagrant1234 clinic < clinic_dump01.sql

vagrant@ubuntu-focal:~$ ll
total 60
drwxr-xr-x 4 vagrant vagrant 4096 Sep 29 14:17 ./
drwxr-xr-x 4 root    root    4096 Sep 28 14:58 ../
-rw------- 1 vagrant vagrant   58 Sep 28 14:58 .Xauthority
-rw-r--r-- 1 vagrant vagrant  220 Sep 22 21:57 .bash_logout
-rw-r--r-- 1 vagrant vagrant 3771 Sep 22 21:57 .bashrc
drwx------ 2 vagrant vagrant 4096 Sep 28 14:58 .cache/
-rw------- 1 vagrant vagrant   18 Sep 28 15:23 .mysql_history
-rw-r--r-- 1 vagrant vagrant  807 Sep 22 21:57 .profile
drwx------ 2 vagrant vagrant 4096 Sep 28 14:58 .ssh/
-rw-rw-r-- 1 vagrant vagrant 8651 Sep 29 14:17 clinic_dump01.sql
-rw-r--r-- 1 vagrant vagrant 4131 Sep 28 19:24 data.sql
-rw-r--r-- 1 vagrant vagrant 2141 Sep 28 19:24 schema.sql

```
### 7. Установить MongoDB
```bash
vagrant@ubuntu-focal:~$ wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
OK
vagrant@ubuntu-focal:~$  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse
vagrant@ubuntu-focal:~$ sudo apt-get update
vagrant@ubuntu-focal:~$ sudo apt-get install mongodb-org=4.4.8 mongodb-org-server=4.4.8 mongodb-org-shell=4.4.8 mongodb-org-mongos=4.4.8 mongodb-org-tools=4.4.8
vagrant@ubuntu-focal:~$ sudo systemctl status mongod.service
● mongod.service - MongoDB Database Server
     Loaded: loaded (/lib/systemd/system/mongod.service; disabled; vendor preset: enabled)
     Active: active (running) since Fri 2023-09-29 15:23:06 UTC; 9s ago
       Docs: https://docs.mongodb.org/manual
   Main PID: 2378 (mongod)
     Memory: 64.7M
     CGroup: /system.slice/mongod.service
             └─2378 /usr/bin/mongod --config /etc/mongod.conf

Sep 29 15:23:06 ubuntu-focal systemd[1]: Started MongoDB Database Server.

```

### 8. Создать БД clinic и наполнить её данными используя скрипты из https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture18/mongo/initdb.d.
```bash
vagrant@ubuntu-focal:~$ mongo schema.js
vagrant@ubuntu-focal:~$ mongo data.js
```


### 9. Написать выборочно 3 запроса из задания 5 для MongoDB используя mongosh команды.
```bash
Обновить дату приёма для пациента Ивана Иванова на 2022-02-09

clinic> patient = db.patient.findOne({ "FirstName": "Иван", "LastName": "Иванов" })
{
  _id: ObjectId("64f5d10260b9f39b76911b25"),
  id: 1,
  Email: 'ivan.ivanov@example.com',
  Address: 'Тилимилитрямдия',
  LastName: 'Иванов',
  BirthDate: '1991-01-01',
  FirstName: 'Иван',
  Telephone: '+37517XXXXXXX'
}
clinic> db.appointment.updateOne({"Patient_id": patient.id}, {$set: {Date : "2022-02-09 00:00:00.000000"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

Удалить врача Андрея Быкова и все его приёмы.

clinic> doctor = db.doctor.findOneAndDelete({ "LastName": "Быков", "FirstName": "Андрей" })
{
  _id: ObjectId("64f5d10260b9f39b76911b2a"),
  id: 1,
  Email: 'andrey.bykov@clinic.com',
  LastName: 'Быков',
  BirthDate: '1966-06-22',
  FirstName: 'Андрей',
  Telephone: '+37529XXXXXXX'
}
clinic> db.appointment.deleteMany({"Doctor_id": doctor.id})

Добавить нового врача Фила Ричардса и новую пациентку Василису Васильеву и записать её к Филу Ричардсу на приём на 2022-02-14.

clinic> doctor = db.doctor.insertOne({ "id": 7, "Email": "phill.richards@clinic.com", "LastName": "Ричардс", "BirthDate": "1991-05-05", "FirstName": "Фил", "Telephone": "+37529XXXXXXX" })
{
  acknowledged: true,
  insertedId: ObjectId("64f88be6d0178f5698d31b6a")
}
patient = db.patient.insertOne({ "id": 6, "Email": "vasilisa.vasileva@example.com", "Address": "Тилимилитрямдия", "LastName": "Васильева", "BirthDate": "1995-05-05", "FirstName": "Василиса", "Telephone": "+37517XXXXXXX" })
{
  acknowledged: true,
  insertedId: ObjectId("64f88cfad0178f5698d31b6b")
}
clinic> db.appointment.insertOne({ "id": 6, "Date": "2022-03-14 00:00:00.000000", "Room_id": 5, "Doctor_id": doctor.id, "Patient_id": patient.id })
{
  acknowledged: true,
  insertedId: ObjectId("64f88d72d0178f5698d31b6c")
}

```