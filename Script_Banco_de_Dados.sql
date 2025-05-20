--  - INTEGRANTES - -- 

-- CLEYTON ENRIKE DE OLIVEIRA – RM 560485 - Turma 1TDSQ
-- MATHEUS HENRIQUE NASCIMENTO DE FREITAS – RM 560442 - Turma 1TDSQ
-- MATHEUS PINHEIRO ERMACORA MARTIN – RM 557720 - Turma 1TDSZ


-- 1-) Criação das tabelas --
CREATE TABLE C_duvidas_frequentes(
    ID_duvida NUMBER (11) GENERATED AS IDENTITY PRIMARY KEY,
    Pergunta VARCHAR2(100) NOT NULL,
    Resposta VARCHAR2(800),
    ID_Usuario NUMBER(11),
    ID_Idioma NUMBER(11),
    Status CHAR(1) NOT NULL
);

CREATE TABLE C_Idioma(
    ID_Idioma NUMBER (11) GENERATED AS IDENTITY PRIMARY KEY,
    Idioma VARCHAR2(20) NOT NULL,
    ID_Usuario NUMBER(11)
);

CREATE TABLE C_Usuario(
    ID_Usuario NUMBER (11) GENERATED AS IDENTITY PRIMARY KEY,
    Login VARCHAR2(20) NOT NULL UNIQUE,
    Senha VARCHAR2(255) NOT NULL,
    Cargo VARCHAR2(30) NOT NULL,
    Status CHAR(1) NOT NULL
);

CREATE TABLE C_Estacoes(
    ID_Estacoes NUMBER (11) GENERATED AS IDENTITY PRIMARY KEY,
    Nome_estacao VARCHAR2(50) NOT NULL UNIQUE,
    Status VARCHAR2(10) NOT NULL,
    ID_Usuario NUMBER(11)
);

CREATE TABLE C_Linhas(
    ID_Linha NUMBER (11) GENERATED AS IDENTITY PRIMARY KEY,
    Nome_linha VARCHAR2(50) NOT NULL UNIQUE,
    Status VARCHAR2(10) NOT NULL,
    ID_Usuario NUMBER(11)
);

CREATE TABLE C_Estacao_Linha(
    ID_Estacao_Linha NUMBER (11) GENERATED AS IDENTITY PRIMARY KEY,
    ID_Estacoes NUMBER(11),
    ID_Linha NUMBER(11)
);

CREATE TABLE C_Busca_Estacoes(
    ID_Busca NUMBER (11) GENERATED AS IDENTITY PRIMARY KEY,
    Nome_Estacao_Busca VARCHAR2(50) NOT NULL,
    ID_Usuario NUMBER(11)
);

-- 2-) Adição das chaves estrangeiras -- 
ALTER TABLE C_duvidas_frequentes ADD CONSTRAINT FK_ID_USUARIO_DUVIDA FOREIGN KEY (ID_Usuario) REFERENCES C_Usuario(ID_Usuario);
ALTER TABLE C_duvidas_frequentes ADD CONSTRAINT FK_ID_IDIOMA_DUVIDA FOREIGN KEY (ID_Idioma) REFERENCES C_Idioma(ID_Idioma);

ALTER TABLE C_Idioma ADD CONSTRAINT FK_ID_USUARIO_IDIOMA FOREIGN KEY (ID_Usuario) REFERENCES C_Usuario(ID_Usuario);

ALTER TABLE C_Estacoes ADD CONSTRAINT FK_ID_USUARIO_ESTACOES FOREIGN KEY (ID_Usuario) REFERENCES C_Usuario(ID_Usuario);

ALTER TABLE C_Linhas ADD CONSTRAINT FK_ID_USUARIO_LINHAS FOREIGN KEY (ID_Usuario) REFERENCES C_Usuario(ID_Usuario);

ALTER TABLE C_Estacao_Linha ADD CONSTRAINT FK_ID_Estacoes FOREIGN KEY (ID_Estacoes) REFERENCES C_Estacoes(ID_Estacoes);
ALTER TABLE C_Estacao_Linha ADD CONSTRAINT FK_ID_Linha FOREIGN KEY (ID_Linha) REFERENCES C_Linhas(ID_Linha);

