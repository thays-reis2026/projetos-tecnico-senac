programa
{
	
	funcao inicio()
	{
		//nomes de variáveis não podem conter espaços, usamos o padrão camelCase (vendasDoDia) ou snake_case (vendas_do_dia).
		real valor_pago_por_cliente [6], desconto_do_dia, valor_final, total_dia=0
		cadeia nomes [6]
		inteiro clientes_desconto = 0

		//pergunta do desconto do dia.
		escreva("Qual o desconto será aplicado no dia?")
		leia(desconto_do_dia)
		escreva("\n---Cadastro de Vendas---\n")

		//coleta de dados dos 6 clientes.
		para (inteiro i = 0; i < 6; i++)
		{
			escreva("\nQual o nome do cliente?")
			leia(nomes[i])
			
			escreva("Valor gasto por", nomes[i], ": R$ ")
			leia(valor_pago_por_cliente[i])
			}
		//processamento e exibição
		escreva("\n---Relatório de Pagamentos---\n\n")
		para (inteiro i = 0; i < 6; i++)
		{
			se (valor_pago_por_cliente[i] >= 100)
			{
				valor_final = valor_pago_por_cliente[i] - desconto_do_dia
				clientes_desconto = clientes_desconto + 1

				escreva(nomes[i], " recebeu desconto.", "\n")

				escreva("Valor total (com o desconto): ", valor_final, "\n\n")
			}
			senao
			{
				valor_final = valor_pago_por_cliente[i]

				escreva(nomes[i], " não recebeu desconto. \n")

				escreva("Valor total: ", valor_final, "\n\n")
			}
			total_dia = total_dia + valor_final
		}
		// Exibição dos totais do dia
		escreva("\nValor total recebido na loja: R$ ", total_dia, "\n")
		escreva("Quantos usuários tiveram descontos: ", clientes_desconto)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 164; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */