-- PROJETO INTEGRADOR II | Wellyson Rodrigues de Sousa | RGM: 40356698
-- Sistema SGTI - Banco de Dados SQL (3ª Forma Normal)

CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    perfil VARCHAR(20) NOT NULL,
    setor VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS categorias_sla (
    id_categoria_sla INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_categoria VARCHAR(60) NOT NULL UNIQUE,
    nivel_prioridade VARCHAR(20) NOT NULL,
    prazo_horas INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS ativos_ti (
    id_ativo INTEGER PRIMARY KEY AUTOINCREMENT,
    tag_patrimonio VARCHAR(30) NOT NULL UNIQUE,
    hostname VARCHAR(50) NOT NULL UNIQUE,
    tipo_equipamento VARCHAR(40) NOT NULL,
    ip_rede_cabeada VARCHAR(15) NOT NULL,
    status_operacional VARCHAR(25) NOT NULL DEFAULT 'OPERACIONAL'
);

CREATE TABLE IF NOT EXISTS chamados (
    id_chamado INTEGER PRIMARY KEY AUTOINCREMENT,
    protocolo VARCHAR(20) NOT NULL UNIQUE,
    id_solicitante INTEGER NOT NULL,
    id_tecnico INTEGER,
    id_ativo INTEGER NOT NULL,
    id_categoria_sla INTEGER NOT NULL,
    titulo VARCHAR(120) NOT NULL,
    descricao TEXT NOT NULL,
    status VARCHAR(25) NOT NULL DEFAULT 'ABERTO',
    solucao_tecnica TEXT,
    data_abertura TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_fechamento TIMESTAMP,
    FOREIGN KEY (id_solicitante) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_tecnico) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_ativo) REFERENCES ativos_ti(id_ativo),
    FOREIGN KEY (id_categoria_sla) REFERENCES categorias_sla(id_categoria_sla)
);