ALTER TABLE C_Busca_Estacoes ADD CONSTRAINT FK_ID_USUARIO_BUSCA FOREIGN KEY (ID_Usuario) REFERENCES C_Usuario(ID_Usuario);

-- 3-) Inserts nas tabelas --
INSERT INTO C_Usuario (Login, Senha, Cargo, Status) VALUES ('ES@5948', '193420', 'Engenheiro de Sistemas', '1');
INSERT INTO C_Usuario (Login, Senha, Cargo, Status) VALUES ('CT@4078', '496305', 'Controlador de Trafego', '1');
INSERT INTO C_Usuario (Login, Senha, Cargo, Status) VALUES ('SO@1904', '104863', 'Supervisor de Operacoes', '1');
INSERT INTO C_Usuario (Login, Senha, Cargo, Status) VALUES ('CCO@1468', '702357', 'Operador de Centro de Controle', '1');
INSERT INTO C_Usuario (Login, Senha, Cargo, Status) VALUES ('N/A', 'N/A', 'Convidado', '1');

INSERT INTO C_Busca_Estacoes (Nome_Estacao_Busca, ID_Usuario) VALUES ('Jurubatuba', 5);
INSERT INTO C_Busca_Estacoes (Nome_Estacao_Busca, ID_Usuario) VALUES ('Armênia', 5);
INSERT INTO C_Busca_Estacoes (Nome_Estacao_Busca, ID_Usuario) VALUES ('Jundiapeba', 5);
INSERT INTO C_Busca_Estacoes (Nome_Estacao_Busca, ID_Usuario) VALUES ('Luz', 5);
INSERT INTO C_Busca_Estacoes (Nome_Estacao_Busca, ID_Usuario) VALUES ('Amador Bueno', 5);

INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 1 – Azul', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 2 – Verde', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 3 – Vermelha', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 4 – Amarela', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 5 – Lilás', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 7 – Rubi', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 8 – Diamante', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 9 – Esmeralda', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 10 – Turquesa', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 11 – Coral', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 12 – Safira', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 13 – Jade', 'Ativa', 1);
INSERT INTO C_Linhas (Nome_linha, Status, ID_Usuario) VALUES ('Linha 15 – Prata', 'Ativa', 1);

INSERT INTO C_Idioma (Idioma, ID_Usuario) VALUES ('Português', 1);
INSERT INTO C_Idioma (Idioma, ID_Usuario) VALUES ('Inglês', 1);
INSERT INTO C_Idioma (Idioma, ID_Usuario) VALUES ('Espanhol', 1);
INSERT INTO C_Idioma (Idioma, ID_Usuario) VALUES ('Francês', 1);
INSERT INTO C_Idioma (Idioma, ID_Usuario) VALUES ('Chinês Mandarim', 1);

