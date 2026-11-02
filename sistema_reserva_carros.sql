USE db_Formula1;







CREATE TABLE paises (

  codigo VARCHAR(5) PRIMARY KEY,

  nome VARCHAR(50) NOT NULL

);



CREATE TABLE equipes (

  sigla VARCHAR(10) PRIMARY KEY,

  nome VARCHAR(50) NOT NULL,

  cod_pais VARCHAR(5) NOT NULL,

  FOREIGN KEY (cod_pais) REFERENCES paises(codigo)

);



CREATE TABLE pilotos (

  numero INTEGER PRIMARY KEY,

  nome VARCHAR(100) NOT NULL,

  cod_pais VARCHAR(5) NOT NULL,

  sigla_equipe VARCHAR(10) NOT NULL,

  FOREIGN KEY (cod_pais) REFERENCES paises(codigo),

  FOREIGN KEY (sigla_equipe) REFERENCES equipes(sigla)

);



CREATE TABLE corridas (

  sigla_gp VARCHAR(10) PRIMARY KEY,

  nome_gp VARCHAR(100) NOT NULL,

  cod_pais VARCHAR(5) NOT NULL,

  voltas INTEGER NOT NULL,

  FOREIGN KEY (cod_pais) REFERENCES paises(codigo)

);



CREATE TABLE participantes (

  sigla_gp VARCHAR(10),

  num_piloto INTEGER,

  posicao_larg INTEGER NOT NULL,

  PRIMARY KEY (sigla_gp, num_piloto),

  FOREIGN KEY (sigla_gp) REFERENCES corridas(sigla_gp),

  FOREIGN KEY (num_piloto) REFERENCES pilotos(numero)

);







INSERT INTO paises (codigo, nome) VALUES

('BRA', 'Brasil'),

('ITA', 'Itália'),

('FRA', 'França'),

('GBR', 'Reino Unido'),

('GER', 'Alemanha'),

('ESP', 'Espanha'),

('USA', 'Estados Unidos'),

('JPN', 'Japão'),

('AUS', 'Austrália'),

('CAN', 'Canadá'),

('AUT', 'Áustria'),

('CHE', 'Suíça');







INSERT INTO equipes (sigla, nome, cod_pais) VALUES

('FER', 'Ferrari', 'ITA'),

('MCL', 'McLaren', 'GBR'),

('MER', 'Mercedes', 'GER'),

('RBR', 'Red Bull Racing', 'AUT'),

('WIL', 'Williams', 'GBR'),

('ALP', 'Alpine', 'FRA'),

('AST', 'Aston Martin', 'GBR'),

('SAU', 'Sauber', 'CHE'),

('HAS', 'Haas', 'USA'),

('LOT', 'Lotus', 'GBR');





INSERT INTO pilotos

(numero, nome, cod_pais, sigla_equipe) VALUES

(1, 'Ayrton Senna', 'BRA', 'MCL'),

(2, 'Felipe Massa', 'BRA', 'FER'),

(3, 'Nelson Piquet', 'BRA', 'WIL'),

(4, 'Rubens Barrichello', 'BRA', 'FER'),

(5, 'Emerson Fittipaldi', 'BRA', 'LOT'),

(6, 'Jarno Trulli', 'ITA', 'LOT'),

(7, 'Giancarlo Fisichella', 'ITA', 'FER'),

(8, 'Andrea de Cesaris', 'ITA', 'MCL'),

(9, 'Alain Prost', 'FRA', 'ALP'),

(10, 'Pierre Gasly', 'FRA', 'ALP');





INSERT INTO corridas

(sigla_gp, nome_gp, cod_pais, voltas) VALUES

('GPBRA', 'Grande Prêmio do Brasil', 'BRA', 71),

('GPITA', 'Grande Prêmio da Itália', 'ITA', 53),

('GPFRA', 'Grande Prêmio da França', 'FRA', 53),

('GPGBR', 'Grande Prêmio da Grã-Bretanha', 'GBR', 52),

('GPGER', 'Grande Prêmio da Alemanha', 'GER', 67),

('GPESP', 'Grande Prêmio da Espanha', 'ESP', 66),

('GPAUS', 'Grande Prêmio da Austrália', 'AUS', 58),

('GPJPN', 'Grande Prêmio do Japão', 'JPN', 53),

('GPCAN', 'Grande Prêmio do Canadá', 'CAN', 70),

('GPUSA', 'Grande Prêmio dos Estados Unidos', 'USA', 56);







INSERT INTO participantes

(sigla_gp, num_piloto, posicao_larg) VALUES

('GPBRA', 1, 1),

('GPITA', 2, 2),

('GPFRA', 3, 3),

('GPGBR', 4, 4),

('GPGER', 5, 5),

('GPESP', 6, 6),

('GPAUS', 7, 7),

('GPJPN', 8, 8),

('GPCAN', 9, 9),

('GPUSA', 10, 10);







SELECT upper(nome)

FROM paises

WHERE nome LIKE 'B%L';







SELECT pilotos.nome

FROM pilotos

INNER JOIN paises

  ON pilotos.cod_pais = paises.codigo

WHERE UPPER(paises.nome) IN ('BRASIL', 'ITÁLIA', 'FRANÇA');





SELECT nome

FROM pilotos;





SELECT

  nome_gp AS Grande_Premio,

  voltas AS Quantidade_de_Voltas

FROM corridas;





SELECT

  pilotos.nome AS Nome_Piloto,

  paises.nome AS Pais

FROM pilotos

INNER JOIN paises

  ON pilotos.cod_pais = paises.codigo;





ALTER TABLE pilotos

ADD COLUMN salario DECIMAL(10,2);





UPDATE pilotos

SET salario = CASE

  WHEN numero BETWEEN 1 AND 5 THEN 80000.00

  WHEN numero BETWEEN 6 AND 8 THEN 95000.00

  ELSE 110000.00

END

WHERE numero > 0;





SELECT nome, salario

FROM pilotos

WHERE salario BETWEEN 70000.00 AND 100000.00;





SELECT

  cod_pais,

  round(AVG(salario),2) AS Media_Salarial

FROM pilotos

GROUP BY cod_pais;





SELECT DISTINCT salario

FROM pilotos

ORDER BY salario ASC;
