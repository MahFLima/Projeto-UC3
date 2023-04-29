# Banco de Dados Relacional de Escolas Municipais

Este repositório contém um modelo de banco de dados relacional para gerenciar informações de escolas municipais, incluindo unidades, turmas, professores, alunos e responsáveis legais. O banco de dados foi projetado para ser usado por uma prefeitura ou órgão municipal responsável pelo gerenciamento das escolas.

## Entidades

O modelo de dados inclui as seguintes entidades:

- Escola: representa uma escola municipal, contendo informações como nome, cep e número.
- Turma: representa uma classe em uma escola, contendo informações como nível de ensino, série, turno.
- Professor: representa um professor que ministra aulas em uma turma.
- Aluno: representa um estudante matriculado em uma turma, contendo informações como nome, data de nascimento e endereço.
- Responsável Legal: representa o responsável legal de um aluno.
- Endereço: contendo todos os endereços de Taboão da Serra

## Relacionamentos

As entidades estão relacionadas da seguinte maneira:

- Cada unidade pode ter várias turmas.
- Cada turma é ministrada por um único professor.
- Cada turma tem vários alunos matriculados.
- Cada aluno tem um único responsável legal.
- Cada aluno, responsável e escola possui um endereço 


