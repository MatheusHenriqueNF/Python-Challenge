import networkx as nx
import json as js

def menu_principal(nome, origem_formatado, grafo):
    #  *Função do Menu principal*
    # ValueError, 

    # Entrada do usuário, sendo apresentado e logo após escolhendo entre uma das opções

    # Tratamento de erro na entrada do usuário
    # while opcao.isnumeric() == False or (opcao != "1" and opcao != "2" and opcao != "3" and opcao != "4"):
    #     opcao = input("\nOpção inválida \nPor favor, selecione entre opção \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")
    while True: 
        try:
            opcao = input(f"\nBem vindo, {nome}! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")
        
            if opcao in ["1", "2", "3", "4"]:
                break
            else:
                raise ValueError

        except ValueError:
            erro = input("\nOpção inválida! \nPressione enter para continuar.")

    # Chamada de função correspondente a escolha do usuário
    if opcao == "1":
        ajuda_caminho(nome, origem_formatado, grafo)
    elif opcao == "2":
        duvida_lotacao()
    elif opcao == "3":
        duvidas_frequentes() 
    elif opcao == "4":
        encerrar()              
    

def ajuda_caminho(nome, origem_formatado, grafo):
    # Função para informar a rota desejada ao cliente*
            
    # Criação do grafo das estações de metrô
    G = nx.Graph()

    for estacao, conexoes in grafo.items():
        for destino, peso in conexoes.items():
         G.add_edge(estacao, destino, weight=peso)
    
    while True:
        try: 
            destino = input("\nQual estação você quer ir?\nR:")
            destino_formatado = destino.strip()

            if destino_formatado in grafo:
                break
            else:
                raise ValueError

        except ValueError:
            erro = input("\nOpção inválida! \nPressione enter para continuar.")

    caminho_mais_curto = nx.shortest_path(G, source=origem_formatado, target=destino_formatado, weight="weight")

    mensagem_caminho = f"Aqui está o caminho mais curto para o seu destino, {nome}:"

    caminho_mensagem = [mensagem_caminho,caminho_mais_curto]

    for i in caminho_mensagem:
        print(f"\n{i}")

    # print(caminho_mensagem)

    with open("caminho.txt", mode="w", encoding="utf-8") as arquivo:
        js.dump(caminho_mensagem, arquivo, indent=4, ensure_ascii=False)

    input("\nPressione enter para continuar.")

    # pergunta()


