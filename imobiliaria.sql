CREATE DATABASE SISTEMA_IMOBILIARIA


---------------------------------------------------------------------------------------------
-- TABELA USUARIOS
---------------------------------------------------------------------------------------------
CREATE TABLE usuario(
codigoUsuario int not null,
loginUsuario varchar(40) not null,
senhaUsuario varchar(20) not null
);
SELECT * FROM usuario

alter table usuario
ADD CONSTRAINT PK_usuario
primary key (codigoUsuario);


insert into usuario(codigoUsuario,loginUsuario,senhaUsuario)
values (1,'Jessica','123456'),
(2,'Angelica','123456'),
(3,'Iuri','123456'),
(4,'Ronaldo','123456'),
(5,'Marcelino','123456')


---------------------------------------------------------------------------------------------
-- TABELA CORRETOR
---------------------------------------------------------------------------------------------
CREATE TABLE corretor(
codigoCorretor int not null,
nomeCorretor varchar(50) not null,
creciCorretor varchar(10) not null,
codigoUsuario int not null
);

SELECT * FROM corretor

alter table corretor
ADD CONSTRAINT PK_corretor
primary key(codigoCorretor);

alter table corretor
ADD CONSTRAINT FK_corretor
foreign key(codigoUsuario)
references usuario(codigoUsuario);


insert into corretor(codigoCorretor,nomeCorretor,creciCorretor,codigoUsuario)
values (1,'Rodrigues','123456',3),
(2,'Mendes','123456',1)


---------------------------------------------------------------------------------------------
-- TABELA PROPRIETARIO
---------------------------------------------------------------------------------------------
CREATE TABLE proprietario(
codigoProprietario int not null,
enderecoProprietario varchar(50) not null,
bairroProprietario varchar(30) not null,
cidadeProprietario varchar(30) not null,
estadoProprietario varchar(30) not null,
complementoProprietario varchar(50) not null,
emailProprietario varchar(30) not null
);

SELECT*FROM proprietario

alter table proprietario
ADD CONSTRAINT PK_proprietario
primary key(codigoProprietario);

insert into proprietario(codigoProprietario,enderecoProprietario,bairroProprietario,cidadeProprietario,estadoProprietario,complementoProprietario,emailProprietario)
values (1,'Rua Cruzeiro','Carlito','Fortaleza','CE','casa','jeje@gmail.com'),
(2,'Rua Rocha','Carlito','Fortaleza','CE','apartamento','ang@gmail.com')

---------------------------------------------------------------------------------------------
-- TABELA PESSOA FISICA
---------------------------------------------------------------------------------------------

CREATE TABLE pessoaFisica(
cpfPessoaFisica varchar(15) not null,
codigoProprietario int not null
); 

select * from pessoaFisica

alter table pessoaFisica
ADD CONSTRAINT PK_pessoaFisica
primary key(cpfPessoaFisica);

alter table pessoaFisica
ADD CONSTRAINT FK_pessoaFisica
foreign key(codigoProprietario)
references proprietario(codigoProprietario);

insert into pessoaFisica(cpfPessoaFisica,codigoProprietario)
values('123456782',1),
('213456781',2)

---------------------------------------------------------------------------------------------
-- TABELA PESSOA JURIDICA
---------------------------------------------------------------------------------------------

CREATE TABLE pessoaJuridica(
cnpjPessoaJuridica varchar(25) not null,
codigoProprietario int not null
); 

select * from pessoaJuridica

alter table pessoaJuridica
ADD CONSTRAINT PK_pessoaJuridica
primary key(cnpjPessoaJuridica);

alter table pessoaJuridica
ADD CONSTRAINT FK_pessoaJuridica
foreign key(codigoProprietario)
references proprietario(codigoProprietario);


insert into pessoaJuridica(cnpjPessoaJuridica,codigoProprietario)
values('985745362489',2)

---------------------------------------------------------------------------------------------
-- TABELA IM�VEIS
---------------------------------------------------------------------------------------------
CREATE TABLE imovel(
codigoImovel int not null,
nomeImovel varchar(40) not null,
cidadeImovel varchar(40) not null,
codigoProprietario int not null
);

