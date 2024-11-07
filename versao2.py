from heapq import heapify, heappop, heappush
import random

#feito
def menu_principal():
    opcao = input("\nBem vindo! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")

    while opcao.isnumeric() == False or (opcao != "1" and opcao != "2" and opcao != "3" and opcao != "4"):
        opcao = input("\nOpção inválida \nPor favor, selecione entre opção \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")

    if opcao == "1":
        ajuda_caminho()
    elif opcao == "2":
        duvida_lotacao()
    elif opcao == "3":
        duvidas_frequentes() 
    elif opcao == "4":
        encerrar()              
    
#feito
def ajuda_caminho():
    from heapq import heapify, heappop, heappush

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

    class Grafo:
        def __init__(self, grafo = {}):
            self.grafo = grafo

        def add_aresta(self, no1, no2, peso):
            if no1 not in self.grafo:
                self.grafo[no1] = {}
            self.grafo[no1][no2] = peso

        def menores_distancias(self, raiz: str):
            distancias = {no: float("inf") for no in self.grafo}
            distancias[raiz] = 0

            pq = [(0, raiz)]
            heapify(pq)

            visitado = set()

            while pq:
                distancia_atual, no_atual = heappop(pq)

                if no_atual in visitado:
                    continue
                visitado.add(no_atual)

                for vizinho, peso in self.grafo[no_atual].items():
                    tentativa_distancia = distancia_atual + peso
                    if tentativa_distancia < distancias[vizinho]:
                        distancias[vizinho] = tentativa_distancia
                        heappush (pq, (tentativa_distancia, vizinho))

            predecessores = {no: None for no in self.grafo}

            for no, distancia in distancias.items():
                for vizinho, peso in self.grafo[no].items():
                    if distancias[vizinho] == distancia + peso:
                        predecessores[vizinho] = no

            return distancias, predecessores

        def menores_caminhos(self, raiz: str, alvo: str):
            _, predecessores = self.menores_distancias(raiz)

            caminho = []
            no_atual = alvo

            while no_atual:
                caminho.append(no_atual)
                no_atual = predecessores[no_atual]

            caminho.reverse()

            return caminho                                 


    G = Grafo(grafo)

    distancias = G.menores_caminhos(input("\nDigite a Estação que você está: "), input("\nDigite a Estação para qual você quer ir: "))
    print("\nSiga nas seguintes estações: \n", distancias)

    pergunta()

#feito
def duvida_lotacao():
    # # Função para informar ao cliente a lotação de cada vagão e o tempo de chegada do próximo trem 
    
    # Criação das variáveis de lotação de cada vagão 
    vag_1 = random.randint(10, 99)
    vag_2 = random.randint(10, 99)
    vag_3 = random.randint(10, 99)
    vag_4 = random.randint(10, 99)
    vag_5 = random.randint(10, 99)
    vag_6 = random.randint(10, 99)
    vag_7 = random.randint(10, 99)
    vag_8 = random.randint(10, 99)

    # Criação das variáveis de tempo de chegada do próximo trem
    tempo_chegada_min = random.randint(0, 15)
    tempo_chegada_seg = random.randint(00, 59)

    # Exibição das informações
    print(f"\nA lotação de cada vagão é:\nVagão 1 = {vag_1}%\nVagão 2 = {vag_2}%\nVagão 3 = {vag_3}%\nVagão 4 = {vag_4}%\nVagão 5 = {vag_5}%\nVagão 6 = {vag_6}%\nVagão 7 = {vag_7}%\nVagão 8 = {vag_8}% \n \nA chegada do próximo trem está prevista para {tempo_chegada_min} minutos e {tempo_chegada_seg} segundos\n")

    pergunta()

