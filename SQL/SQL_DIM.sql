--Criando o banco de dados
Create DataBase Eventos2
Go

--Usando o banco de dados nessa consulta
Use Eventos2
Go

Select * From Festas


--Criando as dimenssões

--Tipo_Evento
--Cobertura
--Coordendor
--contratante

--Criando a dimenssão tipoeventos
Select * From Festas



--Slecionando valores distintos
Select Distinct (Tipo_Eventos) From Festas


--Criando Inserindo na dimenssão 

Select Distinct (Tipo_Eventos) 
Into Dim_Eventos
From Festas


--Selecionando os dados da dimenssão
Select Tipo_Eventos From Dim_Eventos