INSERT INTO C_duvidas_frequentes (Pergunta, Resposta, ID_Usuario, ID_Idioma, Status) VALUES ('Horário de funcionamento', 'Horário Geral: Das 4h até às 23:59 Observações: - Este horário pode ser prolongado em ocasiões especiais - Em feriados, este horário pode ser reduzido', 1, 1, '1');
INSERT INTO C_duvidas_frequentes (Pergunta, Resposta, ID_Usuario, ID_Idioma, Status) VALUES ('Compra de bilhetes', 'Tarifa: - A tarifa é de R$5, mas pode sofrer alteraçõs em casos de reajuste Como Comprar Passagens: - Máquinas Automáticas: Disponíveis em todas as estações, permitem a compra de bilhetes. - Bilheteiras: Algumas estações possuem bilheteiras onde você pode comprar passagens diretamente com uma pessoa', 1, 1, '1');
INSERT INTO C_duvidas_frequentes (Pergunta, Resposta, ID_Usuario, ID_Idioma, Status) VALUES ('Frequência de Trens', 'Linha 7-Rubi: Intervalos de 6 a 15 minutos, dependendo do horário.Linha 8-Diamante: Pode variar entre 5 a 12 minutos.Linha 9-Esmeralda: Intervalos menores durante o pico, entre 4 e 8 minutos.Linha 10-Turquesa: Intervalos variam entre 5 a 12 minutos.Linha 11-Coral: Uma das mais movimentadas, com intervalos menores nos horários de pico, cerca de 3 a 6 minutos.Linha 12-Safira: Intervalos variam de 5 a 15 minutos, dependendo do horário.Linha 13-Jade: Frequência menor, com intervalos que podem chegar a 20 ou 30 minutos, principalmente fora dos horários de pico. Para ter uma informação mais aproximada da chegada do seu trem, volte no nosso menu principal e selecione a opção 2', 1, 1, '1');
INSERT INTO C_duvidas_frequentes (Pergunta, Resposta, ID_Usuario, ID_Idioma, Status) VALUES ('Opções de integração', 'Bilhete Único: Integração com ônibus municipais da SPTrans e com o Metrô, permitindo combinações entre os meios de transporte pagando uma tarifa reduzida.Metrô: Integração direta com as linhas do Metrô nas estações Brás, Luz, Tatuapé, Barra Funda e Santo Amaro.Ônibus Intermunicipais (EMTU): Algumas estações da CPTM oferecem integração com linhas de ônibus intermunicipais gerenciadas pela EMTU, especialmente nas regiões metropolitanas.Ciclovias e Bicicletários: Várias estações oferecem bicicletários gratuitos, além de ciclovias conectadas a algumas estações, facilitando a integração bicicleta-trem.Trens Metropolitanos: A Linha 13-Jade tem integração com o Aeroporto de Guarulhos, facilitando o transporte para a região aeroportuária.', 1, 1, '1');
INSERT INTO C_duvidas_frequentes (Pergunta, Resposta, ID_Usuario, ID_Idioma, Status) VALUES ('Atendimento ao Cliente', 'Central de Atendimento: Disponível pelo telefone 0800-055-0121, funcionando 24 horas por dia para dúvidas, sugestões ou reclamações.Fale Conosco: Formulário disponível no site oficial da CPTM para contato direto com o serviço de atendimento ao cliente.Ouvidoria: Para casos que necessitam de uma resolução mais específica ou reclamações formais, a ouvidoria pode ser acessada pelo telefone ou pela internet.Redes Sociais: A CPTM também oferece atendimento ao cliente e informações em tempo real através de suas contas oficiais no Twitter e Facebook.Postos de Atendimento Presencial: Algumas estações possuem postos físicos de atendimento ao cliente para resolver questões relacionadas a bilhete e informações gerais.', 1, 1, '1');


-- Linha 1 - Azul --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Tucuruvi', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Parada Inglesa', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jardim São Paulo – Ayrton Senna', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Santana', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Carandiru', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Portuguesa – Tietê', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Armênia', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Tiradentes', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('São Bento', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Japão – Liberdade', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('São Joaquim', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vergueiro', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Mariana', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Praça da Árvore', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Saúde', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('São Judas', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Conceição', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jabaquara', 'Ativa', 1);

-- Linha 2 - Verde --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Madalena', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Santuário Nossa Senhora de Fátima-Sumaré', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Clínicas', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Trianon-Masp', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Brigadeiro', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Santos-Imigrantes', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Alto do Ipiranga', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Sacomã', 'Ativa', 1);

-- Linha 3 - Vermelha --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Marechal Deodoro', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Santa Cecília', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Anhangabaú', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Bresser-Mooca', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Belém', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Carrão-Assaí Atacadista', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Penha', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Matilde', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Guilhermina-Esperança', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Patriarca-Vila Ré', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Artur Alvim', 'Ativa', 1);

-- Linha 4 - Amarela -- 
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Higienópolis-Mackenzie', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Oscar Freire', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Fradique Coutinho', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Faria Lima', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Butantã', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('São Paulo-Morumbi', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Sônia', 'Ativa', 1);

