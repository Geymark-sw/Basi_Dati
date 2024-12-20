CREATE TABLE if not exists dipendenti(
    id_dipendente int not null,
    nome varchar(255) not null,
    cognome varchar(255) not null,
    data_assunzione date not null,
    stipendio decimal not null check (stipendio >= 1200 AND stipendio <= 5000),
    telefono varchar(10) not null unique,
    mansione varchar(255) not null default 'impiegato',
    PRIMARY KEY(id_dipendente)
);

CREATE TABLE if not exists clienti(
	id_cliente int not null,
    denominazione varchar(255) not null,
    p_iva varchar(16) not null unique,
	indirizzo varchar(255) not null,
    telefono varchar(10) not null unique,
    PRIMARY KEY(id_cliente)
);

CREATE TABLE if not exists rapporto_clienti(
    id_rapporto int not null,
    id_cliente int not null unique,
    id_dipendente int not null unique, 
    PRIMARY KEY(id_rapporto),
    FOREIGN KEY(id_cliente) REFERENCES clienti(id_cliente),
    FOREIGN KEY(id_dipendente) REFERENCES dipendenti(id_dipendente)

);