#feito
def duvidas_frequentes():
    duvida = input("\nSelecione uma dentre as opções \n1- Horário de funcionamento \n2- Compra de bilhetes \n3- Frequência de Trens \n4- Opções de integração \n5- Atendimento ao Cliente \nQual seria sua dúvida?: ")

    while duvida.isnumeric() == False or (duvida != "1" and duvida != "2" and duvida != "3" and duvida != "4" and duvida != "5"):
        duvida = input("\nOpção inválida \nPor favor, selecione uma das opções apresentadas\n1- Horário de funcionamento \n2- Compra de bilhetes \n3- Frequência de Trens \n4- Opções de integração \n5- Atendimento ao Cliente \nQual seria sua dúvida?:  ")

    if duvida == "1":
     print ("\nHorário Geral: Das 4h até às 23:59 \nObservações: \n - Este horário pode ser prolongado em ocasiões especiais \n - Em feriados, este horário pode ser reduzido\n")
    elif duvida == "2":
     print ("\nTarifa: \n - A tarifa é de R$5, mas pode sofrer alteraçõs em casos de reajuste \n \nComo Comprar Passagens:\n - Máquinas Automáticas: Disponíveis em todas as estações, permitem a compra de bilhetes. \n - Bilheteiras: Algumas estações possuem bilheteiras onde você pode comprar passagens diretamente com uma pessoa\n")
    elif duvida == "3":
     print ("\nLinha 7-Rubi: Intervalos de 6 a 15 minutos, dependendo do horário.\nLinha 8-Diamante: Pode variar entre 5 a 12 minutos.\nLinha 9-Esmeralda: Intervalos menores durante o pico, entre 4 e 8 minutos.\nLinha 10-Turquesa: Intervalos variam entre 5 a 12 minutos.\nLinha 11-Coral: Uma das mais movimentadas, com intervalos menores nos horários de pico, cerca de 3 a 6 minutos.\nLinha 12-Safira: Intervalos variam de 5 a 15 minutos, dependendo do horário.\nLinha 13-Jade: Frequência menor, com intervalos que podem chegar a 20 ou 30 minutos, principalmente fora dos horários de pico.\n \nPara ter uma informação mais aproximada da chegada do seu trem, volte no nosso menu principal e selecione a opção 2\n")
    elif duvida == "4":
     print ("\nBilhete Único: Integração com ônibus municipais da SPTrans e com o Metrô, permitindo combinações entre os meios de transporte pagando uma tarifa reduzida.\nMetrô: Integração direta com as linhas do Metrô nas estações Brás, Luz, Tatuapé, Barra Funda e Santo Amaro.\nÔnibus Intermunicipais (EMTU): Algumas estações da CPTM oferecem integração com linhas de ônibus intermunicipais gerenciadas pela EMTU, especialmente nas regiões metropolitanas.\nCiclovias e Bicicletários: Várias estações oferecem bicicletários gratuitos, além de ciclovias conectadas a algumas estações, facilitando a integração bicicleta-trem.\nTrens Metropolitanos: A Linha 13-Jade tem integração com o Aeroporto de Guarulhos, facilitando o transporte para a região aeroportuária.\n")
    elif duvida == "5":
     print ("\nCentral de Atendimento: Disponível pelo telefone 0800-055-0121, funcionando 24 horas por dia para dúvidas, sugestões ou reclamações.\nFale Conosco: Formulário disponível no site oficial da CPTM para contato direto com o serviço de atendimento ao cliente.\nOuvidoria: Para casos que necessitam de uma resolução mais específica ou reclamações formais, a ouvidoria pode ser acessada pelo telefone ou pela internet.\nRedes Sociais: A CPTM também oferece atendimento ao cliente e informações em tempo real através de suas contas oficiais no Twitter e Facebook.\nPostos de Atendimento Presencial: Algumas estações possuem postos físicos de atendimento ao cliente para resolver questões relacionadas a bilhete e informações gerais.\n")  

    pergunta()  

#feito
def encerrar():
    print("\nAtendimento Encerrado.")
    exit()

#feito
def pergunta():
    pergunta = input("\nPodemos te ajudar com mais alguma coisa?\n1 - Sim (Voltar ao Menu)\n2 - Não (Encerrar Atendimento)\nO que deseja?: ")

    while pergunta.isnumeric() == False or (pergunta != "1" and pergunta != "2"):
        pergunta = input("\nOpção inválida, por favor selecione dentre\n1 - Sim (Voltar ao Menu)\n2 - Não (Encerrar Atendimento)\nO que deseja?: ")

    if pergunta == "1":
        menu_principal()
    elif pergunta == "2":
        encerrar()        


menu_principal()