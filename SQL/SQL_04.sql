
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