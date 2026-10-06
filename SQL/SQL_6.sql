--Ultilizando arquivo Json no sql

Create Procedure ImportJson
As 
	Begin
		Set Nocount on
		Declare @Json NVarChar(Max)
		--Ler o Arquivo o caminho para o json
		Select @Json = BulkColumn
		From OpenRowset (
		Bulk 'C:\SQLJSON\exemplo_tabela.json',
		Single_Clob
		) As JsonData

--Criando a tabela com IF se existe deleta e cria denovo
IF Object_ID('dbo.Transacoes') Is Null
	Begin
		Create Table Transacoes 
		(
		 DataTransacao NvarChar(30),
		 Cliente NvarChar(30),
		 TipoTransacao NVarChar(50),
		 ValorTransacao Decimal (10,2),
		 Bandeira   NVarChar(50),
		 Aprovada NVarChar(50)
		)
	End
	--Inserindo os dados do json na tabela
	Insert Into Transacoes 
	     (DataTransacao,
		 Cliente,
		 TipoTransacao,
		 ValorTransacao,
		 Bandeira,
		 Aprovada )



		 Select DataTransacao,
		 Cliente,
		 TipoTransacao,
		 ValorTransacao,
		 Bandeira,
		 Aprovada From OpenJson(@Json)
		 With
		 ( DataTransacao NvarChar(30),
		 Cliente NvarChar(30),
		 TipoTransacao NVarChar(50),
		 ValorTransacao Decimal (10,2),
		 Bandeira   NVarChar(50),
		 Aprovada NVarChar(50)
		 )
	End


--Testando a procedure
Exec ImportJson

--Selecionando os dados
Select * From Transacoes

--Exercicios Criada as Function


Create Function FN_Saudacao (@nome NVarChar(100))
Returns NVarChar(100)
As 
	Begin 
		Return 'Olá' + @nome
	End
Go
Select ValorTransacao,  dbo.FN_Saudacao(Cliente) As Saudacao From Transacoes


