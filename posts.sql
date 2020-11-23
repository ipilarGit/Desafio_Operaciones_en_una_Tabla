-- Desafio - Operaciones en una Tabla

-- PARTE 1
--Req.1. Crear una base de datos con nombre "Posts"
postgres=# CREATE DATABASE posts;
CREATE DATABASE
postgres=# \c posts
Ahora está conectado a la base de datos «posts» con el usuario «postgres».
posts=#

--Req.2. Crear una tabla "post", con los atributos, id, nombre de usuario, fecha de creacion, contenido y descripcion
CREATE TABLE post(id INT, nombre_usuario VARCHAR(25), fecha_creacion DATE,contenido VARCHAR(30), descripcion VARCHAR(30), PRIMARY KEY(id));

--Req.3. Insertar 3 post, dos para el usuario "Pamela" y uno para "Carlos"
INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion) values(1,'Pamela','2020-11-20','pruebas','notas de los desafios');
INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion) values(2,'Pamela','2020-11-21','tareas','notas de las tareas');

posts=# select * from post;
 id | nombre_usuario | fecha_creacion | contenido |      descripcion
----+----------------+----------------+-----------+-----------------------
  1 | Pamela         | 2020-11-20     | pruebas   | notas de los desafios
  2 | Pamela         | 2020-11-21     | tareas    | notas de las tareas
(2 filas)

INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion) values(3,'Carlos','2020-10-12','noticias','informacion de noticias');
 posts=# select * from post;
 id | nombre_usuario | fecha_creacion | contenido |       descripcion
----+----------------+----------------+-----------+-------------------------
  1 | Pamela         | 2020-11-20     | pruebas   | notas de los desafios
  2 | Pamela         | 2020-11-21     | tareas    | notas de las tareas
  3 | Carlos         | 2020-10-12     | noticias  | informacion de noticias
(3 filas)

--Req.4. Modificar la tabla post, agregando la columna titulo
ALTER TABLE post ADD titulo VARCHAR(20);

ALTER TABLE
posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido |       descripcion       | titulo
----+----------------+----------------+-----------+-------------------------+--------
  1 | Pamela         | 2020-11-20     | pruebas   | notas de los desafios   |
  2 | Pamela         | 2020-11-21     | tareas    | notas de las tareas     |
  3 | Carlos         | 2020-10-12     | noticias  | informacion de noticias |
(3 filas)


--Req.5. Agregar titulo a las publicaciones ya ingresadas
posts=# UPDATE post SET titulo='Pruebas DesafioLatam' WHERE id=1;
UPDATE 1
posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido |       descripcion       |        titulo
----+----------------+----------------+-----------+-------------------------+----------------------
  2 | Pamela         | 2020-11-21     | tareas    | notas de las tareas     |
  3 | Carlos         | 2020-10-12     | noticias  | informacion de noticias |
  1 | Pamela         | 2020-11-20     | pruebas   | notas de los desafios   | Pruebas DesafioLatam
(3 filas)


posts=# UPDATE post SET titulo='Tareas DesafioLatam' WHERE id=2;
UPDATE 1
posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido |       descripcion       |        titulo
----+----------------+----------------+-----------+-------------------------+----------------------
  3 | Carlos         | 2020-10-12     | noticias  | informacion de noticias |
  1 | Pamela         | 2020-11-20     | pruebas   | notas de los desafios   | Pruebas DesafioLatam
  2 | Pamela         | 2020-11-21     | tareas    | notas de las tareas     | Tareas DesafioLatam
(3 filas)


posts=# UPDATE post SET titulo='Noticias Desafio' WHERE id=3;
UPDATE 1
posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido |       descripcion       |        titulo
----+----------------+----------------+-----------+-------------------------+----------------------
  1 | Pamela         | 2020-11-20     | pruebas   | notas de los desafios   | Pruebas DesafioLatam
  2 | Pamela         | 2020-11-21     | tareas    | notas de las tareas     | Tareas DesafioLatam
  3 | Carlos         | 2020-10-12     | noticias  | informacion de noticias | Noticias Desafio
(3 filas)

