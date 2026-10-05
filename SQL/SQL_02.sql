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

