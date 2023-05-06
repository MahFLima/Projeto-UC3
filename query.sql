select estado, cidade, bairro, count(*) as total from tbl_endereco group by bairro;

/* escola - endereço */
select es.cep, en.logradouro, es.nivel_ensino from tbl_escola as es
inner join tbl_endereco as en
on es.cep = en.cep;

/* turma - unidade - professor */
select t.id_turma, t.nivel, p.nome as professor, e.unidade from tbl_turma as t
inner join tbl_escola as e on e.id_unidade = t.id_unidade
inner join tbl_professor as p on p.id_professor = t.id_professor;

/* turma - professor */
select p.nome, count(*) as 'total de turmas' from tbl_turma as t 
inner join tbl_professor as p on p.id_professor = t.id_professor group by p.nome;

/* responsavel - endereço */
select r.nome, r.cep, e.logradouro from tbl_responsavel as r
inner join tbl_endereco as e
on e.cep = r.cep
where e.bairro = "Jardim Santa Cruz";

/* aluno - endereço */
select a.nome as aluno, a.cep, e.logradouro, a.numero, a.complemento from tbl_aluno as a
inner join tbl_endereco as e on e.cep = a.cep order by logradouro;

/* aluno - responsavel - endereço*/
select r.nome as responsavel, r.cep, e.logradouro, r.numero, r.complemento  from tbl_responsavel as r
inner join tbl_endereco as e on e.cep = r.cep order by logradouro;

/* aluno - responsavel */
select r.nome as responsavel, a.nome as aluno from tbl_aluno as a
inner join tbl_responsavel as r on a.id_responsavel = r.cpf;

/* responsavel - count(aluno) */
select r.nome as responsavel, count(*) as 'total de alunos por responsavel' from tbl_aluno as a
inner join tbl_responsavel as r on a.id_responsavel = r.cpf group by r.nome;

/* endereço - count(aluno) */
select a.cep, e.logradouro, count(*) as 'total de aluno' from tbl_aluno as a
inner join tbl_endereco as e
on e.cep = a.cep group by logradouro order by logradouro;

/* endereço - count(responsavel) */
select r.cep, e.logradouro, count(*) as 'total de responsaveis' from tbl_responsavel as r
inner join tbl_endereco as e on e.cep = r.cep group by logradouro order by logradouro;

/* aluno - unidade - turma */
select a.nome as aluno, e.unidade, t.nivel from tbl_aluno as a
inner join tbl_turma as t on a.id_turma = t.id_turma
inner join tbl_escola as e on t.id_unidade = e.id_unidade;

/* turma - unidade - endereço */
select t.id_turma, t.nivel, e.unidade, e.cep, en.logradouro, e.numero from tbl_escola as e
inner join tbl_turma as t on t.id_unidade = e.id_unidade
inner join tbl_endereco as en on en.cep = e.cep;

/*aluno - turma - unidade - endereço*/
select a.nome as aluno, year(a.data_nascimento), t.id_turma, t.nivel, e.unidade, e.cep, en.logradouro, e.numero from tbl_escola as e
inner join tbl_turma as t on t.id_unidade = e.id_unidade
inner join tbl_endereco as en on en.cep = e.cep
inner join tbl_aluno as a on a.id_turma = t.id_turma;

/* aluno - responsavel - turma - escola - professor*/
select a.id_aluno, a.nome as aluno, e.unidade, p.nome as professor, t.horario, t.nivel, a.data_nascimento, r.nome as responsavel from tbl_aluno as a
inner join tbl_responsavel as r on a.id_responsavel = r.cpf
inner join tbl_turma as t on t.id_turma = a.id_turma
inner join tbl_escola as e on e.id_unidade = t.id_unidade
inner join tbl_professor as p on p.id_professor = t.id_professor;