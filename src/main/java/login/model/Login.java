package login.model;

import login.tipos.TipoLogin;
import lombok.Data;

@Data
public class Login {

    private Long id;
    private Long codigoCadastro;
    private TipoLogin tipoLogin;
    private String usuario;
    private String senha;

}
