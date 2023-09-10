package paciente.endereco;

import lombok.Data;

@Data
public class Endereco {

    private Long cep;
    private String bairro;
    private String rua;
    private Long numero;
    private String referencia;

}
