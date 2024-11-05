import random
import time

def menu_principal ():
    # # Função do Menu principal
    menu = 0

    #Entrada do usuário, sendo apresentado e logo após escolhendo entre uma das opções
    while menu != 1 and menu != 2 and menu != 3 and menu != 4:
        menu = int(input("\nBem vindo! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?:"))
        while menu != 1 and menu != 2 and menu !=3 and menu != 4:
            menu = int(input("\nOpção inválida \nPor favor, selecione entre opção 1, 2, 3 ou 4: "))

    #Valor sendo retornado
    if menu == 1:
        return 1
    elif menu == 2:
        return 2
    elif menu == 3:
        return 3
    elif menu == 4:
        return 4        

def menu_1():
    # Função para informar a rota desejada ao cliente
    # Criação das variáveis de linha e resposta
    linha = 0
    resposta = 0

    # Cliente informa a linha na qual ele se encontra
    while linha != 8 and linha != 9:
      linha = int(input("\nPor enquanto temos disponibilidade para a linha 8 e 9 de CPTM \nEm qual linha você se encontra agora?: "))
      while linha !=8 and linha !=9:
         linha = int(input("\nOpção invalida, selecione uma dentre as duas opções: "))

    # Cliente informa a qual linha ele quer se dirigir
    while resposta != 1 and resposta != 3 and resposta != 2:    
      resposta = int(input("\nTemos disponibilidade para as linha 1-Azul, 2-Verde e 3-Vermelha \nPara qual linha você gostaria de ir?: "))
      while resposta != 1 and resposta != 3 and resposta != 2:
         resposta = int(input("\nOpção invalida, selecione uma dentre as três opções: "))

    # Processamento da informação fornecida e Exibição da resposta
    if linha == 8:  
     if resposta == 1:
         print ("Gerando caminho")
         time.sleep(3)
         print ("\nSiga sentido Júlio Prestes, desça em Palmeiras Barra Funda e siga na linha 3 vermelha até a estação Sé\n")
     elif resposta == 3:
         print ("Gerando caminho")
         time.sleep(3)
         print ("\nSiga sentido Júlio Prestes, desça em Palmeiras Barra Funda\n")
     elif resposta == 2:
         print ("Gerando caminho")
         time.sleep(3)
         print ("\nSiga sentido Júlio Prestes, desça em Palmeiras Barra Funda,Siga na linha 7 Rubi sentido Luz, desça na estação Luz e siga na linha azul sentido Jabaquara até a estação Paraíso\n")
    elif linha == 9:
      if resposta == 1:
         print ("Gerando caminho")
         time.sleep(3)
         print ("\nSiga sentido Luiz Bortolosso, desça em Pinheiros, siga na linha 4 amarela em sentido Luz\n")
      elif resposta == 3:
         print ("Gerando caminho")
         time.sleep(3)
         print ("\nSiga sentido Luiz Bortolosso, desça na estação Pres. Altino, siga na linha 8 em sentido Júilo Prestes, desça na estação Palmeiras Barra Funda\n")
      elif resposta == 2:
         print ("Gerando caminho")
         time.sleep(3)
         print ("\nSiga sentido Luiz Bortolosso, desça em Pinheiros, siga na linha 4 amarela em sentido Luz, desça na estação Consolação\n")     

def menu_2():
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

