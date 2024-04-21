SELECT IF(EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'gestor'), 'exists', 'not_exists') AS db_status;
drop database if exists gestor;
CREATE DATABASE IF NOT EXISTS gestor;
USE gestor;


CREATE TABLE categorias(
    idcategoria int PRIMARY KEY AUTO_INCREMENT, 
    categoria VARCHAR(150)  
);


CREATE TABLE Tutorial(
    idTutorial INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(150),  
    url TEXT, 
    prioridad INT,  
    estado varchar(150),  
    idcategoria INT,  
    FOREIGN KEY (idcategoria) REFERENCES categorias(idcategoria)
);
 INSERT INTO Categorias(categoria) VALUES
	('Logica de programacion'),
    ('Flutter'),
    ('Node.js'),
    ('python'),
    ('C++');

DELIMITER //

CREATE PROCEDURE NuevoTutorial(
    IN p_nombre VARCHAR(150),
    IN p_url TEXT,
    IN p_estado VARCHAR(150),
	IN p_prioridad INT,
    IN p_idcategoria INT
)

BEGIN
    INSERT INTO Tutorial(nombre, url, estado, prioridad, idcategoria) 
    VALUES(p_nombre, p_url, p_estado, p_prioridad, p_idcategoria);
END //

DELIMITER ;