USE TREINO


-- view indexada
GO 
CREATE VIEW vw_ConsultaSimples
WITH SCHEMABINDING
AS
	SELECT 
		nomeCliente,dataPedido,valor
	FROM dbo.MAROCA2;
GO --Obrigatorio apenas se o script for rodado em lote

CREATE UNIQUE CLUSTERED INDEX IX_ConsultaSimples
ON vw_ConsultaSimples(nomeCliente,dataPedido)

SELECT * FROM vw_ConsultaSimples
WHERE nomeCliente LIKE 'E%'; -- Retorna os clientes cujo  o nome começa com E

--Variaveis e controles de decisão
--DECLARE @NomeVariavel Tipo de Dado

DECLARE @VAL int, @val2 int, @decimal decimal(6,2);
SET @VAL = 10;
SET @val2 = 5;
SET @decimal = @VAL/@val2;
PRINT @decimal;

-- Exemplo de falha na conversão implicita de tipos
DECLARE @VAL4 int, @val3 int, @decimal2 decimal(6,2);
SET @VAL4 = 20;
SET @val3 = 3;
SET @decimal2 = CAST(@VAL4 AS decimal(6,2)) / @val3;
PRINT @decimal2;