--Req.6. Insertar dos post para el usuario "Pedro"
posts=# INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion) values(4,'Pedro','2020-11-14','lecturas','informacion de material');
INSERT 0 1
posts=# INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion) values(5,'Pedro','2020-11-15','recreacion','informacion de recreacion');
INSERT 0 1
posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido  |        descripcion        |        titulo
----+----------------+----------------+------------+---------------------------+----------------------
  1 | Pamela         | 2020-11-20     | pruebas    | notas de los desafios     | Pruebas DesafioLatam
  2 | Pamela         | 2020-11-21     | tareas     | notas de las tareas       | Tareas DesafioLatam
  3 | Carlos         | 2020-10-12     | noticias   | informacion de noticias   | Noticias Desafio
  4 | Pedro          | 2020-11-14     | lecturas   | informacion de material   |
  5 | Pedro          | 2020-11-15     | recreacion | informacion de recreacion |
(5 filas)

posts=# UPDATE post SET titulo='Lecturas' WHERE id=4;
UPDATE 1
posts=# UPDATE post SET titulo='Actividad recreativa' WHERE id=5;
UPDATE 1
posts=#

posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido  |        descripcion        |        titulo
----+----------------+----------------+------------+---------------------------+----------------------
  1 | Pamela         | 2020-11-20     | pruebas    | notas de los desafios     | Pruebas DesafioLatam
  2 | Pamela         | 2020-11-21     | tareas     | notas de las tareas       | Tareas DesafioLatam
  3 | Carlos         | 2020-10-12     | noticias   | informacion de noticias   | Noticias Desafio
  4 | Pedro          | 2020-11-14     | lecturas   | informacion de material   | Lecturas
  5 | Pedro          | 2020-11-15     | recreacion | informacion de recreacion | Actividad recreativa
(5 filas)

--Req.7. Eliminar el post de "Carlos"

posts=# DELETE FROM post WHERE id=3;
DELETE 1
posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido  |        descripcion        |        titulo
----+----------------+----------------+------------+---------------------------+----------------------
  1 | Pamela         | 2020-11-20     | pruebas    | notas de los desafios     | Pruebas DesafioLatam
  2 | Pamela         | 2020-11-21     | tareas     | notas de las tareas       | Tareas DesafioLatam
  4 | Pedro          | 2020-11-14     | lecturas   | informacion de material   | Lecturas
  5 | Pedro          | 2020-11-15     | recreacion | informacion de recreacion | Actividad recreativa
(4 filas)


--Req.8. Ingresar un nuevo post para el usuario "Carlos"

posts=# INSERT INTO post(id,nombre_usuario,fecha_creacion,contenido,descripcion,titulo) values(6,'Carlos','2020-11-10','contenido1','informacion y contenido','contenido');
INSERT 0 1
posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido  |        descripcion        |        titulo
----+----------------+----------------+------------+---------------------------+----------------------
  1 | Pamela         | 2020-11-20     | pruebas    | notas de los desafios     | Pruebas DesafioLatam
  2 | Pamela         | 2020-11-21     | tareas     | notas de las tareas       | Tareas DesafioLatam
  4 | Pedro          | 2020-11-14     | lecturas   | informacion de material   | Lecturas
  5 | Pedro          | 2020-11-15     | recreacion | informacion de recreacion | Actividad recreativa
  6 | Carlos         | 2020-11-10     | contenido1 | informacion y contenido   | contenido
(5 filas)


-- PARTE 2

--Req. 1. Crear una nueva tabla llamada "comentarios" con los atributos id, fecha, hora de creacion y contenido, que se relaciones con la tabla post

 CREATE TABLE comentarios (id INT, fecha DATE, hora_creacion TIME, contenido VARCHAR(30), FOREIGN KEY(id) REFERENCES post(id));

 --Req.2- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"

INSERT INTO comentarios(id,fecha,hora_creacion, contenido) VALUES(1,'2020-11-21','10:00:01','este es un comentario');
INSERT INTO comentarios(id,fecha,hora_creacion, contenido) VALUES(1,'2020-11-21','11:00:01','otro comentario para Pamela');

posts=# select * from comentarios;
 id |   fecha    | hora_creacion |          contenido
----+------------+---------------+-----------------------------
  1 | 2020-11-21 | 10:00:01      | este es un comentario
  1 | 2020-11-21 | 11:00:01      | otro comentario para Pamela