ALTER TABLE imovel
add constraint PK_imovel
primary key (codigoImovel);

ALTER TABLE imovel
add constraint FK_imovel
foreign key (codigoProprietario)
references proprietario(codigoProprietario);

select*from imovel

insert into imovel(codigoImovel,nomeImovel,cidadeImovel,codigoProprietario)
values(12,'SystemP','Caucaia',1),
(8,'ProductS','Maracanau',2)

---------------------------------------------------------------------------------------------
-- TABELA CLIENTES
---------------------------------------------------------------------------------------------
CREATE TABLE clientes(
codigoCliente int not null,     
nomeCliente varchar(40) not null,
rgCliente varchar(15) not null,
cpfCliente varchar(15) not null,
dataNascimento date not null,
estadoCivilCliente varchar(15) not null,
telefoneCliente varchar(9) not null,
whatsAppCliente varchar(9) not null,
emailCliente varchar(30) not null,
enderecoCliente varchar(50) not null,
bairroCliente varchar(30) not null,
cidadeCliente varchar(30) not null,
estadoCliente varchar(30) not null,
complementoCliente varchar(50) not null
);

SELECT*FROM clientes

alter table clientes
ADD CONSTRAINT PK_clientes
primary key(codigoCliente);

insert into clientes(codigoCliente,nomeCliente,rgCliente,cpfCliente,dataNascimento,
estadoCivilCliente,telefoneCliente,whatsAppCliente,emailCliente,enderecoCliente,bairroCliente,cidadeCliente,estadoCliente,complementoCliente)
values
(1,'Jo�o','1233455666','532345666','12-04-1987',
'casado','959595876','959595876','jo@gmail.com','Rua Paz','Aldeota','Fortaleza','CE','apartamento'),
(2,'Maicon','1453456677','12453456677','15-12-1947',
'viuvo','55558766','555558766','ma@gmail.com','Rua Luz','Elsebio','Fortaleza','CE','casa'),
(3,'Lucas','1232335666','5327745666','08-10-1987',
'casado','953495876','953495876','lu@gmail.com','Rua Luz','Aldeota','Fortaleza','CE','apartamento'),
(4,'Emily','888455666','53234500000','15-02-1987',
'solteiro','959000766','959000766','emy@gmail.com','Rua Luz','Elsebio','Fortaleza','CE','casa'),
(5,'Ricardo','1663455666','18932345666','02-01-1987',
'solteiro','922295876','922295876','caduk@gmail.com','Rua Paz','Aldeota','Fortaleza','CE','apartamento'),
(6,'Isaac','6733455666','12332345666','22-08-1987',
'solteiro','98765958','98765958','isk@gmail.com','Rua Esmeralda','Elsebio','Fortaleza','CE','casa'),
(7,'Atila','11455666','111567788888','19-12-1987',
'casado','39098745','39098745','aty@gmail.com','Rua Esmeralda','Aldeo','Fortaleza','CE','apartamento')


update clientes set  bairroCliente = 'Eusebio'
where bairroCliente = 'Elsebio'

select * from clientes

select nomeCliente from clientes where complementoCliente ='casa' 


---------------------------------------------------------------------------------------------
-- TABELA VENDA
---------------------------------------------------------------------------------------------
CREATE TABLE venda(
codigoVenda int not null,
valorVenda float not null, 
dataVenda date not null,
formaPagamento varchar(25) not null,
descricaoPagamento varchar(25) not null,
parcelas int  not null,
diaPagamento int not null,
inicioPagamento date not null,
codigoCorretor int not null
);
select*from venda

alter table venda
add constraint PK_venda
primary key(codigoVenda);

alter table venda
add constraint FK_venda
foreign key(codigoCorretor)
references corretor(codigoCorretor);

insert into venda(codigoVenda,valorVenda,dataVenda,formaPagamento,descricaoPagamento,parcelas,diaPagamento,inicioPagamento,codigoCorretor)
values (1,1234.78,'22-05-2019','dinheiro','por parcelas','2',18,'22-05-2019',1),
(2,1244.78,'22-05-2019','dinheiro','normal','1',12,'23-01-2019',1)

