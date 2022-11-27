
create database FarmaciaBD;
use FarmaciaBD;

create table Cidades(
id_cidade INT,
Nome_cidade CHAR(25),
primary key(id_cidade)
);

create table Genero(
id_genero INT,
genero CHAR(15),
primary key(id_genero)
);


create table Marca(
id_Marca INT,
Nome_Marca CHAR(35),
primary key(id_Marca)
);


create table TipoDeProduto(
id_TipoProduto INT,
Tipo_Prduto CHAR(35),
primary key(id_TipoProduto)
);





create table Farmacia(
	id_farmacia INT,
    cep_farmacia CHAR(35),
    id_cidade INT,
    bairro_farmacia CHAR(35) not null,
    rua_farmacia CHAR(35) not null,
    numero_farmacia INT not null,
    complemento_farmacia CHAR(90), 
    telefone_farmacia CHAR(35),
    primary key (id_farmacia), 
	foreign key (id_cidade) references Cidades(id_cidade)
);

create table Departamento(
	id_departamento INT,
    nome_departamento CHAR(35) not null,
    id_farmacia INT,
    primary key (id_departamento),
    foreign key (id_farmacia) references Farmacia(id_farmacia)
);

create table Produto(
	id_produto INT,
    id_TipoProduto INT,
    nome_produto CHAR(35) not null,
    id_Marca INT,
    preco_produto DOUBLE not null,
    id_departamento INT not null,
    primary key (id_produto),
    foreign key (id_departamento) references Departamento(id_departamento), 
	foreign key (id_marca) references Marca(id_marca)
);

create table Fornecedor(
    id_fornecedor INT,
    nome_fornecedor CHAR(35) not null,
    telefone_fornecedor CHAR(35),
    email_fornecedor CHAR(70) not null,
    nomeResponsavel_fornecedor CHAR(35) not null,
    cnpj_fornecedor CHAR(35),
    primary key(id_fornecedor)
);

create table Entrega(
    id_entrega INT,
    data_entrega DATE not null,
    notaFiscal_entrega CHAR(35),
    id_fornecedor INT,
    primary key (id_entrega),
   foreign key (id_fornecedor) references Fornecedor(id_fornecedor)
);

create table Cargo(
   id_cargo INT,
   nome_cargo CHAR(35) not null,
   salario_funcionario DOUBLE not null,
   primary key (id_cargo)
);

create table Funcionario(
   id_funcionario INT,
   nome_funcionario CHAR(35) not null,
   sobrenome_funcionario CHAR(35) not null,
   cpf_funcionario CHAR(35),
   cep_funcionario CHAR(35),
   id_cidade INT,
   bairro_funcionario CHAR(35) not null,
   rua_funcionario CHAR(35) not null,
   numero_funcionario INT not null,
   complemento_funcionario CHAR(50),
   id_genero INT,
   dataNascimento_funcionario DATE not null,
   telefone_funcionario INT not null,
   email_funcionario CHAR(70) not null,
   id_cargo INT,
   id_departamento INT,
   id_farmacia INT ,
   primary Key (id_funcionario),
   foreign key (id_departamento) references Departamento(id_departamento),
   foreign key (id_cidade) references Cidades(id_cidade),
   foreign key (id_farmacia) references Farmacia(id_farmacia),
   foreign key (id_cargo) references Cargo(id_cargo) ,
    foreign key (id_genero) references Genero(id_genero)
);

create table Cliente(
   id_cliente INT,
   nome_cliente CHAR(35) not null,
   sobrenome_cliente CHAR(35) not null,
   cpf_cliente CHAR(35),
   id_cidade INT,
   bairro_cliente CHAR(35) not null,
   rua_cliente CHAR(35) not null,
   numero_cliente INT not null,
   complemento_cliente CHAR(50),
   id_genero INT,
   dataNascimento_cliente DATE not null,
   telefone_cliente CHAR(35),
   email_cliente CHAR(70) not null,
   primary key(id_cliente),
   foreign key (id_cidade) references Cidades(id_cidade),
    foreign key (id_genero) references Genero(id_genero)
);


create table Farmaceutico(
	id_funcionario INT,
    CRF CHAR(35),
	foreign key (id_funcionario) references Funcionario(id_funcionario)
);