-- Linha 5 - Lilás --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Capão Redondo', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Campo Limpo', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila das Belezas', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Giovanni Gronchi', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Largo Treze', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Adolfo Pinheiro', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Alto da Boa Vista', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Borba Gato', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Brooklin', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Campo Belo', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Eucaliptos', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Moema', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('AACD-Servidor', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Hospital São Paulo', 'Ativa', 1);

-- Linha 7 - Rubi --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Água Branca', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Lapa', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Piqueri', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Pirituba', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Clarice', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jaraguá', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Aurora', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Perus', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Caieiras', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Franco da Rocha', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Baltazar Fidélis', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Francisco Morato', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Botujuru', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Campo Limpo Paulista', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Várzea Paulista', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jundiaí', 'Ativa', 1);

-- Linha 8 - Diamante --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Júlio Prestes', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Lapa - Senac', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Domingos de Moraes', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Imperatriz Leopoldina', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Comandante Sampaio', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Quitaúna', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('General Miguel Costa', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Carapicuíba', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Santa Terezinha', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Antônio João', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Barueri', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jardim Belval', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jardim Silveira', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jandira', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Sagrado Coração', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Engenheiro Cardoso', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Itapevi', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Santa Rita', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Amador Bueno', 'Ativa', 1);

-- Linha 9 - Esmeralda --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Ceasa', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Villa Lobos-Jaguaré', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Cidade Universitária', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Hebraica-Rebouças', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Cidade Jardim', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Olímpia', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Berrini', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Morumbi', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Granja Julieta', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('João Dias', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Socorro', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jurubatuba', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Autódromo', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Primavera-Interlagos', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Grajaú', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Bruno Covas/Mendes-Vila Natal', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Varginha', 'Ativa', 1);

-- Linha 10 - Turquesa --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Juventus-Mooca', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Ipiranga', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('São Caetano do Sul-Prefeito Walter Braido', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Utinga', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Prefeito Saladino', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Prefeito Celso Daniel-Santo André', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Capuava', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Mauá', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Guapituba', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Ribeirão Pires-Antônio Bespalec', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Rio Grande da Serra', 'Ativa', 1);

-- Linha 11 - Coral --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Dom Bosco', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('José Bonifácio', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Guaianases', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Antônio Gianetti Neto', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Ferraz de Vasconcelos', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Poá', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Suzano', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jundiapeba', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Braz Cubas', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Mogi das Cruzes', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Estudantes', 'Ativa', 1);

-- Linha 12 - Safira --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('USP Leste', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Comendador Ermelino', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('São Miguel Paulista', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jardim Helena-Vila Mara', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Itaim Paulista', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jardim Romano', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Engenheiro Manoel Feio', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Itaquaquecetuba', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Aracaré', 'Ativa', 1);

-- Linha 13 - Jade --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Guarulhos–Cecap', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Aeroporto–Guarulhos', 'Ativa', 1);

-- Linha 15 - Prata --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Oratório', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('São Lucas', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Camilo Haddad', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Tolstói', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila União', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jardim Planalto', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Sapopemba', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Fazenda da Juta', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('São Mateus', 'Ativa', 1);
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Jardim Colonial', 'Ativa', 1);

-- Estações que abrangem mais de uma linha --
INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Luz', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (154, 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (154, 4);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (154, 6);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (154, 9);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (154, 10);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Sé', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (155, 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (155, 3);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Brás', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (156, 3);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (156, 9);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (156, 10);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (156, 11);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Tatuapé', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (157, 3);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (157, 10);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (157, 11);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('República', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (158, 3);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (158, 4);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Paraíso', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (159, 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (159, 2);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Ana Rosa', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (160, 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (160, 2);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Santa Cruz', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (161, 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (161, 5);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Chácara Klabin', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (162, 2);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (162, 5);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Pinheiros', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (163, 4);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (163, 8);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Paulista-Consolação', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (164, 2);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (164, 4);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Santo Amaro', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (165, 5);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (165, 8);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Palmeiras-Barra Funda', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (166, 3);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (166, 6);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (166, 7);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Tamanduateí', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (167, 2);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (167, 9);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Osasco', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (168, 7);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (168, 8);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Presidente Altino', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (169, 7);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (169, 8);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Corinthians-Itaquera', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (170, 3);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (170, 10);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Calmon Viana', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (171, 10);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (171, 11);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Engenheiro Goulart', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (172, 11);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (172, 12);

INSERT INTO C_Estacoes (Nome_estacao, Status, ID_Usuario) VALUES ('Vila Prudente', 'Ativa', 1);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (173, 3);
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (173, 13);


BEGIN FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 1 AND 18
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 1); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 19 AND 26
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 2); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 27 AND 37
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 3); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 38 AND 44
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 4); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 45 AND 58
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 5); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 59 AND 74
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 6); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 75 AND 93
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 7); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 94 AND 110
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 8); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 111 AND 121
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 9); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 122 AND 132
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 10); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 133 AND 141
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 11); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 142 AND 143
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 12); END LOOP;

FOR t IN (
    SELECT
        id_estacoes
    FROM
        c_estacoes
    WHERE
        id_estacoes BETWEEN 144 AND 153
) LOOP
INSERT INTO C_ESTACAO_LINHA (ID_ESTACOES, ID_LINHA) VALUES (t.id_estacoes, 13); END LOOP;
COMMIT;
END;


/*
-- - CONSULTAS - --

--select * from C_Busca_Estacoes order by id_busca;
--select * from C_Duvidas_Frequentes;
--select * from C_Estacao_Linha;
--select * from C_Estacoes;
--select * from C_Idioma;
--select * from C_Linhas;
--select * from C_Usuario;



--Listar todas as estações junto com suas respectivas linhas, organizadas por nome da linha em ordem alfabética.
-- (ORDER BY, JOIN)
SELECT
    e.nome_estacao,
    l.nome_linha
FROM
         c_estacao_linha c
    INNER JOIN c_estacoes e ON e.id_estacoes = c.id_estacoes
    INNER JOIN c_linhas   l ON l.id_linha = c.id_linha
order BY
    l.nome_linha


--Selecionar a resposta da duvida "Horário de funcionamento"
-- (WHERE)
SELECT resposta from c_duvidas_frequentes WHERE pergunta = 'Horário de funcionamento'


--Contar quantas estações estão associadas a cada linha, além de mostrar a estação com o nome mais longo e nome mais curto dentro de cada linha.
-- (GROUP BY, COUNT, MAX, MIN)
SELECT
    L.Nome_linha,
    COUNT(EL.ID_Estacoes) AS Total_Estacoes,
    MAX(LENGTH(E.Nome_estacao)) AS Tamanho_Max_Nome_Estacao,
    MIN(LENGTH(E.Nome_estacao)) AS Tamanho_Min_Nome_Estacao
FROM 
    C_Estacao_Linha EL
JOIN 
    C_Linhas L ON EL.ID_Linha = L.ID_Linha
JOIN 
    C_Estacoes E ON EL.ID_Estacoes = E.ID_Estacoes
GROUP BY 
    L.Nome_linha;


--Listar os nomes das linhas que possuem pelo menos uma estação chamada "Sé"
-- (SUBQUERY)
SELECT 
    Nome_linha
FROM 
    C_Linhas
WHERE 
    ID_Linha IN (
        SELECT 
            ID_Linha
        FROM 
            C_Estacao_Linha EL
        JOIN 
            C_Estacoes E ON EL.ID_Estacoes = E.ID_Estacoes
        WHERE 
            E.Nome_estacao = 'Sé'
    );






-- EXCLUIR --
BEGIN
  FOR t IN (
    SELECT table_name 
    FROM user_tables 
    WHERE table_name LIKE 'C_%'
  ) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE "' || t.table_name || '" CASCADE CONSTRAINTS';
  END LOOP;
END;
*/