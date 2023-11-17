USE db_clinicaestetica;

-- paciente(CPF PK, nome, telefone, email, data_nascimento, endereco(CEP, numero, cidade, estado, complemento))
CREATE TABLE paciente(
	CPF INT UNSIGNED NOT NULL PRIMARY KEY, 
    nome VARCHAR(200) NOT NULL, 
    telefone VARCHAR (11) NOT NULL UNIQUE, 
    data_nascimento DATE NOT NULL UNIQUE, 
    endereco VARCHAR(255)
);

-- procedimento(codigo PK, nome, preco, custo, quantidade_produto, duracao, quantidade_sessoes, periodicidade)
CREATE TABLE procedimento (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL,
    custo FLOAT NOT NULL,
    quantidade_produto INT NOT NULL,
    quantidade_sessoes INT NOT NULL,
    duracao FLOAT NOT NULL,
    periodicidade INT NOT NULL
);

-- produto(codigo PK, nome, quantidade, custo_unitario)
CREATE TABLE produto(
    codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    quantidade INT NOT NULL, 
    custo_unitario FLOAT NOT NULL
);

-- consulta(codigo PK, data, duracao total, valor, id_paciente, id_procedimento)
CREATE TABLE consulta(
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL, 
    valor FLOAT NOT NULL,
    duracao FLOAT NOT NULL, 
    id_paciente INT UNSIGNED, 
    CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(CPF), 
	id_procedimento INT UNSIGNED, 
    CONSTRAINT fk_procedimento FOREIGN KEY (id_procedimento) REFERENCES procedimento(codigo)
)