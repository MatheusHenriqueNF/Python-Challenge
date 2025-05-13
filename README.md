# Sistema Interativo de Atendimento ao Usuário do Metrô

Este projeto é um sistema de atendimento interativo via terminal, voltado para usuários de metrô. O sistema permite que os usuários recebam informações úteis sobre o trajeto, lotação dos trens, dúvidas frequentes, e também oferece funcionalidades exclusivas para funcionários do metrô.

## 🧠 Funcionalidades

### Usuário Comum:
- 🚇 **Ajuda de Trajeto**: Calcula o caminho mais curto entre duas estações utilizando algoritmo de busca.
- 📊 **Informações de Lotação**: Mostra a lotação média dos vagões entre duas estações.
- ❓ **Dúvidas Frequentes**: Responde a perguntas frequentes de maneira automática.
- 💾 **Exportar Trajeto**: Salva o trajeto calculado em um arquivo JSON.

### Funcionário:
- 🔐 **Login para Funcionários**: Acesso exclusivo com autenticação simples (usuário e senha).
- ⚙️ **Ações Internas**: Alterações no banco de dados.

## 🛠️ Tecnologias Utilizadas

- **Python 3.12.5**
- **Oracle SQL Database**
- **Estrutura de Grafos** para representação das estações e caminhos
- **JSON** para exportação de trajetos
- Interface por terminal (modo texto)

## 📦 Requisitos

- Python 3.12.5
- Bibliotecas Python:
  - networkx
  - json
  - random
  - oracledb
- Oracle SQL Developer

## ⚙️ Como Executar

1. Clone este repositório:
   - Abra seu CMD
   - Escreva o seguinte comando: git clone https://github.com/MatheusHenriqueNF/Python-Challenge.git
   - Escreva o seguinte comando: cd Python-Challenge

2. Instale os requisitos (caso necessário):
   - Execute os seguintes comandos no terminal:
      - pip install networkx
      - pip install oracledb

3. Execute o programa:
   - python Menu.py

## 🔐 Login de Funcionário

Use as credenciais abaixo para acessar o modo funcionário (padrão de teste):

- **Usuário**: `ES@5948`
- **Senha**: `193420`

## 📤 Exportação

O trajeto pode ser exportado para um arquivo JSON chamado `caminho.json`, com a sequência de estações a ser seguida como rota.

## 👨‍💻 Autores

- Nomes:
   - *Cleyton Enrike de Oliveira*
   - *Matheus Henrique Nascimento de Freitas*
   - *Matheus Pinheiro Ermacora Martins*
- Universidade: FIAP
- Contato: *[Seu email ou LinkedIn]*
   - Cleyton: https://www.linkedin.com/in/cleyton-enrike-de-oliveira99/
   - Matheus Henrique: https://www.linkedin.com/in/matheus-henrique-freitas/
   - Matheus Pinheiro: https://github.com/pinheiroosz

---

© 2025 - Projeto acadêmico para fins educacionais.
