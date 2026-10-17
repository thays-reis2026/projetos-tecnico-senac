
package lojamvp;

import java.awt.FlowLayout;
import javax.swing.JOptionPane;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MVP {
   
    public static void main(String[] args) {
        JFrame janela = new JFrame();
        janela.setSize (300,200); 
        janela.setTitle ("Loja MVP");
        janela.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        janela.setLayout(new FlowLayout());
        janela.setLocationRelativeTo(null);
        
        //Criando label
        JLabel rotulo = new JLabel();
        rotulo.setText("Valor da Venda");
        janela.add(rotulo);
        
        //Criando campo de entrada
        JTextField campo = new JTextField(10);
        janela.add(campo);
        
        //Criando um Botão
        JButton botao = new JButton();
        botao.setText("Salvar");
        janela.add(botao);
        
        //Ação do botão
        botao.addActionListener(new AcaoBotao(campo, janela));

        janela.setVisible(true);
    }

    // A classe AcaoBotao fica aqui fora do main, mas dentro de Atividade1
    public static class AcaoBotao implements ActionListener {

        private JTextField campoValor;
        private JFrame janela;

        public AcaoBotao(JTextField campoValor, JFrame janela) {
            this.campoValor = campoValor;
            this.janela = janela;
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            double valor;

            // Lê e valida o valor da venda
            try {
                valor = Double.parseDouble(campoValor.getText().replace(",", "."));
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(janela, "Digite apenas números.");
                return;
            }

            if (valor <= 0) {
                JOptionPane.showMessageDialog(janela, "O valor deve ser maior que zero.");
                return;
            }

            double total = valor;

            // Se passar de 500, pede o desconto
            if (valor > 500) {
                String entrada = JOptionPane.showInputDialog(janela, "Informe o percentual de desconto:");

                if (entrada == null) {
                    return; // usuário cancelou
                }

                try {
                    double desconto = Double.parseDouble(entrada.replace(",", "."));

                    if (desconto < 0 || desconto > 100) {
                        JOptionPane.showMessageDialog(janela, "O desconto deve estar entre 0 e 100.");
                        return;
                    }

                    total = valor - (valor * desconto / 100);
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(janela, "Digite apenas números.");
                    return;
                }
            }

            // Mostra o total
            JOptionPane.showMessageDialog(janela, "Valor total: R$ " + String.format("%.2f", total));
        }
    }
}
