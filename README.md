# db_course_computer_practice_2 (КП2. Варіант 15. Кононенко Павло)
Комп'ютерний практикум - 2 з дисципліни Бази Даних. Кононенко Павло КМ-81 (Варіант 15)

Для запуску міграції, необхідно ввести команду:

```flyway migrate -url=<url> -user=<user> -password=<password>```

Для ввімкнення режиму DEBUG, треба додати ```-X```:

```flyway migrate -X -url=<url> -user=<user> -password=<password>```

Де:

```<url>``` - шлях до БД (у випадку PostgreSQL: ```jdbc:postgresql://<host>:<port>/<dbname>```);

```<host>``` - хост;

```<port>``` - порт (ціле додатнє число);

```<dbname>``` - назва БД, до якої підключаються;

```<user>``` - ім'я користувача БД;

```<password>``` - пароль для доступу до БД.
