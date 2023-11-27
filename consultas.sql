--consulta para buscar a margem de lucro por procedimento
SELECT nome, 
(preco - custo)/custo AS margem_lucro
FROM procedimento
GROUP BY nome

--consulta para buscar os procedimentos mais realizados e 
--mais rentáveis
SELECT p.nome, 
COUNT(c.id_consulta) AS consultas_realizadas, 
SUM(p.preco) AS faturamento_bruto
FROM procedimento p
INNER JOIN consulta_procedimento cp
ON p.id_procedimento = cp.id_procedimento
INNER JOIN consulta c
ON cp.id_consulta = c.id_consulta
GROUP BY (p.nome)
ORDER BY 2 DESC, 3 DESC; 

--consulta com o prontuário do paciente
SELECT pa.*, 
c.data, 
p.nome AS nome_procedimento, 
DATE_ADD(c.data, INTERVAL p.periodicidade DAY) AS retorno
FROM paciente pa
INNER JOIN consulta c
ON c.id_paciente = pa.id_paciente
INNER JOIN procedimento_consulta pc
ON pc.id_consulta = c.id_consulta
INNER JOIN procedimento p
ON p.id_procedimento = pc.id_procedimento
ORDER BY nome, 9 DESC                


--consulta para buscar as consultas, trazendo informações
--do paciente e do funcionário responsável. 
SELECT f.nome AS Funcionario, p.nome AS Paciente, c.data as Data
FROM consulta c
JOIN funcionario f ON c.id_funcionario = f.matricula
JOIN paciente p ON c.id_paciente = p.codigo;

--consulta para mostrar quantas consultas foram realizadas por cada funcionário.
SELECT f.nome AS Funcionario, COUNT(c.codigo) AS Numero_de_Consultas
FROM consulta c
JOIN funcionario f ON c.id_funcionario = f.matricula
GROUP BY f.nome;

--consulta para retornar, de forma ordenada, os produtos mais utilizados. 
SELECT p.nome AS Produto, COUNT(pp.id_produto) AS Numero_de_Uso
FROM procedimento_produto pp
JOIN produto p ON pp.id_produto = p.codigo
GROUP BY p.nome
ORDER BY Numero_de_Uso DESC;

--consulta para retornar a última consulta de cada paciente, de forma ordenada.
SELECT p.nome AS Paciente, MAX(c.data) AS Ultima_Consulta
FROM consulta c
JOIN paciente p ON c.id_paciente = p.codigo
GROUP BY p.nome
ORDER BY Ultima_Consulta DESC;