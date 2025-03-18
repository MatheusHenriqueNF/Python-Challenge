def sla():
    opcao = 0
    # opcao = input("\nBem vindo! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")

    #     # Tratamento de erro na entrada do usuário
    # while opcao.isnumeric() == False or (opcao != "1" and opcao != "2" and opcao != "3" and opcao != "4"):
    #         opcao = input("\nOpção inválida \nPor favor, selecione entre opção \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")

    # while opcao not in [1, 2, 3, 4]:
    try:
            opcao = int(input("\nBem vindo! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: "))
    except ValueError or UnboundLocalError:
            while opcao != "1" and opcao != "2" and opcao != "3" and opcao != "4":
                opcao = input("\nOpção inválida \nPor favor, selecione entre opção \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")
                

def menu_principal():
    #  *Função do Menu principal*

    # Entrada do usuário, sendo apresentado e logo após escolhendo entre uma das opções
    # opcao = input("\nBem vindo! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")

    # Tratamento de erro na entrada do usuário
    # while opcao.isnumeric() == False or (opcao != "1" and opcao != "2" and opcao != "3" and opcao != "4"):
    #     opcao = input("\nOpção inválida \nPor favor, selecione entre opção \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")

    opcao = 0

    try:
            opcao = int(input("\nBem vindo! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: "))
    except ValueError or UnboundLocalError:
            while opcao != 1 and opcao != 2 and opcao != 3 and opcao != 4:
                opcao = int(input("\nOpção inválida \nPor favor, selecione entre opção \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: "))

    # Chamada de função correspondente a escolha do usuário
    if opcao == "1" and 1:
        print("ajuda_caminho()")
        print(opcao)
    elif opcao == "2" and 2:
        print("duvida_lotacao()")
        print(opcao)
    elif opcao == "3" and 3:
        print("duvidas_frequentes()")
        print(opcao)
    elif opcao == "4" and 4:
        print("encerrar()")
        print(opcao)


def asd():
    opcoes = ["1", "2", "3", "4"]

    try:
          opcao = input("\nBem vindo! \nSelecione a opção que corresponde a sua dúvida \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")
    except opcao not in opcoes:
         while opcao.isnumeric() == False or (opcao != "1" and opcao != "2" and opcao != "3" and opcao != "4"):
            opcao = input("\nOpção inválida \nPor favor, selecione entre opção \n \nOpção 1: Ajuda com qual caminho seguir \nOpção 2: Dúvida sobre lotação dos vagões \nOpção 3: Dúvidas frequentes \nOpção 4: Encerrar atendimento \n \nQual opção gostaria?: ")

if __name__ == "__main__":
    asd()

