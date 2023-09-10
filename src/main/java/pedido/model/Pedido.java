package pedido.model;

import lombok.Data;
import medicamento.Medicamento;
import pedido.frequencia.Frequencia;

import java.util.Date;
import java.util.List;

@Data
public class Pedido {

    private Long id;
    private List<Medicamento> medicamentos;
    private Long codMedico;
    private Date dataPedido;
    private Date dataFinal;
    private Frequencia frequencia;

}
