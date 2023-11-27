USE db_clinicaestetica;

-- paciente(CPF PK, nome, telefone, email, data_nascimento, endereco(CEP, numero, cidade, estado, complemento))
CREATE TABLE paciente(
    id_paciente INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cpf VARCHAR(11), 
    nome VARCHAR(200) NOT NULL, 
    telefone VARCHAR (11) NOT NULL UNIQUE, 
    data_nascimento DATE NOT NULL UNIQUE, 
    endereco VARCHAR(255)
);

-- funcionario(matricula PK, CPF, nome, telefone, data_nascimento)
CREATE TABLE funcionario(
    matricula INT UNSIGNED NOT NULL PRIMARY KEY, 
    cpf VARCHAR(11), 
    nome VARCHAR(200) NOT NULL, 
    telefone VARCHAR (11) NOT NULL UNIQUE, 
    data_nascimento DATE NOT NULL UNIQUE
);

-- procedimento(codigo PK, nome, preco, custo, quantidade_produto, duracao, quantidade_sessoes, periodicidade)
CREATE TABLE procedimento(
	id_procedimento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
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
    id_produto INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    quantidade INT NOT NULL, 
    custo_unitario FLOAT NOT NULL
);

-- consulta(codigo PK, data, duracao total, valor, id_paciente, id_procedimento)
CREATE TABLE consulta(
    id_consulta INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL, 
    valor FLOAT NOT NULL,
    duracao FLOAT NOT NULL, 
    id_paciente INT UNSIGNED, 
    CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente), 
	id_procedimento INT UNSIGNED, 
    CONSTRAINT fk_procedimento FOREIGN KEY (id_procedimento) REFERENCES procedimento(id_procedimento),
    id_funcionario INT UNSIGNED, 
    CONSTRAINT fk_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(matricula)
);

-- procedimento_produto(codigo PK, id_procedimento, id_produto)
CREATE TABLE procedimento_produto(
    codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_produto INT UNSIGNED,
    CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto), 
	id_procedimento INT UNSIGNED, 
    CONSTRAINT fk_procedimento_produto FOREIGN KEY (id_procedimento) REFERENCES procedimento(id_procedimento)
);

-- procedimento_consulta(codigo PK, id_procedimento, id_consulta)
CREATE TABLE procedimento_consulta(
    codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_procedimento INT UNSIGNED,
    CONSTRAINT fk_procedimento_proc FOREIGN KEY (id_procedimento) REFERENCES procedimento(id_procedimento), 
	id_consulta INT UNSIGNED, 
    CONSTRAINT fk_procedimento_consulta FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
)                                   

