/* Cria banco de dados */
CREATE DATABASE IF NOT EXISTS u182960144_sys
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
/* Ativa banco de dados */
USE u182960144_sys;
/* Cria entidade administrador */
CREATE TABLE IF NOT EXISTS administrador(
    id INT NOT NULL AUTO_INCREMENT,
    matricula VARCHAR(10) DEFAULT 'admgtech' NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '#2019.2AaPpR' NOT NULL,
    privilegio VARCHAR(15) DEFAULT 'ADMINISTRADOR' NOT NULL,
    nome VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade instrutor */
CREATE TABLE IF NOT EXISTS instrutor(
    id INT NOT NULL AUTO_INCREMENT,
    matricula INT(10) NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '123' NOT NULL,
    privilegio VARCHAR(15) DEFAULT 'INSTRUTOR' NOT NULL,
    nome VARCHAR(30) NOT NULL,
    curso VARCHAR(15) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade usuariostart */
CREATE TABLE IF NOT EXISTS usuariostart(
    id INT NOT NULL AUTO_INCREMENT,
    matricula INT(10) NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '123' NOT NULL,
    privilegio VARCHAR(15) DEFAULT 'USU�RIO' NOT NULL,
    nome VARCHAR(30) NOT NULL,
    pai VARCHAR(30) DEFAULT 'NC' NOT NULL,
    mae VARCHAR(30) NOT NULL, 
    nascimento DATE DEFAULT '2020-01-13' NOT NULL,
    curso VARCHAR(10) NOT NULL,
    turno ENUM('M','T','N') NOT NULL,
    turma ENUM('U','A','B','C','D','E') NOT NULL,
    foto VARCHAR(50) NOT NULL,
    contato VARCHAR(17) NOT NULL,
    endereco VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(10) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) DEFAULT 'CE' NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade freelancer */
CREATE TABLE IF NOT EXISTS freelancer(
    id INT NOT NULL AUTO_INCREMENT,
    matricula INT(10) NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '123' NOT NULL,
    privilegio VARCHAR(15) DEFAULT 'FREELANCER' NOT NULL,
    nome VARCHAR(30) NOT NULL,
    idinstrutor INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(idinstrutor) REFERENCES instrutor(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade cursos */
CREATE TABLE IF NOT EXISTS cursos(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL UNIQUE,
    carga INT NOT NULL,
    totalaulas INT NOT NULL,
    turma ENUM('A','B','C','D','E') NOT NULL,
    turno ENUM('M','T','N') NOT NULL,
    idinstrutor INT NOT NULL,
    idusuariostart INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(idinstrutor) REFERENCES instrutor(id),
    FOREIGN KEY(idusuariostart) REFERENCES usuariostart(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade escola */
CREATE TABLE IF NOT EXISTS escola(
    id INT NOT NULL AUTO_INCREMENT,
    matricula VARCHAR(10) DEFAULT 'escola' NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '123' NOT NULL,
    privilegio VARCHAR(15) DEFAULT 'ESCOLA' NOT NULL,
    nome VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade gestao */
CREATE TABLE IF NOT EXISTS gestao(
    id INT NOT NULL AUTO_INCREMENT,
    matricula VARCHAR(10) DEFAULT 'gestao' NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '123' NOT NULL,
    privilegio ENUM('0','1','2','3','4','5') NOT NULL,
    nome VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade professor */
CREATE TABLE IF NOT EXISTS professor(
    id INT NOT NULL AUTO_INCREMENT,
    matricula INT(10) NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '123' NOT NULL,
    privilegio VARCHAR(15) DEFAULT 'PROFESSOR' NOT NULL,
    nome VARCHAR(30) NOT NULL,
    disciplina VARCHAR(15) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade colaborador */
CREATE TABLE IF NOT EXISTS colaborador(
    id INT NOT NULL AUTO_INCREMENT,
    matricula INT(10) NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '123' NOT NULL,
    privilegio VARCHAR(15) DEFAULT 'COLABORADOR' NOT NULL,
    nome VARCHAR(30) NOT NULL,
    idprofessor INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(idprofessor) REFERENCES professor(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade aluno */
CREATE TABLE IF NOT EXISTS aluno(
    id INT NOT NULL AUTO_INCREMENT,
    matricula INT(10) NOT NULL UNIQUE,
    senha VARCHAR(15) DEFAULT '123' NOT NULL,
    privilegio VARCHAR(15) DEFAULT 'ALUNO' NOT NULL,
    nome VARCHAR(30) NOT NULL,
    pai VARCHAR(30) DEFAULT 'NC' NOT NULL,
    mae VARCHAR(30) NOT NULL, 
    nascimento DATE DEFAULT '2020-01-13' NOT NULL,
    serie VARCHAR(10) NOT NULL,
    turno ENUM('M','T','N') NOT NULL,
    turma ENUM('U','A','B','C','D','E') NOT NULL,
    foto VARCHAR(50) NOT NULL,
    contato VARCHAR(17) NOT NULL,
    endereco VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(10) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) DEFAULT 'CE' NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade disciplina */
CREATE TABLE IF NOT EXISTS disciplina(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL UNIQUE,
    serie VARCHAR(10) NOT NULL,
    carga INT NOT NULL,
    totalaulas INT NOT NULL,
    turma ENUM('A','B','C','D','E') NOT NULL,
    turno ENUM('M','T','N') NOT NULL,
    bimestre INT NOT NULL,
    idaluno INT NOT NULL,
    idprofessor INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(idaluno) REFERENCES aluno(id),
    FOREIGN KEY(idprofessor) REFERENCES professor(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Cria entidade acesso */
CREATE TABLE IF NOT EXISTS acesso(
    idadministrador INT NOT NULL,
    idinstrutor INT NOT NULL,
    idusuariostart INT NOT NULL,
    idfreelancer INT NOT NULL,
    idcursos INT NOT NULL,
    idescola INT NOT NULL,
    idgestao INT NOT NULL,
    idprofessor INT NOT NULL,
    idcolaborador INT NOT NULL,
    idaluno INT NOT NULL,
    iddisciplina INT NOT NULL,
    FOREIGN KEY(idadministrador) REFERENCES administrador(id),
    FOREIGN KEY(idinstrutor) REFERENCES instrutor(id),
    FOREIGN KEY(idusuariostart) REFERENCES usuariostart(id),
    FOREIGN KEY(idfreelancer) REFERENCES freelancer(id),
    FOREIGN KEY(idcursos) REFERENCES cursos(id),
    FOREIGN KEY(idescola) REFERENCES escola(id),
    FOREIGN KEY(idgestao) REFERENCES gestao(id),
    FOREIGN KEY(idprofessor) REFERENCES professor(id),
    FOREIGN KEY(idcolaborador) REFERENCES colaborador(id),
    FOREIGN KEY(idaluno) REFERENCES aluno(id),
    FOREIGN KEY(iddisciplina) REFERENCES disciplina(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* Termina query*/