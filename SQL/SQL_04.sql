
--Usando o banco de dados nessa quer
Use CursoUdemy
Go
--Começando a mexer com variavel
--Declarando uma variavel
Declare @NomeCliente NVarChar(100);
--Agora atribuimos um valor 
Set @NomeCliente = 'João';
--Pritando a variavel
Print 'O Nome do Cliente é: ' + @NomeCliente;

--Selecionando dados da tabela vendas
Select * From TabelaVendas
Go

--Declarando uma variavel
Declare @NomeVendedor NvarChar(100);
Set @NomeVendedor = 'LTZ';
--Fazendo consulta com variavel
Select * From TabelaVendas
Where Vendedor = @NomeVendedor;

--Fazendo Select para devolver com uma mensagem
Select 'Esse foi o valor selecionado' + @NomeVendedor As Mensagem
Go