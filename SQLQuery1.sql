create database ex_alg

go

use ex_alg

go

-- Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles

declare @num int

set @num = 30

if (@num % 2 = 0 and @num % 3 = 0 and @num % 5 = 0  ) begin
	
	print cast(@num as varchar(10)) + ' é multiplo de 2, 3 e 5'

end else begin
	
	print cast(@num as varchar(10)) + ' não é multiplo de 2, 3 e 5'

end

go 

-- Fazer um algoritmo que leia 3 números e mostre o maior e o menor

declare @num1 int, @num2 int, @num3 int

set @num1 = 5
set @num2 = 48
set @num3 = 8

if (@num1 > @num2 and @num1 > @num3) begin
	
	if (@num2 > @num3) begin

		print cast(@num1 as varchar(10)) + ' É o maior numero dos três e ' + cast(@num3 as varchar(10)) + ' é o menor'

	end else begin

		print cast(@num1 as varchar(10)) + ' É o maior numero dos três e ' + cast(@num2 as varchar(10)) + ' é o menor'

	end

end else if (@num2 > @num3) begin

	if (@num1 > @num3) begin
	
	print cast(@num2 as varchar(10)) + ' É o maior numero dos três e ' + cast(@num3 as varchar(10)) + ' é o menor'

	end else begin

	print cast(@num2 as varchar(10)) + ' É o maior numero dos três e ' + cast(@num1 as varchar(10)) + ' é o menor'

	end
end

-- c) Fazer um algoritmo que calcule os 15 primeiros termos da série (1,1,2,3,5,8,13,21,...) E calcule a soma dos 15 termos

declare @soma int, @n1 int, @n2 int, @cont int, @n3 int

set @n1 = 0
set @n2 = 1
set @n3 = 0
set @soma = 0
set @cont = 0

while (@cont <= 15) begin
	

	set @n3 = @n2 + @n1
	if(@cont > 0) begin
	set @n1 = @n2 
	set @n2 = @n3
	end
	set @soma = @soma + @n3
	set @cont = @cont + 1
end
	print @soma

go

-- Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em minúsculo (Usar funções UPPER e LOWER)

declare @frase varchar(max), @i int

set @frase = 'O Colevati é o melhor professor da Fatec'
set @i = 0

select value from STRING_SPLIT (upper(@frase), ' ')
select value from STRING_SPLIT (lower(@frase), ' ')

go

-- Considerando a tabela abaixo, gere uma massa de dados, com 100 registros, para fins de teste com as regras estabelecidas (Não usar constraints na criação da tabela)

create table Computador (
	id int not null,
	marca varchar(40) not null,
	qtdRam int not null,
	tipoHd varchar(10) not null,
	qtdHd int not null,
	freqCpu decimal(7, 2)
	PRIMARY KEY (id)
)

declare @nmarca int, @random int, @tipo varchar(10), @id int, @random2 int, @qtd int, @freq decimal(7,2), @contador int

set @nmarca = 1
set @id = 10001
set @contador = 0


while (@contador < 100) begin
set @random = CAST(RAND() * 4 + 1 AS INT)
set @tipo = ''
set @random2 = 0
set @freq = 0.0

if(@id % 3 = 0) begin
	set @tipo = 'HDD'
end 
	else if (@id % 2 = 0) begin
		set @tipo = 'SSD'
	end else begin
		set @tipo = 'M2 NVME'
		end

if(@tipo = 'HDD') begin
	set @random2 = Cast(RAND() * 3 + 1 as int)
	if(@random2 = 1) begin
		set @qtd = 500
	end else if (@random2 = 2) begin
		set @qtd = 1000
	end else begin
		set @qtd = 2000
	end
end else if (@tipo ='SSD' or @tipo = 'M2 NVME') begin
	set @random2 = Cast(RAND() * 3 + 1 as int)
	if(@random2 = 1) begin
		set @qtd = 128
	end else if (@random2 = 2) begin
		set @qtd = 256
	end else begin
		set @qtd = 512
	end
end

set @freq = rand() * 1.5 + 1.70

insert into Computador values (@id, 'marca ' + cast(@nmarca as varchar(10)), 
		CASE @random
        WHEN 1 THEN 2
        WHEN 2 THEN 4
        WHEN 3 THEN 8
        WHEN 4 THEN 16
		END, @tipo, @qtd, @freq)

		set @contador = @contador + 1
		set @nmarca = @nmarca + 1
		set @id = @id + 1

end

select * from Computador

delete from Computador where id = 10001