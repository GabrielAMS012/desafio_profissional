package paciente.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import paciente.endereco.Endereco;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Paciente {

    private Long id;
    private String nome;
    private String cpf;
    private Boolean ativo;
    private Endereco endereco;

}
