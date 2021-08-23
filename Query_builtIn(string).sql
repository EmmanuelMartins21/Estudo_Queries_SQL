use TREINO
/* 
Exemplos de funções para manipular Strings: 
	LEN = Retorna o comprimento de um texto
	LEFT = Retorna os primeiros caracteres da esquerda
	RIGHT = Retorna os ultimos caracteres da direita
	REPLACE = Substitui um texto por outro
	CHARINDEX = Localizar a posição de um texto dentro de outro
	SUBSTRING = Retorna parte de um texto
	RTRIM = Remover espaços à direita de um texto
	LTRIM = Remover espaços à esquerda de um texto
	UPPER = Converter texto em letras maiusculas
	LOWER = Converter texto em letras minusculas
	REPLICATE = Repetir caractere uma determinada quantidade de vezes
	REVERSE = Inverter um texto
	CONCAT = Concatenar conteudos
*/
select
	LEN(nomeCliente) AS [Nº DE CARACTERES],
	CHARINDEX('Emmanuel',nomeCliente) as [localizar],
	SUBSTRING(nomeCliente,1,1)
from MAROCA2;

--letras maiusculas 
select
	UPPER(nomeCliente)
from MAROCA2;

--letras minusculas
select
	lower(nomeCliente)
from MAROCA2;