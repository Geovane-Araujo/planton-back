
create table nutrientes(

    id serial primary key,
    descricao varchar(70)
);

create table fases_crecimento(

    id serial primary key,
    descricao varchar(70)
);

create table if not exists plantas(

    id serial primary key,
    nome varchar(70),
    nomecientifico varchar(70),
    familia varchar(70),
    luminosidade varchar(70),
    ciclovida varchar(70),
    categoria varchar(500),
    caracteristica varchar(70)
);

alter table plantas add nomecientifico varchar(70);
alter table plantas add familia varchar(70);
alter table plantas add luminosidade varchar(70);
alter table plantas add ciclovida varchar(70);
alter table plantas add categoria varchar(70);


create table if not exists plantas_fases_crecimento(

    id serial primary key,
    idplanta int,
    idfase int,
    temperatura real,
    humidade real,
    nivelagua real,
    ph real,
    luminosidade real
);
alter table plantas_fases_crecimento add constraint fk_idfasecrecimento foreign  key (idfase) references fases_crecimento(id);
alter table plantas_fases_crecimento add constraint fk_idplantas foreign  key (idplanta) references plantas(id);



create table if not exists pessoa(

    id serial primary key,
    nome varchar(70)
);

create table if not exists pessoa_dadoscontato(

    id serial primary key,
    idpessoa int,
    cep varchar(70),
    endereco varchar(160),
    bairro varchar(70),
    numero varchar(10),
    complemento varchar(50),
    cidade varchar(50),
    uf varchar(2),
    residencial varchar(11),
    celular varchar(11),
    comercial varchar(11)
);

create table if not exists pessoa_usuario(

    id serial primary key,
    idpessoa int,
    login varchar(70),
    senha varchar(20)
);

create table if not exists pessoa_estufa(

    id serial primary key,
    idpessoa int,
    proprietario varchar(70),
    responsavel varchar(70)
);

create table if not exists localizacao_sensor(

    id serial primary key,
    descricao varchar(70)
);

create table if not exists medidas(

    id serial primary key,
    descricao int
);

create table if not exists leitura_sensor(

    id serial primary key,
    idmedida int,
    valor real,
    datahora timestamp,
    idlocalizacao int
);

create table if not exists cutivo(

    id serial primary key,
    idfasesplanta int,
    quantidade real,
    idlocalizacao int
);

create table if not exists cidade(

    id serial primary key,
    idestado int,
    ibge int,
    nome varchar(70)
);

create table if not exists estado(

    id serial primary key,
    nome varchar(50),
    codigouf int UNIQUE,
    uf char(2),
    regiao int
);

alter table cutivo add constraint fk_cutivo_fases_planta foreign key (idfasesplanta) references fases_plantas(id);
alter table cutivo add constraint fk_cutivo_localizacao_sensor foreign key (idlocalizacao) references localizacao_sensor(id);

alter table leitura_sensor add constraint fk_leitura_sensor_localizacao_sensor foreign key (idlocalizacao) references localizacao_sensor(id);
alter table leitura_sensor add constraint fk_leitura_sensor_medidas foreign key (idmedida) references medidas(id);

alter table pessoa_estufa add constraint fk_pessoa_estufa_pessoa foreign key (idpessoa) references pessoa(id)on delete cascade;
alter table pessoa_usuario add constraint fk_pessoa_usuario_pessoa foreign key (idpessoa) references pessoa(id)on delete cascade;
alter table pessoa_dadoscontato add constraint fk_pessoa_dadoscontato_pessoa foreign key (idpessoa) references pessoa(id) on delete cascade;

alter table fases_crecimento_nutrientes add constraint fk_fases_crecimento_nutrientes_fases_crecimento foreign key (idfasecrecimento) references fases_crecimento(id);
alter table fases_plantas add constraint fk_fases_plantas_plantas foreign key (idplanta) references plantas(id);
alter table fases_plantas add constraint fk_fases_plantas_fases foreign key (idfase) references fases_crecimento(id);


create table dynamic(

    id serial primary key,
    route varchar(100),
    sql varchar,
    tablebase varchar(50)

);