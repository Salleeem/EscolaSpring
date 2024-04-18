-- Tabela de Clientes
CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

-- Tabela de Funcionários
CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    id_supervisor INT REFERENCES funcionario(id)
);

-- Tabela de Áreas de Trabalho (ex: cozinha, atendimento, entrega)
CREATE TABLE area_trabalho (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela de Pizzas
CREATE TABLE pizza (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10, 2)
);

-- Tabela de Ingredientes
CREATE TABLE ingrediente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela de Ingredientes das Pizzas (relacionamento muitos para muitos)
CREATE TABLE ingrediente_pizza (
    id SERIAL PRIMARY KEY,
    id_pizza INT REFERENCES pizza(id),
    id_ingrediente INT REFERENCES ingrediente(id)
);

-- Tabela de Pedidos
CREATE TABLE pedido (
    id SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES cliente(id),
    id_status INT REFERENCES status_pedido(id),
    id_responsavel INT REFERENCES funcionario(id)
);

-- Tabela de Itens de Pedido
CREATE TABLE item_pedido (
    id SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedido(id),
    id_pizza INT REFERENCES pizza(id),
    id_tamanho INT REFERENCES tamanho(id)
);

-- Tabela de Tamanhos de Pizza (ex: pequena, média, grande)
CREATE TABLE tamanho (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(50)
);

-- Tabela de Status de Pedido (ex: em andamento, entregue, cancelado)
CREATE TABLE status_pedido (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

-- Tabela de Promoções
CREATE TABLE promocao (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    desconto NUMERIC(5, 2)
);

-- Tabela de Promoções das Pizzas (relacionamento muitos para muitos)
CREATE TABLE promocao_pizza (
    id SERIAL PRIMARY KEY,
    id_pizza INT REFERENCES pizza(id),
    id_promocao INT REFERENCES promocao(id)
);

-- Tabela de Detalhes de Entrega
CREATE TABLE detalhes_entrega (
    id SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedido(id),
    endereco_entrega VARCHAR(200),
    data_entrega TIMESTAMP
);
