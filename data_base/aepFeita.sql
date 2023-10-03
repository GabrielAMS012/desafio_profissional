

create table Medico (  
    codMedico int,  
    crm varchar(30),  
    nome varchar(60),  
    dataNascimento date,  
    ativo char(1),  
    constraint pk_medico primary key (codMedico)  
);

create table Paciente (  
    idPaciente int,  
    nome varchar(60),  
    cpf varchar(11),  
    dataNascimento date,  
    ativo char(1),  
    endereco varchar(60),  
    constraint pk_paciente primary key (idPaciente)  
);

create table Estoque( 
    idRemedio int, 
    qnt int, 
    constraint pk_remedio primary key (idRemedio) 
    );

create table Pedido(  
    idPedido int,  
    idPaciente int,  
    codMedico int,  
    dataPedido date,  
    dataFinalUso date,  
    idRemedio int,  
    qnt int null, 
    constraint pk_pedido primary key (idPedido),  
    constraint fk_codMedico foreign key (codMedico) references Medico (codMedico),  
    constraint fk_idPaciente foreign key (idPaciente) references Paciente (idPaciente), 
    constraint fk_remedio foreign key (idRemedio) references Estoque(idRemedio) 
);

CREATE SEQUENCE LOG_SEQ  
START WITH 1  
INCREMENT BY 1  
MAXVALUE 99999  
MINVALUE 1  
CACHE 20 ;

INSERT INTO Paciente VALUES (1, 'Antonio Moreira', '11233215690', TO_DATE('15/04/1980', 'DD/MM/YYYY'), 'S', 'Rua antonio anchieta 64, Redondo');

INSERT INTO Paciente VALUES (2, 'Maria Oliveira', '22334455670', TO_DATE('25/08/1995', 'DD/MM/YYYY'), 'S', 'Avenida Principal, 123, Centro');

INSERT INTO Paciente VALUES (3, 'José Silva', '33445566780', TO_DATE('10/11/1988', 'DD/MM/YYYY'), 'S', 'Rua das Flores, 789, Jardim');

INSERT INTO Paciente VALUES (4, 'Ana Souza', '44556677890', TO_DATE('03/02/2000', 'DD/MM/YYYY'), 'N', 'Avenida Central, 456, Centro');

INSERT INTO Medico VALUES (1, '12345', 'Dr. João da Silva', TO_DATE('10/05/1985', 'DD/MM/YYYY'), 'S');

INSERT INTO Medico VALUES (2, '54321', 'Dra. Maria Oliveira', TO_DATE('20/09/1978', 'DD/MM/YYYY'), 'S');

INSERT INTO Medico VALUES (3, '67890', 'Dr. José Souza', TO_DATE('15/02/1990', 'DD/MM/YYYY'), 'S');

INSERT INTO Medico VALUES (4, '98765', 'Dra. Ana Pereira', TO_DATE('05/11/1982', 'DD/MM/YYYY'), 'N');

INSERT INTO Estoque (idRemedio, qnt, nomeRemedio)VALUES (1, 10);

INSERT INTO Estoque (idRemedio, qnt, nomeRemedio)VALUES (2, 15);

INSERT INTO Estoque (idRemedio, qnt, nomeRemedio)VALUES (3, 8);

INSERT INTO Estoque (idRemedio, qnt, nomeRemedio)VALUES (4, 20);

INSERT INTO Pedido VALUES (3, 4, 1, TO_DATE('14/08/2023', 'DD/MM/YYYY'), TO_DATE('24/08/2023', 'DD/MM/YYYY'), 1,1);

INSERT INTO Pedido VALUES (4, 3, 3, TO_DATE('16/08/2023', 'DD/MM/YYYY'), TO_DATE('26/08/2023', 'DD/MM/YYYY'), 4,1);

INSERT INTO Pedido VALUES (1, 2, 4, TO_DATE('10/08/2023', 'DD/MM/YYYY'), TO_DATE('20/08/2023', 'DD/MM/YYYY'), 2,1);

INSERT INTO Pedido VALUES (2, 1, 2, TO_DATE('12/08/2023', 'DD/MM/YYYY'), TO_DATE('22/08/2023', 'DD/MM/YYYY'), 3,1);



CREATE OR REPLACE TRIGGER estoque_tg 
AFTER INSERT ON Pedido 
FOR EACH ROW  
BEGIN 
    UPDATE Estoque 
    SET qnt = qnt - :new.qnt 
    WHERE idRemedio = :new.idRemedio; 
END;



