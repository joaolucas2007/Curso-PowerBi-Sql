--Criando o Banco de dados
Create DataBase Eventos
Go
--Usando o banco de dados na consulta
Use Eventos
Go
--Usando apenas para trazer todos os dados da tabela
Select * From Eventos
Go
--Mudando o nome das colunas para melhorar a visualização dos dados
EXEC sp_rename 'Eventos.data_evnt', 'DataEvento', 'COLUMN';
EXEC sp_rename 'Eventos.id_empresa', 'IdEmpresa', 'COLUMN';
EXEC sp_rename 'Eventos.tipo_eventos', 'TipoEvento', 'COLUMN';
EXEC sp_rename 'Eventos.PGTO', 'Pagamentos', 'COLUMN';
EXEC sp_rename 'Eventos.TOTAL_DE_PART_EVENTO', 'TotalParticipante', 'COLUMN';
EXEC sp_rename 'Eventos.COBERTURA', 'Cobertura', 'COLUMN';

EXEC sp_rename 'Eventos.COORDENADOR_RESP', 'CoordenadorResponsavel', 'COLUMN';
EXEC sp_rename 'Eventos.valor_faturado_do_dia', 'ValorFaturadia', 'COLUMN';
EXEC sp_rename 'Eventos._20_Royalties_Holding', 'RoyaltiesHolding', 'COLUMN';
EXEC sp_rename 'Eventos._2_desc_p_Contratante', 'DescontoContratante', 'COLUMN';
EXEC sp_rename 'Eventos.Contratante', 'Contratante', 'COLUMN';
EXEC sp_rename 'Eventos.Categoria', 'Categoria', 'COLUMN';
Go

--Selecionando com todas as colunas para garantir a validação
SELECT DataEvento, IdEmpresa, TipoEvento,Pagamentos,TotalParticipante,Cobertura,CoordenadorResponsavel,
ValorFaturaDia, RoyaltiesHolding,DescontoContratante,Contratante,Categoria
FROM Eventos
Go

--Contando a quantidade de dados em cada coluna para entender os valores nulos
Select
    COUNT(*) AS TotalRegistros,
    COUNT(DataEvento) AS DataEvento,
    COUNT(IdEmpresa) AS IdEmpresa,
    COUNT(TipoEvento) AS TipoEvento,
    COUNT(Pagamentos) AS Pagamentos,
    COUNT(TotalParticipante) AS TotalParticipante,
    COUNT(Cobertura) AS Cobertura,
    COUNT(CoordenadorResponsavel) AS CoordenadorResponsavel,
    COUNT(ValorFaturaDia) AS ValorFaturaDia,
    COUNT(RoyaltiesHolding) AS RoyaltiesHolding,
    COUNT(DescontoContratante) AS DescontoContratante,
    COUNT(Contratante) AS Contratante,
    COUNT(Categoria) AS Categoria
From Eventos
Go
--Somente a coluna ValorFaturaDia Possui Valores nulos

-- Alterando po tiupo de dados para melhor visualização dos dados

Alter Table Eventos
Alter Column ValorFaturaDia Decimal(10,2) --Alternando de int para decimal com 2 casas depois da virgula
Go
--Tratando e entendendo os valores nulos


--Contando cada pagamento
Select Pagamentos,Count(ValorFaturaDia) As Total From Eventos
Group By Pagamentos
Go
--Validando todos os nulls são os que não foram pagos ainda
Select Pagamentos, Count(Pagamentos) As TotalNulos From Eventos
Where Pagamentos = 'Não'
Group By Pagamentos
Go

--Null não será substituido poruqe tem significado no negocio (Não pago)


--Entendendo colunas de desconta e Royalties

Select ValorFaturaDia, RoyaltiesHolding, DescontoContratante From Eventos
Go
--São valores em relação ao ValorFaturaDia
--Alterando o tipo de dado
Alter Table Eventos
Alter Column RoyaltiesHolding Decimal(10,2)
Go

Alter Table Eventos
Alter Column DescontoContratante Decimal(10,2)
Go

--Desenvolvendo as consultas que irão para o Power BI Somente view

--1 Pergunta = Qual Evento gera mais lucro
Create View TotalPagoEvento As
(
 Select TipoEvento, Sum(ValorFaturaDia) As TotalFatura --Somando o total pago 
 From Eventos
 Group By TipoEvento
)
Go
--Usando  View
Select TipoEvento, TotalFatura From TotalPagoEvento
Go


--2 pergunta = Qual Coordenador gerou mais valor de fatura
Create View TotalPagoCoordenador As
(
    Select CoordenadorResponsavel As Coordenador, Sum(ValorFaturaDia) As TotalCoordenador 
    From Eventos
    Group By CoordenadorResponsavel)
Go

--Usando a view
Select Coordenador, TotalCoordenador From TotalPagoCoordenador
Go


--3 Pergunta: Qual Cobertura gerou maior valor de fatura
Create View TotalPagoCobertura As 
(   Select Cobertura, Sum(ValorFaturaDia) As TotalCobertura
    From Eventos
    Group By Cobertura)
Go
--Usando a view
Select  Cobertura, TotalCobertura From TotalPagoCobertura
Go

--4 pergunta: Qual categoria gerou maior valor de fatura
Create View TotalPagoCategoria As 
(   Select Categoria, Sum(ValorFaturaDia) As TotalCategoria
    From Eventos
    Group By Categoria)
Go
--Usando a View
Select Categoria, TotalCategoria From TotalPagoCategoria
Go

Create View TodosDados As (
Select DataEvento,IdEmpresa,TipoEvento,Pagamentos,TotalParticipante, Cobertura, 
    CoordenadorResponsavel,ValorFaturaDia, RoyaltiesHolding,
        DescontoContratante, Contratante, Categoria
From Eventos)
Go

--Usando a View
Select DataEvento,IdEmpresa,TipoEvento,Pagamentos,TotalParticipante, Cobertura, 
    CoordenadorResponsavel,ValorFaturaDia, RoyaltiesHolding,
        DescontoContratante, Contratante, Categoria From TodosDados
Go


--Somando Total de faturamento
Create View TotalFaturamento As (
Select Sum(ValorFaturaDia) As TotalFatura From Eventos)
Go
--Selecionando dados a view
Select TotalFatura From TotalFaturamento
Go
--Criando Consulta de count para ver quantos eventos foram realizados
Create View ContandoEventos As (
Select Count(TipoEvento) As TotalEvento From Eventos)
Go

--Selecionando os dados da view
Select TotalEvento From ContandoEventos
Go

--Craindo view para mostrar o total de participantes
Create View TotalParticipantes As (

--Criando uma view de media de faturamento
Create view MediaFaturamento As (
Select Avg(ValorFaturaDia) As MediaFatura From Eventos)
Go

--Usando a view
Select MediaFatura From MediaFaturamento