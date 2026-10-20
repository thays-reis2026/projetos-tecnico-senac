package model;

public class Consulta {
    
    private String nome, cpf, telefone, data;
    private boolean jaEraPaciente;
    private boolean realizada;
    private String receita = "";

public Consulta(String nome, String cpf, String telefone, String data, boolean jaEraPaciente) {
        this.nome = nome;
        this.cpf = cpf;
        this.telefone = telefone;
        this.data = data;
        this.jaEraPaciente = jaEraPaciente;
    }

    public String getNome() { return nome; }
    public String getCpf() { return cpf; }
    public String getTelefone() { return telefone; }
    public String getData() { return data; }
    public boolean isJaEraPaciente() { return jaEraPaciente; }
    public boolean isRealizada() { return realizada; }
    public void setRealizada(boolean realizada) { this.realizada = realizada; }
    public String getReceita() { return receita; }
    public void setReceita(String receita) { this.receita = receita; }
}
