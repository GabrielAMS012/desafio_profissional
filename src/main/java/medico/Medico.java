package medico;

import lombok.Data;

import java.util.Date;

@Data
public class Medico {

    private Long id;
    private String crm;
    private String nome;
    private Date dataNascimento;
    private Boolean ativo;

}
