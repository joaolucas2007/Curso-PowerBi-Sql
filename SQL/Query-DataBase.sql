--Criando o banco de dados do curso
Create DataBase CursoUdemy
Go

--Usando Banco de dados Criando
Use CursoUdemy
Go

Select * From Table_Flix

/* Aprendendo sobre Select, Where,And, In e Between
*/

--Usando o select list 
Select Data, Estados,Uf
From Table_Flix


--Usando Alias para mudar o nome das colunas na visualização

Select TOTAL_USUARIOS As Usuarios, PERIODO_DE_ACESSOs As Tempo_Acesso, Segmentos As TipoConteudo
From Table_Flix

--Usando Condições no select --- Where --- And ---Between

Select * From Table_Flix
Where Segmentos = 'Anime'
Go

--Where com And

Select * From Table_Flix
Where Segmentos = 'AÇÃO'
And Uf = 'RJ'
Go

--Usando mais de um And
Select * From Table_Flix
Where Segmentos = 'AÇÃO'
And Uf = 'RJ'
And PERIODO_DE_ACESSOS = 'MANHA'
Go


--Usando Between para filtrar os dados 
Select * From Table_Flix
Where Data Between '2019/01/01' And '2019/01/19'
Go

--Usando o IN

Select * From Table_Flix
Where DATA In ('2019/01/01' , '2019/01/15')
Go

--Resolvendo exercicios da aula
Select TOTAL_USUARIOS As AcessoTotal, TIPO_DE_CONTA As Conta,  VALOR As ValorVenda, ESTADOS As Locais
From Table_Flix
Where TOTAL_USUARIOS IN ('8480','997')
GO


--Aprendendo Funções de agregação Count
Select	Count(UF)
From Table_Flix
Go
--Contando a quantidade distinta 
Select	Count(Distinct UF)
From Table_Flix
Go
--Usando Sum para somar total ganho
Select Sum(VALOR) As TotalGanho
From Table_Flix
Go


--Usando replace para substituir valores de uma coluna
Select TOTAL_USUARIOS,REPLACE(PERIODO_DE_ACESSOS, 'Manha', 'primeiroAcessos') As PeriodoAcesso , Segmentos 
From Table_Flix