create table Dependente(
	id_dependente INT,
    nome_dependente CHAR(35) not null,
    sobrenome_dependente CHAR(35) not null,
    cep_dependente CHAR(35),
	id_cidade INT,
    bairro_dependente CHAR(35) not null,
    rua_dependente CHAR(35) not null,
    numero_dependente INT not null,
    complemento_dependente CHAR(50) ,
    telefone_dependente CHAR(35),
    primary key (id_dependente),
    foreign key (id_cidade) references Cidades(id_cidade)
);

create table Venda(
	id_venda INT,
    notaFiscal_venda CHAR(35),
    data_venda DATE not null,
    preco_venda DOUBLE not null,
    id_cliente INT,
    id_farmacia INT,
    primary key (id_venda),
    foreign key (id_cliente) references Cliente(id_cliente),
    foreign key (id_farmacia) references Farmacia(id_farmacia)
);

create table Lote(
	id_lote INT,
    validade_lote DATE not null,
    quantidade_lote INT,
    id_entrega INT,
    primary key (id_lote),
    foreign key (id_entrega) references Entrega(id_entrega)
);

create table Produto_Lote(
	id_produto INT,
    id_lote INT,
    primary key (id_lote,id_produto),
    foreign key (id_lote) references Lote(id_lote),
	foreign key (id_produto) references Produto(id_produto)
);

create table Funcionario_Dependente(
	id_funcionario INT,
    id_dependente INT,
    primary key (id_funcionario, id_dependente),
    foreign key (id_funcionario) references Funcionario(id_funcionario),
	foreign key (id_dependente) references Dependente(id_dependente)
);

create table Venda_Produto(
	id_venda INT,
    id_produto INT,
    primary key (id_venda, id_produto),
    foreign key (id_venda) references Venda(id_venda),
	foreign key (id_produto) references Produto(id_produto)
);


insert into Cidades values (1, "Curitiba");
insert into Cidades values (2, "Maringa");
insert into Cidades values (3, "Pinhais");

insert into Genero values (1, "Feminino");
insert into Genero values (2, "Masculino");
insert into Genero values (3, "Não Binário");


insert into Marca values (1,"Johnson & Johnson");
insert into Marca values (2, "CIMED");
insert into Marca values (3, "Vishi");
insert into Marca values (4, "Pantenne");
insert into Marca values (5 , "Lola");
insert into Marca values (6, "Hipoglos");


insert into TipoDeProduto values (1, "Shampoo");
insert into TipoDeProduto values (2, "Condicionador");
insert into TipoDeProduto values (3, "Medicamento Genérico");
insert into TipoDeProduto values (4, "Medicamento Tarja Preta");
insert into TipoDeProduto values (5, "Leite em pó");
insert into TipoDeProduto values (6, "Rimel");


insert into Farmacia values (1, "123-321-222-9", 1, "Beija flor", "av. Passarinho", 123, "casa 4", "988888-0092" );
insert into Farmacia values (2, "123-999-222-9", 2, "Sagarana", "Rei", 1273, "bloco 3", "9800000-0092" );
insert into Farmacia values (3, "123-000-282-0", 3, "Bahia", "jabuticabeira", 3, "-", "88000-9992" );


insert into Departamento values (1, "Beleza", 1);
insert into Departamento values (2, "Beleza", 2);
insert into Departamento values (3, "Beleza", 3);

insert into Departamento values (10, "Medicamento", 1);
insert into Departamento values (20, "Medicamento", 2);
insert into Departamento values (30, "Medicamento", 3);

insert into Departamento values (11, "Cabelo", 1);
insert into Departamento values (21, "Cabelo", 2);
insert into Departamento values (31, "Cabelo", 3);



insert into Produto values (1, 1, "Cacho dos Sonhos", 1, 20.00 , 11);
insert into Produto values (2, 1, "Cacho dos Sonhos", 1, 16.20 , 21);
insert into Produto values (3, 1, "Cacho dos Sonhos", 1, 16.20 , 31);

insert into Produto values (4, 1, "Liso dos Sonhos", 1, 20.20 , 11);
insert into Produto values (5, 1, "Liso dos Sonhos", 1, 20.20 , 21);
insert into Produto values (6, 1, "Liso dos Sonhos", 1, 20.20 , 31);

