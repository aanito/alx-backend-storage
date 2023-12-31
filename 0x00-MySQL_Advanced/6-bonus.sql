-- Write a SQL script that creates a stored procedure AddBonus that adds a new correction
DELIMITER //
CREATE PROCEDURE AddBonus(
	IN user_id INT,
	IN project_name VARCHAR(255),
	IN score FLOAT
)
BEGIN
	INSERT INTO projects(name)
	SELECT project_name
	WHERE project_name NOT in (SELECT name from projects);
	INSERT INTO corrections (user_id, project_id, score)
	VALUES (user_id, (SELECT id FROM projects WHERE name=project_name), score);
END//
DELIMITER ;

