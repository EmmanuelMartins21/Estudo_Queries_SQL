
-- Query da fun��o built-in (data e hora)
/* Exemplos de fun��es para manipuar data e hora

	GETDATE = Retornar a data e hora
	DAY = Retornar o dia de uma data
	MONTH = Retornar o m�s de uma data
	YEAR = Retornar o ano de uma data
	EOMONTH = Retornar o ultimo m�s
	DATEFROMPARTS = Retornar uma data a partir de parametros
	DATEDIFF = Retornar a diferen�a entre duas datas
	DATEADD = Adicionar um valor em uma data
	DATENAME = Retornar o nome do dia da semana ou m�s
*/
select GETDATE() as [Data e Hora];
use TREINO;

select 
	nomeCliente, 
	day(dataPedido) as [Dia]
from MAROCA2;

--Atualizar as datas 
update MAROCA2
set dataPedido = GETDATE();

select DATENAME(DD,dataPedido) as [Dia da semana] from MAROCA2;

-- cadastrando novos dados (deixar com padr�o)
insert into MAROCA2(nomeCliente,dataPedido,valor) values ('Patrick',GETDATE(),22.50);

select * from MAROCA2;

select DATEDIFF(day,'1999/08/07',getdate()) as [Dias vividos];

--Comando para alterar a linguagem do banco temporariamente(comando de se��o)
set language 'brazilian';