Исходные данные: есть 2 таблицы user и level с соответствующим набором полей. Структура таблиц и значения полей указаны ниже				"
CREATE TABLE "user" (
   id serial not null,
   user_name varchar(50) not null,
   level_id integer NOT null,
   skill integer NOT null,
   PRIMARY KEY (id)
   );

INSERT INTO "user" (user_name, level_id, skill)  
VALUES ('Anton', 1, 900000), ('Denis', 3, 4000), ('Petr', 2, 50000), ('Andrey', 4, 20), ('Olga', 1, 600000), ('Anna', 1, 1600000)

CREATE TABLE "level" (
   id serial not null,
   level_name varchar(50) not null,
   PRIMARY KEY (id)
   );
   
INSERT INTO "level" (level_name)  
VALUES ('admin'), ('power_user'), ('user'), ('guest')

1. Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а						
SELECT user_name FROM "user"
WHERE level_id = 1
AND skill > 799000
AND user_name LIKE '%a%' ;								
2. Удалить всех пользователей, у которых skill меньше 100000								
"DELETE FROM ""user""
WHERE skill < 100000;"								
3. Вывести все данные из таблицы user в порядке убывания по полю skill 								
"SELECT * FROM ""user""
ORDER BY (skill) DESC;"								
4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10								
"INSERT INTO ""user"" (user_name, level_id, skill)  
VALUES ('Oleg', 4, 10)"								
5. Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000								
"UPDATE  ""user""
SET skill = 2000000
WHERE level_id < 2;"								
6. Выбрать user_name всех пользователей уровня admin используя подзапрос								
"SELECT user_name
FROM ""user""
WHERE level_id = (SELECT id from ""level"" WHERE level_name = 'admin');"								
7. Выбрать user_name всех пользователей уровня admin используя join								
"SELECT user_name
FROM ""user"" AS i
INNER JOIN ""level"" AS b ON i.level_id = b.id WHERE b.Level_name = 'admin';
