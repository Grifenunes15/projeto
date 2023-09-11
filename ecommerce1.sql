CREATE DATABASE ECOMMERCE;
USE ECOMMERCE;
drop database ECOMMERCE;
CREATE TABLE cliente(
    idCliente int auto_increment primary key,
    fnome_cliente varchar (20),
    lnome_cliente varchar (20),
    CPF char(11) not null,
    constraint unique_cpf_cliente unique (CPF),
    endereco varchar (50),
    email varchar (50),
    telefone char(11)
);

drop TABLE cliente;
insert into cliente values(not null,'Grife','Nunes','85236548','SP','grife@gmail.com','945637125'),
(not null,'Paulo','Cabral','52636548','RJ','paulo@gmail.com','944537125'),
(not null,'Maria','Pedro','85886548','SP','maria@gmail.com','945637125'),
(not null,'Ana','Paulo','96436548','MG','ana@gmail.com','945637125'),
(not null,'Paula','Nunes','85238547','SP','grife@gmail.com','945637125'),
(not null,'Ana','Abrantes','85869547','SP','ana@gmail.com','945623125'),
(not null,'Dádiva','Alencar','85238777','RJ','dadiva@gmail.com','945417125'),
(not null,'Carolina','Nunes','85230247','SP','carolina@gmail.com','945637123');

select*from cliente;

desc cliente;

delete from cliente where idCliente=4 or idCliente=5;
alter table cliente add pais varchar(100);
update cliente set fnome_cliente ='Carlos', lnome_cliente ='Augusto' where idCliente='6';
update cliente set idCliente =9 where idCliente= 4;
select*from cliente order by  fnome_cliente;
select*from cliente where fnome_cliente='Ana';



 
CREATE TABLE pagamento(
    idPagamento int,
    idCliente int,
    tipoPagamento enum
    ('Boleto','Cartão'),
    limitePagamento float,
    validadeCartao date,
    primary key(idCliente,idPagamento)
);
drop
 table pagamento;
 
select*from pagamento;

desc pagamento;




select * from pagamento;
CREATE TABLE pedido(
     idpagamento int not null primary key,
     descricao varchar (255),
     frete float default 10,
     data_pedido date,
     data_entrega date,
     pagamentoCash bool default false,
     pagamento_id int not null,
     cliente_id int not null,
     foreign key (pagamento_id) references pedido(idPagamento),
     foreign key (cliente_id) references cliente(idCliente)
);
drop table pedido;
insert into pedido values(not null,'2023-08-27','2023-09-02','cartao');
select * from pedido;
drop table pedido;  
 CREATE TABLE produto(
      idProduto int auto_increment primary key not null,
      nome_produto varchar (30) not null,
      categoria enum('eletronicos','roupas','calcados','mobilias'),
      avaliacao float default 0,
      tamanho varchar(10)
 );
 drop table produto;
 insert into produto values(not null,'camisa','',0,'s');
 select * from produto;
 
   CREATE TABLE produtoEstoque(
          idEproduto int,
          idProduto int,
          estoque varchar (255),
          quantidade int default 0,
          primary key ( idEproduto,idProduto)
          
   );
   
   select * from produtoEstoque;
   
   CREATE TABLE fornecedor(
     id_fornecedor int auto_increment primary key not null,
     nome_fornecedor varchar (20) not null,
     apelido_fornecedor varchar(20) not null,
     endereco varchar (50) not null,
     telefone char(11) not null,
     CNPJ char (15) not null,
     constraint unique_fornecedor unique(CNPJ)
 );
 drop table fornecedor;
insert into fornecedor values(not null,'António','Carlos','Brasil, Rio de Janeiro','954263125','RJ45'),
(not null,'António','Carlos','Brasil, Rio de Janeiro','954263125','RJ49'),
(not null,'António','Carlos','Brasil, Rio de Janeiro','954263125','RJ42');
 delete from fornecedor where id_fornecedor=4;
alter table fornecedor add data_envio date;
update fornecedor set nome_fornecedor ='Carlos', nome_fornecedor ='Augusto' where idCliente='6';
update fornecedor set id_fornecedor =9 where id_fornecedor= 4;
select*from fornecedor order by  nome_fornecedor;
select*from fornecedor where nome_fornecedor='Ana';
 
 select * from fornecedor;
 
  CREATE TABLE vendedor(
     idvendedor int auto_increment primary key not null,
     nome_forncedor varchar (20) not null,
     endereco varchar (50) not null,
     telefone char(11) not null,
     CNPJ char (15),
     CPF char(9),
     constraint unique_cpf_vendedor unique (CPF),
     constraint unique_cnpj_fornecedor unique(CNPJ)
 );
 drop table vendedor;
  drop table vendedor;
insert into vendedor values(not null,'António','Brasil, Rio de Janeiro','954263125','RJ45','9652145RJ');

 delete from vendedor where id_fornecedor=4;
alter table vendedor add data_envio date;
update vendedor set nome_fornecedor ='Carlos', nome_fornecedor ='Augusto' where idCliente='6';
update vendedor set id_fornecedor =9 where id_fornecedor= 4;
select*from vendedor order by  nome_fornecedor;
select*from vendedor where nome_fornecedor='Ana';
 
 select * from vendedor;
 
 CREATE TABLE produtoVendedor(
     idPvendedor int,
     idProduto int,
     Prodquantidade int default 1,
     primary key (idPvendedor,idProduto),
     constraint fk_produto_vendedor foreign key (idPvendedor) references vendedor(idvendedor),
     constraint fk_produto_produto foreign key (idProduto) references produto(idProduto)
 );
 select * from produtoVendedor;
 drop table fornecedor;
 insert into fornecedor values(not null,'Paulo','Cabral','Portugal','945637125');
 select * from fornecedor;
 
