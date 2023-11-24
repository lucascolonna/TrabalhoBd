-- Inserindo dados na tabela paciente
INSERT INTO paciente(codigo, cpf, nome, telefone, data_nascimento, endereco) VALUES
(1, '12345678901', 'João Silva', '1234567890', '1980-01-01', 'Rua Principal 123, Cidade, Estado'),
(2, '23456789012', 'Ana Santos', '2345678901', '1990-01-01', 'Avenida Central 456, Cidade, Estado');

-- Inserindo dados na tabela funcionario
INSERT INTO funcionario(matricula, cpf, nome, telefone, data_nascimento) VALUES
(1, '34567890123', 'Carlos Pereira', '3456789012', '1985-01-01'),
(2, '45678901234', 'Marta Oliveira', '4567890123', '1986-01-01');

-- Inserindo dados na tabela procedimento
INSERT INTO procedimento(nome, preco, custo, quantidade_produto, quantidade_sessoes, duracao, periodicidade) VALUES
('botox', 500.0, 200.0, 1, 1, 1.0, 30),
('lipoaspiração', 3000.0, 1500.0, 3, 2, 2.0, 60),
('preenchimento', 700.0, 350.0, 2, 1, 1.5, 45);

-- Inserindo dados na tabela produto
INSERT INTO produto(nome, quantidade, custo_unitario) VALUES
('toxina', 10, 500.0);

-- Inserindo dados na tabela consulta
INSERT INTO consulta(data, valor, duracao, id_paciente, id_procedimento, id_funcionario) VALUES
('2023-01-01', 500.0, 1.0, 1, 1, 1),
('2023-02-01', 3000.0, 2.0, 2, 2, 2);