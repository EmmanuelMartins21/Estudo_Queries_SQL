use TREINO
/* 
Exemplos de fun��es para manipular Strings: 
	LEN = Retorna o comprimento de um texto
	LEFT = Retorna os primeiros caracteres da esquerda
	RIGHT = Retorna os ultimos caracteres da direita
	REPLACE = Substitui um texto por outro
	CHARINDEX = Localizar a posi��o de um texto dentro de outro
	SUBSTRING = Retorna parte de um texto
	RTRIM = Remover espa�os � direita de um texto
	LTRIM = Remover espa�os � esquerda de um texto
	UPPER = Converter texto em letras maiusculas
	LOWER = Converter texto em letras minusculas
	REPLICATE = Repetir caractere uma determinada quantidade de vezes
	REVERSE = Inverter um texto
	CONCAT = Concatenar conteudos
*/
select
	LEN(nomeCliente) AS [N� DE CARACTERES],
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