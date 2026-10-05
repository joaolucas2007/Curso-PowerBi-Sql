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
Into Relatorioltz
From tb_vendas
Where VENDEDOR = 'LTZ'
Go

--Puxando dados da tabela temporaria
Select * From Relatorioltz
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