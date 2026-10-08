--Criando o banco de dados
Create DataBase Eventos2
Go

--Usando o banco de dados nessa consulta
Use Eventos2
Go

Select * From Festas
Go

--Criando as dimenssões

--Tipo_Evento
--Cobertura
--Coordendor
--contratante

--Criando a dimenssão tipoeventos
Select * From Festas
Go


--Slecionando valores distintos
Select Distinct (Tipo_Eventos) From Festas
Go

--Criando Inserindo na dimenssão 

Select Distinct (Tipo_Eventos) 
Into Dim_Eventos
From Festas
Go

--Selecionando os dados da dimenssão
Select Tipo_Eventos From Dim_Eventos
Go

--Criando a dimenssão cobertura

Select Distinct (Cobertura) 
From Festas
Go

--Criando e inserindo na dimenssão
Select Distinct (Cobertura) 
Into Dim_Cobertura
From Festas
Go

--Selecionando os dados da dimenssão
Select Cobertura From Dim_Cobertura
Go

--Criando a dimenssão Coordenador

Select Distinct (Coordenador_Resp) From Festas
Go

--Criando e inserindo os dados na dimenssão
Select Distinct (Coordenador_Resp) 
Into Dim_Coordenador
From Festas
Go

--Selecionando dados da dimenssão
Select Coordenador_Resp From Dim_Coordenador
Go


--Criando a dimenssão contratante
Select Distinct (Contratante) From Festas
Go

--Criando e inserindo dados na dimenssão

Select Distinct (Contratante) 
into Dim_Contratante
From Festas
Go

--Selecionando dados da dimenssão
Select Contratante From Dim_Contratante
Go