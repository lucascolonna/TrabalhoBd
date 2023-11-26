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