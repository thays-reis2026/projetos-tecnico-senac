package util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.ResolverStyle;

public class Validador {
    
    private static final DateTimeFormatter FORMATO =
        DateTimeFormatter.ofPattern("dd/MM/uuuu").withResolverStyle(ResolverStyle.STRICT);

    public static boolean cpfValido(String cpf) {
        return cpf.matches("\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}");
    }

    public static boolean telefoneValido(String tel) {
        // aceita 0123-4567, 91234-5678, (98) 91234-5678
        return tel.matches("(\\(\\d{2}\\)\\s?)?\\d{4,5}-\\d{4}");
    }

    public static boolean dataValida(String data) {
        try {
        LocalDate.parse(data, FORMATO);
        return true;
    }   catch (Exception e) {
        return false;
    }
  }
}