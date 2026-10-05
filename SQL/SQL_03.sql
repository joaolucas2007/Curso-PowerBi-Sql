--Usando o banco de dados nessa consulta
Use CursoUdemy
Go

--Usando Case -When - Then 

Select LOJA, CUPOM, COD_CLIENTE, VENDEDOR,
Case VENDEDOR --Usando Case
When  'LLP' THEN 'Luise Tuti Pereira' -- Colocando nome em todos vendedores com esses dados
When 'lTZ'  THEN 'Lucas Tunho Zoliver'
Else 'Cliente não cadastrado' --Valor inserido caso não seja nenhum desses dois
End As NomeVendedor,
QUANTIDADE, VALOR_VENDA, VALOR_PAGO, VALOR_CANCELADO From TabelaVendas


--Update
--fazendo sempre select antes de update
Select * From TabelaVendas
Where Vendedor = 'LLP'
--Begin -- Rollback --Commit


--Update com Begin Tran
Begin Tran
Update TabelaVendas --Tabela que vamos atualizar
Set Vendedor ='Luiz Lopes' -- Mudança que vai ocorrer na trabela
Where Vendedor = 'LLP' --Filtrando para atualizar somente as linhas filtradas
Go


--Usando o commit para poder liberar o dado para Power Bi entre outros
Commit

--Selecionando para ver a mudança
Select * From TabelaVendas

--Update com RollBack