insert into Produto values (7, 2, "Cacho dos Sonhos", 1, 21.20 , 11);
insert into Produto values (8, 2, "Cacho dos Sonhos", 1, 21.20 , 21);
insert into Produto values (9, 2, "Cacho dos Sonhos", 1, 21.20 , 31);

insert into Produto values (10, 2, "Liso dos Sonhos", 1, 16.20 , 11);
insert into Produto values (11, 2, "Liso dos Sonhos", 1, 16.20 , 21);
insert into Produto values (12, 2, "Liso dos Sonhos", 1, 16.20 , 31);

insert into Produto values (13, 3,"Remedio para dor de cabeca", 2, 35.50, 10);
insert into Produto values (14, 3,"Remedio para dor de cabeca", 2, 35.50, 30);

insert into Produto values (15, 3,"Remedio para dor nas costas", 2, 40.00, 10);
insert into Produto values (16, 3,"Remedio para dor nas costas", 2, 40.00, 20);

insert into Produto values (17, 6,"Cilios dos sonhos", 3, 40.00, 2);
insert into Produto values (18, 6,"Cilios dos sonhos", 3, 40.00, 3);


insert into Fornecedor values (1, "Bosh", "99999888", "bosh@pucpr.edu.br", "Antonio 
Silva",  "12222234");
insert into Fornecedor values (2, "J&J", "99890898", "jj@pucpr.edu.br", "Junior
carvalho",  "1999234");
insert into Fornecedor values (3, "Pamper", "99777788", "pp@pucpr.edu.br", "Pedro Pereira",  "12000234");

insert into Entrega values(1, "2020-10-20", "1222234", 1);
insert into Entrega values(2, "2020-10-22", "120000", 1);
insert into Entrega values(3, "2020-11-01", "1223433", 1);
insert into Entrega values(4, "2021-01-02", "1223888", 1);
insert into Entrega values(5, "2021-01-12", "144433", 1);
insert into Entrega values(6, "2021-01-14", "1200433", 1);

insert into Entrega values(7, "2020-11-01", "1223993", 2);
insert into Entrega values(8, "2020-11-01", "122993", 2);
insert into Entrega values(9, "2020-12-01", "9923433", 2);
insert into Entrega values(10, "2021-01-02", "1003433", 2);
insert into Entrega values(11, "2021-01-03", "12555433", 2);

insert into Entrega values(12, "2020-01-12","1000033", 3);
insert into Entrega values(13, "2020-11-12", "1099083", 3);
insert into Entrega values(14, "2021-01-01", "1000987", 3);
insert into Entrega values(15, "2020-02-01", "1000444", 3);

insert into Cargo values(1, "Estegiario", 1220.50);
insert into Cargo values(2, "Balconista", 2020.50);
insert into Cargo values(3, "Atendente", 3000.50);
insert into Cargo values(4, "Farmaceutico", 1500.50);
insert into Cargo values(5, "Gerente", 1520.50);

insert into Funcionario values(1, "Ana", "Carvalho", "1234567", "4444466", 1,
"Pinheiros", "Av. Pineville", 233, "Condominio Rosa da Laranjeira", 1 , 
"2000-12-30", "999988888", "fulano@pucpr.edu", 1, 1, 1);

insert into Funcionario values(2, "Amanda", "Costa", "100067", "4000466", 1,
"Pinhais", "Bosquele", 93, "bloco 2", 1 , 
"2000-12-20", "99900008", "amandaa@pucpr.edu", 2, 1, 1);

insert into Funcionario values(3, "Julio", "Costa", "19997", "433366", 1,
"Jaja", "Jubuticabeira", 3, "-", 2 , 
"1971-12-20", "99999908", "jc@pucpr.edu", 4, 10, 1);

insert into Funcionario values(4, "Fernado", "Bruno", "188767", "42222466", 1,
"Pinhao", "Kiwi", 23, "-", 2 , 
"2000-12-20", "99900008", "fb@pucpr.edu", 2, 1, 1);




insert into Funcionario values(5, "Bruno", "Buvi", "19997", "4222266", 2,
"Carrao", "Av. Navegante", 10, "-", 2 , 
"1988-02-20", "99777708", "bb@pucpr.edu", 1, 2, 2);

insert into Funcionario values(6, "Vitor", "Bruxo", "19667", "4288266", 2,
"Apple co", "Av. Barco", 9, "-", 2 , 
"1993-10-20", "9667708", "bv@pucpr.edu", 2, 21, 2);


insert into Funcionario values(7, "Juliana", "Dalcontea", "188999", "000556", 3,
"Batata", "Av.Batata", 8870, "-", 1 , 
"1999-01-12", "99777708", "js@pucpr.edu", 1, 3, 3);

insert into Funcionario values(8, "Julia", "Serra", "188897", "4255556", 3,
"Maarrao", "Av. Navegantes", 880, "-", 1 , 
"1988-02-20", "99777708", "js@pucpr.edu", 1, 30, 3);

insert into Funcionario values(9, "Juninha", "Campos", "199997", "44444556", 3,
"Maarrao", "Jujuba", 70, "-", 1 , 
"1978-02-10", "96667708", "jcc@pucpr.edu", 4, 30, 3);

insert into Funcionario values(10, "JJ", "Campineiro", "889997", "4446656", 3,
"Marroco", "Miumiu", 440, "-", 2 , 
"1999-02-12", "922267708", "jjc@pucpr.edu", 5, 31, 3);






insert into Cliente values(1, "Maria", "Carvalho", "4400466", 1, 
"Pinheiros", "Av. Pineville", 233, "Condominio Rosa da Laranjeira", 1, 
"1999-12-08", "9777778", "Maria@pucpr.edu");

insert into Cliente values(2, "Maria", "Marias", "4888466", 1, 
"Pinha", "Marrocos", 3, "-", 1, 
"2000-01-08", "976678", "MariaMarias@pucpr.edu");

insert into Cliente values(3, "Juliano", "Carvalho", "00099", 1, 
"Pinheiros", "Av. Pineville", 20, "Condominio Rosa da Laranjeira", 2, 
"1998-12-06", "999778", "JUJLI@pucpr.edu");

insert into Cliente values(4, "Juliano", "Mendes",  "7777444", 2, 
"Pinheiro", "Av. LUA", 9, "Condominio Nvegante", 2, 
"2002-02-10", "977778", "JUM@pucpr.edu");

insert into Cliente values(5, "Juliana", "Meneguel", "755544", 2, 
"sol", "Av. Sil", 1, "-", 1, 
"1997-05-02", "007778", "JM@pucpr.edu");


insert into Cliente values(6, "Giulia", "Miguel", "87779",  3, 
"Estrela", "Av. Mar", 100, "-", 1, 
"2003-05-04", "002278", "GM@pucpr.edu");

insert into Cliente values(7, "Giuliano", "Maresias", "879886779", 3, 
"Estrela", "Av. Marcoliin", 10, "-", 2, 
"1977-12-04", "2778", "GMM@pucpr.edu");

insert into Farmaceutico values(9, 2333);
insert into Farmaceutico values(3, 8882);

insert into Dependente values(1, "Joao", "Das Flores", "122222",   1, 
"Atlantico",  "Av. Vicente Machado", 12, "Ao lado do Condor", "989898"); 

insert into Dependente values(2, "Maria", "Carvalho", "120022",   1, 
"Rio",  "Av.  Machado", 02, "-", "9000098"); 

insert into Dependente values(3, "Mariana", "Damasco", "177722",   2, 
"Flor",  "Av. Rosas", 1, "-", "9777898"); 

insert into Dependente values(4, "Joao", "Mario", "19992",   2, 
"Artico",  "Av. Piolho", 172, "-", "933398"); 

insert into Dependente values(5, "Hector", "Pianho", "88822",   3, 
"Alianz",  "Av. Lourdes", 22, "Bloco 4", "989777"); 


insert into Venda values(1, "223333", "2020-12-09", 80.00, 1, 1);
insert into Venda values(2, "229993", "2020-12-13", 80.00, 1, 1);
insert into Venda values(3, "22000", "2021-01-21", 33.00, 1, 1);
insert into Venda values(4, "22233", "2020-12-24", 80.00, 1, 1);
insert into Venda values(5, "22233", "2020-12-24", 80.00, 4, 2);

insert into Lote values(1, "2021-12-20", 12, 1);
insert into Lote values(2, "2023-12-20", 120, 2);
insert into Lote values(3, "2022-12-20", 50, 3);
insert into Lote values(4, "2024-12-20", 44, 4);
insert into Lote values(5, "2021-12-30", 12, 5);
insert into Lote values(6, "2022-12-30", 62, 5);
insert into Lote values(7, "2022-01-11", 12, 6);
insert into Lote values(8, "2021-12-30", 90, 7);
insert into Lote values(9, "2021-12-30", 12, 8);
insert into Lote values(10, "2022-12-20", 12, 9);
insert into Lote values(11, "2024-11-30", 32, 9);
insert into Lote values(12, "2021-12-30", 12, 9);
insert into Lote values(13, "2024-01-30", 12, 10);
insert into Lote values(14, "2022-02-23", 80, 11);
insert into Lote values(15, "2021-12-30", 12, 12);
insert into Lote values(16, "2021-12-30", 45, 13);
insert into Lote values(17, "2021-12-30", 20, 13);
insert into Lote values(18, "2022-12-30", 40, 14);
insert into Lote values(19, "2021-12-30", 70, 15);


insert into Produto_Lote values(1, 1);
insert into Produto_Lote values(1, 2);
insert into Produto_Lote values(2, 3);
insert into Produto_Lote values(3, 4);
insert into Produto_Lote values(4, 5);
insert into Produto_Lote values(4, 6);
insert into Produto_Lote values(4, 7);
insert into Produto_Lote values(5, 8);
insert into Produto_Lote values(6, 9);
insert into Produto_Lote values(7, 10);
insert into Produto_Lote values(9, 11);
insert into Produto_Lote values(10, 12);
insert into Produto_Lote values(11, 13);
insert into Produto_Lote values(12, 14);
insert into Produto_Lote values(13, 15);
insert into Produto_Lote values(13, 16);
insert into Produto_Lote values(13, 17);
insert into Produto_Lote values(13, 18);
insert into Produto_Lote values(14, 19);


insert into Funcionario_Dependente values(1, 1);
insert into Funcionario_Dependente values(2, 2);
insert into Funcionario_Dependente values(2, 1);
insert into Funcionario_Dependente values(3, 3);
insert into Funcionario_Dependente values(4, 3);
insert into Funcionario_Dependente values(5, 4);

insert into Venda_Produto values(1, 1);
insert into Venda_Produto values(2, 2);
insert into Venda_Produto values(3, 3);
insert into Venda_Produto values(3, 1);
insert into Venda_Produto values(4, 1);
insert into Venda_Produto values(3, 5);
insert into Venda_Produto values(5, 1);




/*1. Quais lotes  vencerão em 2024? */
Select id_lote
From Lote
Where validade_lote > "2024-01-01" and validade_lote < "2025-01-31";
/*2. Quantos balconistas tem na loja de id= 3? */
Select count(*)
From Funcionario as F
join Cidades as C on F.id_cidade = C.id_cidade
join Genero as G on F.id_genero = G.id_genero
where genero = "Feminino" and  Nome_cidade = "Pinhais";
/* 3.Quantos funcionários do gênero feminino tem na Farmácia de Pinhais?*/
Select  count(*)
From funcionario 
where id_cargo =1  and id_cidade= 3 ;
/*4. Qual foi a rentabilidade de cada loja? */
Select id_farmacia, Sum(preco_venda)
from Venda
group by id_farmacia;
/* 5. Quanto  de cada produto saiu em dezembro de 2020?*/
select id_produto, count(*)
From  Venda_Produto as P 
join Venda as V on P.id_venda = V.id_venda
where  data_venda >= "2020-12-01" and data_venda <= "2020-12-31"
group by id_produto;
/*6. Quantas entregas foram feitas por cada fornecedor em janeiro de 2021? */
select  nome_fornecedor, count(id_entrega)
from Entrega as E
join Fornecedor as F on E.id_fornecedor = F.id_fornecedor
where data_entrega >= "2021-01-01" and data_entrega <= "2021-01-31"
group by  nome_fornecedor  ;
/*7. Quais as marcas mais compradas do departamento de “Cabelo”? */
select  Nome_Marca
from Produto as P
join Marca as M on P.id_marca = M.id_marca
join departamento as D on P.id_departamento = D.id_departamento
where nome_departamento = "Cabelo"
group by Nome_Marca;
/* 8. Quais lojas (por meio do CEP)  tem o produto “Cilios dos sonhos”?*/
select cep_farmacia
from Produto as P
join Marca as M on P.id_marca = M.id_marca
join Departamento as D on D.id_departamento= P.id_departamento
join Farmacia as F on D.id_farmacia =  F.id_farmacia
where nome_produto = "Cilios dos sonhos";
/* 9.Quantos shampoos tem no departamento 11?*/
select count(id_produto)
from Produto 
where id_TipoProduto= 1 and id_departamento = 11;
/*10.Qual a quantidade de dependentes no registro de funcionários de loja 02? */
select count(id_dependente)
from Funcionario as F
join Funcionario_Dependente as FD on F.id_funcionario = FD.id_funcionario
where id_farmacia= 2;
/*11.Quantos shampoos “ cachos dos sonhos” vendeu ? */
select count(*)
from Produto as P
join TipoDeProduto as T on P.id_TipoProduto = T.id_TipoProduto
join Venda_Produto as V on V.id_produto = P.id_produto 
where Tipo_Prduto  = "Shampoo" and  nome_produto= "Cacho dos Sonhos";
/*12.Qual a média dos salários na farmácia 1? */
select  avg(salario_funcionario)
From Funcionario as F
join Cargo as C on C.id_cargo = F.id_cargo
where id_farmacia = 1;
/* 13.Qual a média das vendas da farmácia 1?*/
select avg(preco_venda)
from Venda as V
join Cliente as C on V.id_cliente = C.id_cliente 
where id_farmacia = 1;
/*14.Qual a media de idade dos funcionários da farmácia 2 (em 2022)? */
select avg(year(dataNascimento_funcionario))- 2022
from funcionario as F
where id_farmacia = 2;
/*15.Qual gênero possui mais cadastros como cliente? */
select genero, count(id_cliente)
from Cliente as C
join Genero as G on G.id_genero = C.id_genero
group by genero;
/*16.Quantos lotes  foram entregues dia 1/1/2021? */
select count(id_lote)
From Entrega as E
join Lote as L on E.id_entrega= L.id_entrega
where  data_entrega = "2021-01-01";
/* 17. Qual bairro tem mais clientes cadastrados?*/
Select bairro_cliente, count(id_cliente) 
from Cliente
group by bairro_cliente
order by count(id_cliente) ;
/*18.Quantas entregas foram realizadas pelo fornecedor de cnpj 12222234? */
select nome_fornecedor, count(id_entrega)
from Fornecedor as F
join Entrega as E on E.id_fornecedor  = F.id_fornecedor 
where cnpj_fornecedor = "12222234";
/* 19. Qual o salario de um gerente?*/
select nome_cargo, salario_funcionario
from Cargo
where nome_cargo = "Gerente";
/* 20.Qual o nome  dos balconistas da loja 2?*/
select nome_cargo, nome_funcionario
from Funcionario as F
join Cargo as C on C.id_cargo =F.id_cargo ;

/*21. Quais produtos o fornecedor Bosh fez no ano de 2020? junção*/
select nome_fornecedor, data_entrega , nome_produto
from Entrega as E
Inner join Fornecedor as F on F.id_fornecedor  = E.id_fornecedor 
Inner join Lote as L on L.id_entrega = E.id_entrega
Inner join  Produto_Lote as PL on PL.id_lote = L.id_lote
Inner join Produto as P on P.id_produto = PL.id_produto
where nome_fornecedor = "Bosh" and  data_entrega  > "2019-12-31" and data_entrega 
<= "2020-12-31"
order by  notaFiscal_entrega;

/*21. Quais produtos o fornecedor Bosh fez no ano de 2020? Cartesiano*/
select  nome_fornecedor, data_entrega , nome_produto
from Entrega as E, Lote as L,  Produto_Lote as PL, Produto as P, Fornecedor as F
where  F.id_fornecedor  = E.id_fornecedor 
and  L.id_entrega = E.id_entrega 
and  PL.id_lote = L.id_lote 
and  P.id_produto = PL.id_produto 
and    nome_fornecedor = "Bosh" and  data_entrega  > "2019-12-31" and data_entrega 
<= "2020-12-31"
order by  notaFiscal_entrega;



/*22. Quantos produtos nunca foram vendidos?*/
select Count(P.nome_produto)
from Produto as P
where P.id_produto not in(
select P.id_produto
from Produto as P
Inner Join Venda_Produto as VP
on VP.id_produto=P.id_produto)