---------------------------------------------------------------------------------------------
-- TABELA IMOVEL VENDA
---------------------------------------------------------------------------------------------
CREATE TABLE ImovelVenda(
codigoImovelVenda int not null,
codigoVenda int not null,
codigoCliente int not null,
codigoImovel int not null
);

SELECT*FROM ImovelVenda

alter table ImovelVenda
add constraint PK_ImovelVenda
primary key(codigoImovelVenda);

alter table ImovelVenda
add constraint FK_ImovelVenda
foreign key(codigoVenda)
references venda(codigoVenda);

alter table ImovelVenda
add constraint FK_ImovelVenda1
foreign key(codigoCliente)
references clientes(codigoCliente);

alter table ImovelVenda

add constraint FK_ImovelVenda2
foreign key(codigoImovel)
references imovel(codigoImovel);

insert into ImovelVenda(codigoImovelVenda,codigoVenda,codigoCliente,codigoImovel)
values (1,1,7,8),
(2,2,3,12)

---------------------------------------------------------------------------------------------
-- TABELA DOCUMENTO
---------------------------------------------------------------------------------------------
CREATE TABLE documento(
codigoDocumento int not null,
nomeDocumento varchar(50) not null,
codigoVenda int not null
);

SELECT*FROM documento

alter table documento
add constraint PK_documento
primary key (codigoDocumento);

alter table documento
add constraint FK_documento
foreign key (codigoVenda)
references venda(codigoVenda);

insert into documento(codigoDocumento,nomeDocumento,codigoVenda)
values (1,'certidao de nascimento',2),
(2,'certidao de casamento',1)

---------------------------------------------------------------------------------------------
-- TABELA MOVIMENTO DOCUMENTACAO
---------------------------------------------------------------------------------------------
CREATE TABLE MovimentoDocumentacao(
codigoMovimento int not null,
codigoDocumento int not null,
descricaoMovimento varchar(50) not null
);

SELECT*FROM MovimentoDocumentacao

alter table MovimentoDocumentacao
add constraint PK_MovimentoDocumentacao
primary key (codigoMovimento);

alter table MovimentoDocumentacao
add constraint FK_MovimentoDocumentacao
foreign key (codigoDocumento)
references documento(codigoDocumento);

insert into MovimentoDocumentacao(codigoMovimento,codigoDocumento,descricaoMovimento)
values (1,1,'retirar'),
(2,2,'colocar')
---------------------------------------------------------------------------------------------
-- SELECTS
---------------------------------------------------------------------------------------------

SELECT
*
FROM
    corretor c
     INNER JOIN usuario u ON c.codigoCorretor = u.codigoUsuario

SELECT
	nomeCliente,nomeImovel,valorVenda
FROM
    ImovelVenda i
     INNER JOIN clientes c ON i.codigoImovelVenda = c.codigoCliente
	 INNER JOIN imovel im ON i.codigoImovel = im.codigoImovel
	 INNER JOIN venda v ON i.codigoVenda = v.codigoVenda

SELECT
	count(codigoCliente) AS QUANT_CLI
FROM clientes


SELECT
	nomeCliente,bairroCliente
FROM clientes
where bairroCliente like '%elsebio%'



create view pokoy as 
SELECT
	count(codigoCliente) AS QUANT_CLI
FROM clientes

select * from pokoy

drop view pokoy

create view viu as 
SELECT
	nomeCliente,nomeImovel,valorVenda
FROM
    ImovelVenda i
     INNER JOIN clientes c ON i.codigoImovelVenda = c.codigoCliente
	 INNER JOIN imovel im ON i.codigoImovel = im.codigoImovel
	 INNER JOIN venda v ON i.codigoVenda = v.codigoVenda


select nomeCliente
from viu
select * from viu

select TOP 100 percent nomeCliente from clientes

select top 2  nomeCliente from clientes

select top 10 WITH TIES  nomeCliente from clientes 