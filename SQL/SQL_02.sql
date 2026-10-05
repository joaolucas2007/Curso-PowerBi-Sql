--USANDO O BANCO DE DADOS NESSA QUERY
Use CursoUdemy
Go

--Vamos pegar aquivo svg e colocar no Banco de dados
Select * From tb_vendas

--Filtrando por Vendedor
Select * From tb_vendas
Where VENDEDOR = 'LTZ'
Go

--Criando uma tabela temporario 
Select * 
Into #Relatorioltz
From tb_vendas
Where VENDEDOR = 'LTZ'
Go

--Puxando dados da tabela temporaria
Select * From #Relatorioltz
Go

--Criação de tabelas Fisicas com Select
Select *
Into Relatorio_ltz
From tb_vendas
Where VENDEDOR  = 'ltz'
Go
--Puxando dados com a tabela fisica
Select * From Relatorio_ltz
Go
--Drop na tabela criada
Drop Table Relatorio_ltz
Go

--Criação de tabelas Fisicas com Select denovo
Select *
Into Relatorio_ltz
From tb_vendas
Where VENDEDOR  = 'ltz'
Go

--Select usando As
Select Loja As Filial, Cupom As Ticket, Data, COD_Cliente As IdCliente, Vendedor, Quantidade,
VALOR_VENDA As ValorVenda, VALOR_PAGO As ValorPago, VALOR_CANCELADO
Into RelatorioFinal --Criadno uma tabela fisica apartir do select
From Relatorio_ltz
Go


--Puxando dados da tabela fisica Criada
Select * From RelatorioFinal
Go


--Criando tabelas virtuais usando tabela fisica

--Criando a tabela virtual 
Create Table RelatorioNovo 
(
Loja int,
Cupom Int,
Data Date,
IdCliente VarChar(255),
Vendedor VarChar (255),
Quantidade Int,
ValorVenda Decimal(18,2),
ValorPago Decimal(18,2),
ValorCancelado Decimal(18,2)
)
--Insetindo dados na table
Insert Into RelatorioNovo
--Fonte de onde vem os dados
Select
Loja,
Cupom ,
Data ,
cod_cliente ,
Vendedor ,
Quantidade ,
Valor_Venda, 
Valor_Pago,
Valor_Cancelado 
From tb_Vendas

--Selecionando dados da tabela virtual criada
Select * From RelatorioNovo

--Criação de views
Create View VwRelatorio AS 
Select * From RelatorioNovo
Where VENDEDOR = 'Vin'
Go

Select * From VwRelatorio
--Subindo outra base de dados

--Tratando os dados 
--Rtrim tira os espaços a direita
Select Rtrim(NOME)			As Nome,
Rtrim(COD_CLI)				As Cliente,
Rtrim(ENDERECO) 				As Endereco,
Rtrim(CPF) 					As Cpf,
Rtrim(CIDADE) 					As Cidade,
Rtrim(TIPO_DE_CLIENTE) 			As TipoCliente
From BaseCliente
Go


--Criando view RelatorioCliente

Create View RelatorioCliente As
Select Rtrim(NOME)			As Nome,
Rtrim(COD_CLI)				As Cliente,
Rtrim(ENDERECO) 				As Endereco,
Rtrim(CPF) 					As Cpf,
Rtrim(CIDADE) 					As Cidade,
Rtrim(TIPO_DE_CLIENTE) 			As TipoCliente
From BaseCliente
Go

--Selecionando dados da view criada
Select * From RelatorioCliente
Go
--Criando uma tabel virtual com a nova base
Create Table TesteCliente 
(
  Nome VarChar(255),
  IdCliente VarChar(255),
  Endereco VarChar(255) Default 'Não Cadastrado',
  Cpf VarChar (30),
  Cidade VarChar(100),
  TipoCliente tinyInt
)
-- Inserindo dados
Insert Into TesteCliente

--fonte dos dados inseridos
Select Nome,COD_CLI, Endereco, Cpf, Cidade, Tipo_de_Cliente 
From BaseCliente
Go
--Selecionando os dados da tabela virtual
Select * From TesteCliente
Go
--Criando o view apartir da tabela virtual
Create View RelatorioTesteCliente As
Select Nome, IdCliente, Endereco, Cpf, Cidade, TipoCliente
From TesteCliente
Go

--Puxando os dados da view criada
Select * From RelatorioTesteCliente
Go