(2 filas)

posts=# INSERT INTO comentarios(id,fecha,hora_creacion, contenido) VALUES(6,'2020-11-10','10:00:01','este el el primer comentario');
INSERT 0 1
posts=# INSERT INTO comentarios(id,fecha,hora_creacion, contenido) VALUES(6,'2020-11-11','11:05:01','este el el segundo comentario');
INSERT 0 1
posts=# INSERT INTO comentarios(id,fecha,hora_creacion, contenido) VALUES(6,'2020-11-11','17:00:10','este es el tercer comentario');
INSERT 0 1
posts=# INSERT INTO comentarios(id,fecha,hora_creacion, contenido) VALUES(6,'2020-11-12','20:00:20','este es el cuarto comentario');
INSERT 0 1

posts=# SELECT * FROM comentarios;
 id |   fecha    | hora_creacion |          contenido
----+------------+---------------+-----------------------------
  1 | 2020-11-21 | 10:00:01      | este es un comentario
  1 | 2020-11-21 | 11:00:01      | otro comentario para Pamela
  6 | 2020-11-10 | 10:00:01      | este el el primer comentario
  6 | 2020-11-11 | 11:05:01      | este el el segundo comentario
  6 | 2020-11-11 | 17:00:10      | este es el tercer comentario
  6 | 2020-11-12 | 20:00:20      | este es el cuarto comentario


 --Req.3. Crear un nuevo post para "Margarita"

INSERT INTO post VALUES(7,'Margarita','2020-11-22','estudios extranjero','Becas para los estudiantes','Estudios Extranjeros');
INSERT 0 1

posts=# SELECT * FROM post;
 id | nombre_usuario | fecha_creacion | contenido           |        descripcion         |        titulo
----+----------------+----------------+------------+---------------------------+-------------------------------
  1 | Pamela         | 2020-11-20     | pruebas             | notas de los desafios      | Pruebas DesafioLatam
  2 | Pamela         | 2020-11-21     | tareas              | notas de las tareas        | Tareas DesafioLatam
  4 | Pedro          | 2020-11-14     | lecturas            | informacion de material    | Lecturas
  5 | Pedro          | 2020-11-15     | recreacion          | informacion de recreacion  | Actividad recreativa
  6 | Carlos         | 2020-11-10     | contenido1          | informacion y contenido    | contenido
  7 | Margarita      | 2020-11-22     | estudios extranjero | Becas para los estudiantes | Estudios Extranjeros

 --Req.4. Ingresar 5 comentarios para el post de "Margarita"

posts=# INSERT INTO comentarios VALUES(7,'2020-11-22','10:00:00','Seria una gran oportunidad');
INSERT 0 1
posts=# INSERT INTO comentarios VALUES(7,'2020-11-22','10:10:30','Donde son las postulaciones');
INSERT 0 1
posts=# INSERT INTO comentarios VALUES(7,'2020-11-22','11:20:23','cuales son los requisitos');
INSERT 0 1
posts=# INSERT INTO comentarios VALUES(7,'2020-11-22','11:27:14','Soy extranjera puedo postular');
INSERT 0 1
posts=# INSERT INTO comentarios VALUES(7,'2020-11-22','12:00:28','Como puedo ser parte Desafio');
INSERT 0 1

 id |   fecha    | hora_creacion |          contenido
----+------------+---------------+-----------------------------
  1 | 2020-11-21 | 10:00:01      | este es un comentario
  1 | 2020-11-21 | 11:00:01      | otro comentario para Pamela
  6 | 2020-11-10 | 10:00:01      | este el el primer comentario
  6 | 2020-11-10 | 10:00:01      | este el el segundo comentario
  6 | 2020-11-10 | 10:00:01      | este es el tercer comentario
  6 | 2020-11-10 | 10:00:01      | este es el cuarto comentario
  7 | 2020-11-22 | 10:00:00      | Seria una gran oportunidad
  7 | 2020-11-22 | 10:10:30      | Donde son las postulaciones
  7 | 2020-11-22 | 11:20:23      | cuales son los requisitos
  7 | 2020-11-22 | 11:27:14      | Soy extranjera puedo postular
  7 | 2020-11-22 | 12:00:28      | Como puedo ser parte Desafio

