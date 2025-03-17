import networkx as nx

def sla():
    while True: 
        try:
            opcao = input("\nBem vindo! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")
        
            if opcao in ["1", "2", "3", "4"]:
                break
            else:
                raise ValueError

        except ValueError:
            erro = input("\nOpção inválida! \nPressione enter para continuar.")



def pergunta():
    # *Função para executar a última pergunta ao cliente*

    # Entrada do usuário informando se deseja algo a mais ou não
    while True:
        try:
            pergunta = input("\nPodemos te ajudar com mais alguma coisa?\n1 - Sim (Voltar ao Menu)\n2 - Não (Encerrar Atendimento)\nO que deseja?: ")

            if pergunta in ["1", "2"]:
                break
            else:
                raise ValueError

        except ValueError:
            erro = input("\nOpção inválida! \nPressione enter para continuar.")

    # Chamado da função correspondente a escolha do usuário
    if pergunta == "1":
        print("um da silva")
    elif pergunta == "2":
        print("dois da silva") 



if __name__ == "__main__":
    pergunta()