def menu_3():
    # # Função sobre dúvidas frequentes relacionadas ao sistema CPTM

    # Criação de váriavel que irá receber a entrada do usuário
    pergunta = 0

    # Entrada do usuário e correção para caso o mesmo digite uma opção inexistente
    while pergunta != 1 and pergunta != 2 and pergunta != 3 and pergunta != 4 and pergunta != 5:
      pergunta = int(input("\nSelecione uma dentre as opções \n1- Horário de funcionamento \n2- Compra de bilhetes \n3- Frequência de Trens \n4- Opções de integração \n5- Atendimento ao Cliente \nQual seria sua dúvida?: "))
      while pergunta != 1 and pergunta != 2 and pergunta != 3 and pergunta != 4 and pergunta != 5:
         pergunta = int(input("\nOpção inválida \nPor favor, selecione uma das opções apresentadas"))

    # Exibição das informações de acordo com a opção do cliente
    if pergunta == 1:
     print ("\nHorário Geral: Das 4h até às 23:59 \nObservações: \n - Este horário pode ser prolongado em ocasiões especiais \n - Em feriados, este horário pode ser reduzido\n")
    elif pergunta == 2:
     print ("\nTarifa: \n - A tarifa é de R$5, mas pode sofrer alteraçõs em casos de reajuste \n \nComo Comprar Passagens:\n - Máquinas Automáticas: Disponíveis em todas as estações, permitem a compra de bilhetes. \n - Bilheteiras: Algumas estações possuem bilheteiras onde você pode comprar passagens diretamente com uma pessoa\n")
    elif pergunta == 3:
     print ("\nLinha 7-Rubi: Intervalos de 6 a 15 minutos, dependendo do horário.\nLinha 8-Diamante: Pode variar entre 5 a 12 minutos.\nLinha 9-Esmeralda: Intervalos menores durante o pico, entre 4 e 8 minutos.\nLinha 10-Turquesa: Intervalos variam entre 5 a 12 minutos.\nLinha 11-Coral: Uma das mais movimentadas, com intervalos menores nos horários de pico, cerca de 3 a 6 minutos.\nLinha 12-Safira: Intervalos variam de 5 a 15 minutos, dependendo do horário.\nLinha 13-Jade: Frequência menor, com intervalos que podem chegar a 20 ou 30 minutos, principalmente fora dos horários de pico.\n \nPara ter uma informação mais aproximada da chegada do seu trem, volte no nosso menu principal e selecione a opção 2\n")
    elif pergunta == 4:
     print ("\nBilhete Único: Integração com ônibus municipais da SPTrans e com o Metrô, permitindo combinações entre os meios de transporte pagando uma tarifa reduzida.\nMetrô: Integração direta com as linhas do Metrô nas estações Brás, Luz, Tatuapé, Barra Funda e Santo Amaro.\nÔnibus Intermunicipais (EMTU): Algumas estações da CPTM oferecem integração com linhas de ônibus intermunicipais gerenciadas pela EMTU, especialmente nas regiões metropolitanas.\nCiclovias e Bicicletários: Várias estações oferecem bicicletários gratuitos, além de ciclovias conectadas a algumas estações, facilitando a integração bicicleta-trem.\nTrens Metropolitanos: A Linha 13-Jade tem integração com o Aeroporto de Guarulhos, facilitando o transporte para a região aeroportuária.\n")
    elif pergunta == 5:
     print ("\nCentral de Atendimento: Disponível pelo telefone 0800-055-0121, funcionando 24 horas por dia para dúvidas, sugestões ou reclamações.\nFale Conosco: Formulário disponível no site oficial da CPTM para contato direto com o serviço de atendimento ao cliente.\nOuvidoria: Para casos que necessitam de uma resolução mais específica ou reclamações formais, a ouvidoria pode ser acessada pelo telefone ou pela internet.\nRedes Sociais: A CPTM também oferece atendimento ao cliente e informações em tempo real através de suas contas oficiais no Twitter e Facebook.\nPostos de Atendimento Presencial: Algumas estações possuem postos físicos de atendimento ao cliente para resolver questões relacionadas a bilhete e informações gerais.\n")
     
def menu_4():
    # Função para encerrar o programa ainda no menu principal
    print("\nAtendimento Encerrado.")
    exit()    

def run():
 # Função que executa o Menu principal, recolhe o valor e executa a função atribuida a aquele valor   
 tauba = menu_principal()
 print (tauba)

 if tauba == 1:
     menu_1()
 elif tauba == 2:
     menu_2()
 elif tauba == 3:
     menu_3()
 elif tauba == 4:
     menu_4()       
   
def pergunta():
   # Função para executar a última pergunta ao cliente
   # Criação da váriavel de pergunta
   pergunta = 0

   # Entrada do usuário informando se deseja algo a mais ou não
   while pergunta != 1 and pergunta != 2:
     pergunta = int(input("Podemos te ajudar com mais alguma coisa? \n1-Sim ou 2-Não: "))
     while pergunta != 1 and pergunta != 2:
         pergunta = int(input("Resposta inválida, por favor, responda 1-Sim ou 2-Não: "))

   # Retorna o valor a váriavel pergunta
   if pergunta == 1:
      return 1
   elif pergunta == 2:
      return 2              

def vrido():
   # Função para executar a pergunta junto do menu principal
   run()

   # Estrutura de decisão que volta a executar o menu caso a função pergunta tenha o valor 1 (sim) ou encerra caso o valor seja 2 (não)
   if pergunta() == 1:
      vrido()
   else:
      print("\nAtendimento Encerrado.")
      exit()     

vrido()