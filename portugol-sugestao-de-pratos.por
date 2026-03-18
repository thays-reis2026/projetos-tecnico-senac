programa
{
	
	funcao inicio()
	{
		escreva ("RESTAURANTE GLAMOUR\n")
	
		//CADASTRO DE PESSOA
		// Solicitar um valor para a variável nome, vegetariano, dieta e pagamento.
		cadeia nome
		escreva ("Qual o seu nome?")
		leia(nome)

		cadeia vegetariano
		escreva ("Você é vegetariano? SIM ou NÂO:")
		leia(vegetariano)

		cadeia dieta
		escreva ("Você faz dieta? SIM ou NÂO:")
		leia(dieta)

		cadeia prato
		cadeia pagamento
		
		se (dieta == "sim" e vegetariano == "sim") 
		{	
			prato = "Salada" 
			}
		
		senao se (dieta == "sim" e vegetariano == "não") 
		{	
			prato = "Frango Grelhado"
			}
		
		senao se (dieta == "não" e vegetariano == "sim")
		{	
			prato = "Macarrão"
			}
		
		senao
		{	
			prato = "Feijoada"
			}
			
		//Quero somente mostrar na tela o que o usuário já digitou.
		escreva("\nCliente: ", nome)
		escreva("\nSugestão de prato: ", prato)
		
		//Lógica de pagamento.
		escreva("\nQual a forma de pagamento? dinheiro ou cartão:")
		leia(pagamento)
		
		se (pagamento == "dinheiro")
		{
			escreva ("\n**Cliente possui 15% de desconto**")
			}
		}
	}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 894; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */