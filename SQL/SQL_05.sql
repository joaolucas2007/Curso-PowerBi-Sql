--Criando um novo banco
Create DataBase Fraude
Go
--Usando o banco de dados nessa consulta
Use Fraude
Go

--Criando a tabela para receber o excel
Create Table BaseFraudes 
(
DataTransacao DateTime,
Cliente VarChar(100),
TipoTransacao VarChar(100),
ValorTransacao Float,
Bandeira VarChar(10),
Aprovado VarChar(25)
)
Go
--Subindo o arquivo pela query 

Bulk Insert BaseFraudes --Carrega os dados de um arquivo csv para a tabela selecionada
From 'C:\Users\joaol\OneDrive\Desktop\ArquivoCurso\Base_Fraude.csv' --Caminho completo para o arquivo csv


With
(
	Firstrow = 2 ,-- Começar a pegar os dados apartir da segunda linha 
	Fieldterminator = ',' ,--Define o separador de condição 
	Rowterminator = '\n', --Define cada linha como quebra
	CodePage = '65001' --Define o codigo da pagina como UTF
) 
Go

--Puxando os dados para validação
Select * From BaseFraudes

--Criando procedure
--Vantagem procedure
--Reutilizavel
--Padronização
--melhora a  performance
--segurança no controle


--Primeira procedure


Create Procedure SelecionarTodasTransacoes As
	Begin --Inicio
		Select * From BaseFraudes
	End --Fim
--Executando a procedure

Exec SelecionarTodasTransacoes