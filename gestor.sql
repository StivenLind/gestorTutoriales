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

DELIMITER //

	CREATE PROCEDURE AgregarCategoria(
    IN p_Categoria VARCHAR(50)
)
	BEGIN
    DECLARE categoria_existente INT;

    -- Verificar si la categoría ya existe
    SELECT COUNT(*) INTO categoria_existente FROM Categorias WHERE Categoria = p_Categoria;

    -- Si la categoría no existe, la agregamos
    IF categoria_existente = 0 THEN
        INSERT INTO Categorias(Categoria) VALUES (p_Categoria);
        SELECT 'Categoría agregada exitosamente' AS mensaje;
    ELSE
        SELECT 'La categoría ya existe' AS mensaje;
    END IF;
END //	
DELIMITER ;
DELIMITER //

CREATE PROCEDURE EditarTutorial(
    IN p_idTutorial INT,
    IN p_nombre VARCHAR(150),
    IN p_url TEXT,
    IN p_estado VARCHAR(150),
    IN p_prioridad INT,
    IN p_idcategoria INT
)
BEGIN
    UPDATE Tutorial
    SET nombre = p_nombre,
        url = p_url,
        estado = p_estado,
        prioridad = p_prioridad,
        idcategoria = p_idcategoria
    WHERE idTutorial = p_idTutorial;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarTutorial(
    IN p_idTutorial INT
)
BEGIN
    DELETE FROM Tutorial WHERE idTutorial = p_idTutorial;
END //

DELIMITER ;
