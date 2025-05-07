import oracledb
from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app) 

# Uma função para trazer as linhas e estações do banco de dados
# Função para trazer as perguntas e respostas do banco de dados
# Função para tabela de log(deixar por ultimo)
# isso é para o site

# função para trazer os idiomas do banco de dados (para trazer no totem tem que ser idioma status 1)
# Adaptar o Dijktra para calcular o caminho entre as estações do banco de dados
# isso é para o totem

def get_conexao():
    return oracledb.connect(
        user='rm560442',
        password='fiap25',
        dsn='oracle.fiap.com.br/orcl'
    )

def busca_login(usuario, senha):
    query = """
    SELECT nome_usuario 
    FROM challenge_usuario 
    WHERE nome_usuario = :usuario AND senha = :senha
    """
    with get_conexao() as con:
        cur = con.cursor()
        try:
            cur.execute(query, {"usuario": usuario, "senha": senha})
            resultado = cur.fetchone()
            return resultado is not None
        finally:
            cur.close()

@app.route('/login', methods=['POST'])
def login():
    try:
        #USUARIO E SENHA => DADOS
        dados = request.json
        usuario = dados.get('usuario')
        senha = dados.get('senha')

        # if not usuario or not senha:
        #     return jsonify({'erro': 'Usuário e senha são obrigatórios'}), 400

        if busca_login(usuario, senha):
            return jsonify({'mensagem': 'Login bem-sucedido!'}), 200
        else:
            return jsonify({'erro': 'Usuário ou senha inválidos'}), 401

    except Exception as e:
        print("Erro no login:", e)
        return jsonify({'erro': f'Erro interno: {str(e)}'}), 500


# NOVA ROTA: CADASTRO
@app.route('/cadastro', methods=['POST'])
def cadastro():
    dados = request.json
    usuario = dados.get('usuario')
    senha = dados.get('senha')
    ultimo_acesso = dados.get('ultimo_acesso')
    status = dados.get('status')
    tipo_usuario = dados.get('tipo_usuario')


    if not usuario or not senha:
        return jsonify({'erro': 'Usuário e senha são obrigatórios'}), 400

    try:
        with get_conexao() as con:
            with con.cursor() as cur:
                # Verifica se o usuário já existe
                cur.execute("SELECT nome_usuario FROM challenge_usuario WHERE nome_usuario = :usuario", {"usuario": usuario})
                if cur.fetchone():
                    return jsonify({'erro': 'Usuário já existe.'}), 409

                # Insere o novo usuário
                cur.execute("""
                    INSERT INTO challenge_usuario (nome_usuario, senha, ultimo_acesso, status, id_tipo_usuario)
                    VALUES (:usuario, :senha, :ultimo_acesso, :status, :tipo_usuario)
                """, {"usuario": usuario, "senha": senha, 'ultimo_acesso': ultimo_acesso, 'status': status, "id_tipo_usuario": tipo_usuario})
                
                con.commit()
                return jsonify({'mensagem': 'Usuário cadastrado com sucesso!'}), 201
    except Exception as e:
        return jsonify({'erro': str(e)}), 500

@app.route('/colaborador', methods=['GET'])
def colaborador():
    query = """
    SELECT nome_usuario, id_tipo_usuario, status
    FROM challenge_usuario 
    """
    with get_conexao() as con:
        cur = con.cursor()
        try:
            cur.execute(query)
            resultado = cur.fetchall()
            colaboradores = [
                {
                    'usuario':row[0],
                    'tipo_usuario':"Administrador" if row[1] == 61 else "Colaborador",
                    'status':"Ativo" if row[2] == '1' else "Pausado"
                }
                for row in resultado
            ]
            return jsonify(colaboradores), 200
        except Exception as e:
            return jsonify({'erro':str(e)}), 500

@app.route('/tipos_usuario', methods=['GET'])
def listar_tipos_usuario():
    try:
        with get_conexao() as con:
            with con.cursor() as cur:
                cur.execute("SELECT id_tipo_usuario, nome_tipo FROM challenge_tipo_usuario ")#WHERE status = 1
                resultados = cur.fetchall()

                tipos = [
                    {
                        "id":row[0], "nome":row[1]
                     }
                     for row in resultados
                ]
                return jsonify(tipos), 200
    except Exception as e:
        return jsonify({'erro': str(e)}), 500

if __name__ == "__main__":
    app.run(port=5000, host='localhost', debug=True)