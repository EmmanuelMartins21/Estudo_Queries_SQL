-- CROSS APPLY correlação entre consultas
/* 
	Select * from tabela JOIN
	cross apply
	Select * from tabela2 
*/
use TREINO;
select
	nomeCliente,
	valor
from MAROCA2 as M inner join PlenaContab as P
on 