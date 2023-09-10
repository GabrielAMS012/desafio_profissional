package paciente;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Paciente {

    private Long id;
    private String nome;
    private String cpf;
    private Boolean ativo;


}
