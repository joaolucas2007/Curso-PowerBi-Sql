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