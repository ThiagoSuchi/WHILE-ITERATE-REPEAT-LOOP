-- Declaração iterate:
DELIMITER //
create procedure acumula_iterate(limite tinyint unsigned)-- TINYINT é um tipo de dado numérico que representa números inteiros muito pequenos. 
begin													 -- UNSIGNED é usado para indicar que um campo ou variável não pode ter valores negativos.
	declare contador tinyint unsigned default 0;
    declare soma int unsigned default 0;
    teste: loop
		set contador = contador + 1;
        set soma = soma + contador;
        if contador < limite then
			iterate teste;-- ITERATE é uma instrução usada dentro de um loop para reiniciar uma iteração do loop
		end if;
        leave teste;-- LEAVE é usado dentro de loops (como LOOP, REPEAT, ou WHILE) para sair imediatamente de um loop, interrompendo sua execução.
	end loop teste;
    select soma;
end //
DELIMITER ;

call acumula_iterate(10);

-- Declaração while:
DELIMITER $$
create procedure pares(limite tinyint unsigned)
main: begin
	declare contador tinyint default 0;
    meuloop: while contador < limite do
		set contador = contador + 1;
        if mod(contador, 2) then -- MOD é uma função que retorna o resto da divisão de dois números.
		-- se retornar 1 na condição é true, se retornar 0 e false(ímpar)!
			iterate meuloop;-- se for ímpar o laço se repete.
		end if;
        select concat(contador, " é um número par") as valor;-- se for par ele cai dentro desse select!
	end while;
end $$
DELIMITER ;

call pares(20);
