USE SP_MED_GROUP;
GO

---DQL mostrar todas as tabelas

SELECT * FROM clinica;
GO

SELECT * FROM tipoUsuario;
GO

SELECT * FROM situacao;
GO

SELECT * FROM especialidade;
GO

SELECT * FROM usuario;
GO

SELECT * FROM medico;
GO

SELECT * FROM paciente;
GO

SELECT * FROM consulta;
GO


--Realizar a contagem de quantos usuarios existem no banco de dados
SELECT COUNT (idUsuario) AS [Total Usu�rios]
FROM usuario;
GO


--Converter a data de nascimento do paciente para o formato (mm-dd-yyyy) na exibi��o
SELECT CONVERT(VARCHAR,dataNascimento,110) AS [Data de Nascimento (month-day-year)]
FROM paciente;
GO


--Criar uma fun��o para retornar a quantidade de m�dicos de uma determinada especialidade
CREATE FUNCTION medicoEspecialidade(@especialidade VARCHAR(75))
RETURNS TABLE
AS 
RETURN
( 
   SELECT COUNT (nomeEspecialidade) AS [Total M�dicos]
   FROM medico
   INNER JOIN especialidade
   ON medico.idEspecialidade = especialidade.idEspecialidade
   WHERE especialidade.idEspecialidade = 17
)
GO

--Criar uma fun��o para que retorne a idade do usu�rio(paciente, pois s� ele possui data de nascimento) a partir de uma determinada stored procedure

CREATE PROCEDURE pacienteIdade @usuario VARCHAR(50)
AS
BEGIN
SELECT nomeUsuario, DATEDIFF(YEAR,dataNascimento,GETDATE())
AS Idade
FROM paciente U
INNER JOIN usuario P
ON P.idUsuario = U.idUsuario
WHERE nomeUsuario = @usuario
END
GO

EXEC pacienteIdade 'Henrique'