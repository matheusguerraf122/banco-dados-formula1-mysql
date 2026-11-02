# Banco de Dados Fórmula 1 - MySQL

Projeto acadêmico desenvolvido com o objetivo de praticar conceitos de **Banco de Dados Relacional utilizando MySQL**, através da criação e manipulação de um banco de dados baseado no universo da Fórmula 1.

O projeto contém tabelas relacionadas a países, equipes, pilotos, corridas e participantes, além de diferentes consultas SQL utilizadas durante os estudos da disciplina.

## Estrutura do Banco de Dados

O banco é composto pelas seguintes tabelas:

- **paises** — armazena os países cadastrados no sistema;
- **equipes** — registra as equipes e seus respectivos países;
- **pilotos** — contém os pilotos e suas equipes;
- **corridas** — registra os Grandes Prêmios e quantidade de voltas;
- **participantes** — relaciona pilotos e corridas, armazenando também a posição de largada.

## 🛠️ Tecnologias Utilizadas

- MySQL
- MySQL Workbench
- SQL

## 📚 Conceitos SQL Aplicados

Durante o desenvolvimento foram utilizados conceitos como:

- `CREATE TABLE`
- Chaves primárias (`PRIMARY KEY`)
- Chaves estrangeiras (`FOREIGN KEY`)
- Relacionamento entre tabelas
- `INSERT INTO`
- `SELECT`
- `INNER JOIN`
- `WHERE`
- `LIKE`
- `IN`
- `ALTER TABLE`
- `UPDATE`
- `CASE`
- `BETWEEN`
- `AVG`
- `ROUND`
- `GROUP BY`
- `DISTINCT`
- `ORDER BY`

## Arquivo Principal

O código SQL completo do projeto está disponível no arquivo:

`banco_formula1.sql`

## Como Executar

1. Instale o **MySQL Server** e o **MySQL Workbench**.
2. Abra o MySQL Workbench e conecte-se ao servidor.
3. Crie o banco de dados:

```sql
CREATE DATABASE IF NOT EXISTS db_Formula1;
```

4. Selecione o banco:

```sql
USE db_Formula1;
```

5. Abra o arquivo `banco_formula1.sql`.
6. Execute os comandos SQL para criar as tabelas, inserir os dados e realizar as consultas.

## Relacionamentos

As tabelas utilizam chaves estrangeiras para estabelecer relacionamentos entre os dados.

Exemplos:

- Uma **equipe** pertence a um país;
- Um **piloto** pertence a um país e a uma equipe;
- Uma **corrida** acontece em um país;
- A tabela **participantes** relaciona pilotos às corridas.

## Objetivo do Projeto

Este projeto foi desenvolvido como parte dos estudos de Banco de Dados durante o curso de **Análise e Desenvolvimento de Sistemas**, com o objetivo de aplicar na prática conceitos de modelagem, relacionamento entre tabelas e manipulação de dados utilizando SQL.

## 📄 Licença

Este projeto está sob a licença **MIT**.