def inicio():

    grafo = {
        # Linha 8-Diamante
        "Júlio Prestes": {"Palmeiras-Barra Funda": 1},
        "Palmeiras-Barra Funda": {"Júlio Prestes": 1, "Lapa": 1},
        "Lapa": {"Palmeiras-Barra Funda": 1, "Domingos de Moraes": 1},
        "Domingos de Moraes": {"Lapa": 1, "Imperatriz Leopoldina": 1},
        "Imperatriz Leopoldina": {"Domingos de Moraes": 1, "Presidente Altino": 1},
        "Presidente Altino": {"Imperatriz Leopoldina": 1, "Osasco": 1},
        "Osasco": {"Presidente Altino": 1, "Comandante Sampaio": 1},
        "Comandante Sampaio": {"Osasco": 1, "Quitaúna": 1},
        "Quitaúna": {"Comandante Sampaio": 1, "General Miguel Costa": 1},
        "General Miguel Costa": {"Quitaúna": 1, "Carapicuíba": 1},
        "Carapicuíba": {"General Miguel Costa": 1, "Santa Terezinha": 1},
        "Santa Terezinha": {"Carapicuíba": 1, "Antonio João": 1},
        "Antonio João": {"Santa Terezinha": 1, "Barueri": 1},
        "Barueri": {"Antonio João": 1, "Jardim Belval": 1},
        "Jardim Belval": {"Barueri": 1, "Jardim Silveira": 1},
        "Jardim Silveira": {"Jardim Belval": 1, "Jandira": 1},
        "Jandira": {"Jardim Silveira": 1, "Sagrado Coração": 1},
        "Sagrado Coração": {"Jandira": 1, "Engenheiro Cardoso": 1},
        "Engenheiro Cardoso": {"Sagrado Coração": 1, "Itapevi": 1},
        "Itapevi": {"Engenheiro Cardoso": 1, "Amador Bueno": 1},
        "Amador Bueno": {"Itapevi": 1},

        # Linha 9-Esmeralda
        "Ceasa": {"Presidente Altino": 1, "Villa-Lobos - Jaguaré": 1},
        "Villa-Lobos - Jaguaré": {"Ceasa": 1, "Cidade Universitária": 1},
        "Cidade Universitária": {"Villa-Lobos - Jaguaré": 1, "Pinheiros": 1},
        "Pinheiros": {"Cidade Universitária": 1, "Hebraica-Rebouças": 1, "Faria Lima": 1},
        "Hebraica-Rebouças": {"Pinheiros": 1, "Cidade Jardim": 1},
        "Cidade Jardim": {"Hebraica-Rebouças": 1, "Vila Olímpia": 1},
        "Vila Olímpia": {"Cidade Jardim": 1, "Berrini": 1},
        "Berrini": {"Vila Olímpia": 1, "Morumbi": 1},
        "Morumbi": {"Berrini": 1, "Granja Julieta": 1},
        "Granja Julieta": {"Morumbi": 1, "Santo Amaro": 1},
        "Santo Amaro": {"Granja Julieta": 1, "Socorro": 1},
        "Socorro": {"Santo Amaro": 1, "Jurubatuba": 1},
        "Jurubatuba": {"Socorro": 1, "Autódromo": 1},
        "Autódromo": {"Jurubatuba": 1, "Interlagos": 1},
        "Interlagos": {"Autódromo": 1, "Grajaú": 1},
        "Grajaú": {"Interlagos": 1, "Mendes-Vila Natal": 1},
        "Mendes-Vila Natal": {"Grajaú": 1},

        # Linha 1-Azul
        "Jabaquara": {"Conceição": 1},
        "Conceição": {"Jabaquara": 1, "São Judas": 1},
        "São Judas": {"Conceição": 1, "Saúde": 1},
        "Saúde": {"São Judas": 1, "Praça da Árvore": 1},
        "Praça da Árvore": {"Saúde": 1, "Santa Cruz": 1},
        "Santa Cruz": {"Praça da Árvore": 1, "Vila Mariana": 1},
        "Vila Mariana": {"Santa Cruz": 1, "Ana Rosa": 1},
        "Ana Rosa": {"Vila Mariana": 1, "Paraíso": 1},
        "Paraíso": {"Ana Rosa": 1, "Vergueiro": 1},
        "Vergueiro": {"Paraíso": 1, "São Joaquim": 1},
        "São Joaquim": {"Vergueiro": 1, "Liberdade": 1},
        "Liberdade": {"São Joaquim": 1, "Sé": 1},
        "Sé": {"Liberdade": 1, "São Bento": 1},
        "São Bento": {"Sé": 1, "Luz": 1},
        "Luz": {"São Bento": 1, "Tiradentes": 1, "República": 1},
        "Tiradentes": {"Luz": 1, "Armênia": 1},
        "Armênia": {"Tiradentes": 1, "Portuguesa-Tietê": 1},
        "Portuguesa-Tietê": {"Armênia": 1, "Carandiru": 1},
        "Carandiru": {"Portuguesa-Tietê": 1, "Santana": 1},
        "Santana": {"Carandiru": 1, "Jardim São Paulo-Ayrton Senna": 1},
        "Jardim São Paulo-Ayrton Senna": {"Santana": 1, "Parada Inglesa": 1},
        "Parada Inglesa": {"Jardim São Paulo-Ayrton Senna": 1, "Tucuruvi": 1},
        "Tucuruvi": {"Parada Inglesa": 1},

        # Linha 2-Verde
        "Vila Madalena": {"Santuário Nossa Senhora de Fátima-Sumaré": 1},
        "Santuário Nossa Senhora de Fátima-Sumaré": {"Vila Madalena": 1, "Clínicas": 1},
        "Clínicas": {"Santuário Nossa Senhora de Fátima-Sumaré": 1, "Consolação": 1},
        "Consolação": {"Clínicas": 1, "Trianon-Masp": 1},
        "Trianon-Masp": {"Consolação": 1, "Brigadeiro": 1},
        "Brigadeiro": {"Trianon-Masp": 1, "Paraíso": 1},
        "Ana Rosa": {"Paraíso": 1, "Chácara Klabin": 1},
        "Chácara Klabin": {"Ana Rosa": 1, "Santos-Imigrantes": 1},
        "Santos-Imigrantes": {"Chácara Klabin": 1, "Alto do Ipiranga": 1},
        "Alto do Ipiranga": {"Santos-Imigrantes": 1, "Sacomã": 1},
        "Sacomã": {"Alto do Ipiranga": 1, "Tamanduateí": 1},
        "Tamanduateí": {"Sacomã": 1, "Vila Prudente": 1},
        "Vila Prudente": {"Tamanduateí": 1},

        # Linha 4-Amarela
        "República": {"Luz": 1, "Higienópolis-Mackenzie": 1},
        "Higienópolis-Mackenzie": {"República": 1, "Paulista": 1},
        "Paulista": {"Higienópolis-Mackenzie": 1, "Oscar Freire": 1},
        "Oscar Freire": {"Paulista": 1, "Fradinho Coutinho": 1},
        "Fradinho Coutinho": {"Oscar Freire": 1, "Faria Lima": 1},
        "Faria Lima": {"Fradinho Coutinho": 1, "Pinheiros": 1},
        "Butantã": {"Pinheiros": 1, "São Paulo-Morumbi": 1},
        "São Paulo-Morumbi": {"Butantã": 1, "Vila Sônia": 1},
        "Vila Sônia": {"São Paulo-Morumbi": 1}
        }


    while True: 
        try:
            nome = input("\nQual o seu nome?\nR:")
        
            if nome.isalpha() == True:
                break
            else:
                raise ValueError

        except ValueError:
            erro = input("\nOpção inválida! \nPressione enter para continuar.")

    while True:
        try:
            origem = input("\nQual estação você está?\nR:")
            origem_formatado = origem.strip()

            if origem_formatado in grafo:
                break
            else:
                raise ValueError

        except ValueError:
            erro = input("\nOpção inválida! \nPressione enter para continuar.")

    return nome, origem_formatado, grafo, menu_principal(nome, origem_formatado, grafo)


if __name__ == "__main__":
    inicio()

# Função que pega o nome do usuário, segura o grafo dentro dela e pega a estação que o usuário se encontra.
# ela vai retornar o nome do usuário para ser usado nos prints
# vai retornar o grafo para ser usado na função "ajuda caminho"
# vai retornar o local do usuário para ser usado na mesma função