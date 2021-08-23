--Tabela de sistema
select * from systypes;

-- view de sistema 
select * from sys.types;

create database uddt;
go
use uddt;

-- Criando tipos de dados personalizados(UDDT)
CREATE TYPE NomePessoa
FROM VARCHAR(50) NOT NULL;

CREATE TYPE ValorMonetario
FROM DECIMAL (10,2) NOT NULL; 

CREATE TYPE OpcaoSN
FROM CHAR(1) NOT NULL;

CREATE TYPE DataRegra
FROM DATE NULL;

-- VISUALIZANDO SOMENTE OS TIPOS PERSONALIZADOS
SELECT * FROM SYSTYPES WHERE uid = 1;

-- CRIANDO REGRAS DE VALIDAÇÃO
GO
CREATE RULE r_ValorMonetario AS @valor >= 0;
GO
CREATE RULE r_OpcaoSN AS @sn IN('s','n');
GO
CREATE RULE r_DataRegra AS @data BETWEEN '2014-1-1' and GETDATE();
GO

-- VISUALIZANDO REGRAS CRIADAS 
SELECT * FROM SYSOBJECTS WHERE xtype = 'R';

-- ASSOCIANDO AS REGRAS AOS TIPOS CRIADOS
EXEC sp_bindrule 'r_ValorMonetario ','ValorMonetario'; 
EXEC sp_bindrule 'r_OpcaoSN ','OpcaoSN'; 
EXEC sp_bindrule 'r_DataRegra','DataRegra'; 

--CRIANDO DEFAULTS
GO 
CREATE DEFAULT def_SN AS 's';
GO 
CREATE DEFAULT def_data as GETDATE();

--VISUALIZANDO DEFAULTS
SELECT * FROM SYSOBJECTS WHERE xtype = 'D';

--ASSOCIANDO OS DEFAUTS AO TIPOS CRIADOS
EXEC sp_bindefault'def_SN','OpcaoSN';
EXEC sp_bindefault'def_Data','DataRegra';

--Criando sequencial(Identity Personalizado)
CREATE SEQUENCE seq_registro
	START WITH 1000
	INCREMENT BY 10
	MINVALUE 10
	MAXVALUE 1000000
	CYCLE

-- VISUALIZANDO A SEQUENCIA CRIADA
SELECT * FROM SYS.sequences;

--UTILIZANDO UDDT E SEQUENCIA CRIADA
CREATE TABLE Clientes
(
	id				int		primary key,
	NomeCliente		NomePessoa,
	StatusAtivo		OpcaoSN,
	CadastroCliente	Dataregra
);

CREATE TABLE Fornecedores
(
	id				int		primary key,
	NomeFornecedor		NomePessoa,
	StatusAtivo		OpcaoSN,
	CadastroFornec	Dataregra
);

--Inserindo dados
INSERT INTO Clientes(id,NomeCliente,StatusAtivo,CadastroCliente)
VALUES
(NEXT VALUE FOR DBO.seq_registro,'Helio','s',GETDATE());

--Testando Defaults
INSERT INTO Clientes(id,NomeCliente)
VALUES
(NEXT VALUE FOR DBO.seq_registro,'Emmanuel');

SELECT * FROM Clientes;

--Criando Sinonimos
CREATE SYNONYM cli FOR DBO.Clientes;

--Visualizando sinonimos criados
SELECT * FROM SYS.synonyms;

--Utilizando um Sinonimo
SELECT * FROM cli;