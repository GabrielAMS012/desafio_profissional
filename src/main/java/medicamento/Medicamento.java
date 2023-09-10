package medicamento;

import lombok.Data;

@Data
public class Medicamento {

    private Long id;
    private String nome;
    private Boolean receitaObrigatoria;
    private String descricao;
    private String instrucoes;

}
