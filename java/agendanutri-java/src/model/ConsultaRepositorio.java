
package model;

import java.util.ArrayList;
import java.util.List;

public class ConsultaRepositorio {
    
    private static final List<Consulta> consultas = new ArrayList<>();

    public static void adicionar(Consulta c) { consultas.add(c); }
    public static void remover(int indice) { consultas.remove(indice); }
    public static List<Consulta> listar() { return consultas; }
}
