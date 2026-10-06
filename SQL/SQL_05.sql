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

--Criando procedure com variaveis

Create Procedure ListarTransacoesCliente
@Cliente VarChar(20)
As
	Begin
		Select TipoTransacao, ValorTransacao, Cliente, Aprovado
		From BaseFraudes
		Where Cliente = @Cliente --sera selecionado o valor que colocarmos na variavel
	End
Go
Exec ListarTransacoesCliente @Cliente = 'Cliente 2' --Colocamos o parametro que queremos para o select
Go

--Criando procedure com 2 parametros


Create Procedure ClienteSituacao
@Cliente VarChar(20),
@Situacao VarChar(20) As
	Begin
		Select TipoTransacao, ValorTransacao, Cliente, Aprovado
		From BaseFraudes
		Where Cliente = @Cliente --sera selecionado o valor que colocarmos na variavel
		And 
		Aprovado = @Situacao
	End
Go
Exec ClienteSituacao @Cliente = 'Cliente 3' , @Situacao = 'Sim' --Colocamos o parametro que queremos para o select
Go

-- Alterando procedure
Alter Procedure ClienteSituacao
 @Cliente VarChar(20),
@Situacao VarChar(20) As
	Begin      --Adicionando data transação no select
		Select DataTransacao, TipoTransacao, ValorTransacao, Cliente, Aprovado
		From BaseFraudes
		Where Cliente = @Cliente --sera selecionado o valor que colocarmos na variavel
		And 
		Aprovado = @Situacao
	End
Go

--Criando proxima procedure
Create Procedure BuscaTransacoes
@Cliente VarChar(20),
@Ano Int As
	Begin 
		Select * From BaseFraudes
	Where Year(DataTransacao) = @Ano And
			Cliente = @Cliente
	End
Go
Exec BuscaTransacoes @Cliente = 'Cliente 2', @Ano = 2023 -- Aqui passamos o cliente e o ano que queremos


--Criando procedure com IF 
Create Procedure MonitoramentoSituacao
@Cliente VarChar(20)
As
	Begin	
	    --Verificando se o cliente tem transação aprovada
		If Exists (Select 1 From BaseFraudes 
					Where Cliente = @Cliente And
					Aprovado = 'Sim')
	

	Begin --Verificando se o cliente possui Aprovação transaçãoes suspeitas (Valor Auto, A Noite)
		
		If Exists (Select 1 From BaseFraudes
					Where Cliente = @Cliente And
					Aprovado = 'Sim' And
					ValorTransacao >= 4000 And
					DatePart(Hour, DataTransacao) >= 21) --pega a hora da transação

	Begin --Retornando as transações suspeitas
	Select DataTransacao, Cliente, TipoTransacao, ValorTransacao, Bandeira, Aprovado, 'Transação suspeita' As Verificar
	From BaseFraudes
	Where Cliente = @Cliente And
	Aprovado = 'Sim' And
	ValorTransacao >= 4000 And
	DatePart(Hour, DataTransacao) >= 21
	End

		Else
			Begin --Caso tenha aprovação e nenhuma suspeita
				Select 'Cliente não possui transação suspeita' As Mensagem
			End
		End
		Else 
			Begin  --Caso não tenha nenhuma trnasação
		 Select DataTransacao, Cliente, TipoTransacao, ValorTransacao, Bandeira, Aprovado, 'Sem transação' As Verificar From BaseFraudes
		 Where Cliente = @Cliente
		 And Aprovado = 'Não'
			End
		End
--Executando a procedure
Exec MonitoramentoSituacao @Cliente = 'Cliente 7'



-- 4 Procedure Lista Transações Classificadas
Create Procedure ClassificacaoTransacao
As 
	Begin
		Select Cliente, ValorTransacao,
		Case 
		When ValorTransacao < 100 Then 'Valor Abaixo'
		When ValorTransacao Between 100 And 900 Then 'Valor Medio'
		Else 'Valor Acima'  
		End As TipoValor
		From BaseFraudes
		Order By Cliente asc
	End
Go
Exec ClassificacaoTransacao

