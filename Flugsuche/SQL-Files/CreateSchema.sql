create table kunde
(
	kundeid integer primary key auto_increment,
    anrede varchar(4),
    titel varchar(20),
    vorname varchar(100),
    nachname varchar(100),
    geburtsdatum date,
    email varchar(255) unique,
    passwort varchar(255),
    strasse varchar(255),
    hausnummer varchar(5),
    postleitzahl varchar(5),
    ort varchar(255),
    nutzerbild blob,
    istPremium boolean
);

create table fluggesellschaft
(
	fluggesellschaftid integer primary key auto_increment,
    bezeichnung varchar(255)
);

create table flugzeugtyp
(
	flugzeugtypid integer primary key auto_increment,
    bezeichnung varchar(255),
    anzahlSitzplaetzeFirstClass integer,
    anzahlSitzplaetzeEconomy integer,
    fk_flugzeuggesellschaft integer,
    constraint fk_flugzeugtyp_flugzeuggesellschaft 
		foreign key (fk_flugzeuggesellschaft) 
        references fluggesellschaft(fluggesellschaftid)
        on delete cascade
        on update cascade
);

create table zusatzleistung(
	zusatzleistungid integer primary key auto_increment,
    bezeichnung varchar(255),
    beschreibung blob,
    preis decimal(10,2),
    fk_flugzeugtyp integer,
    constraint fk_zusatzleistung_flugzeugtyp
		foreign key (fk_flugzeugtyp)
        references flugzeugtyp(flugzeugtypid)
        on delete cascade
        on update cascade
);

create table flughafen(
	flughafenid integer primary key auto_increment,
    ort varchar(255),
    kuerzel varchar(5),
    zeitzone decimal(3,1)
);

create table flug(
	flugid integer primary key auto_increment,
    abflugzeit datetime,
    fugdauer time,
    preis decimal(10,2),
    fk_abflughafen integer,
    fk_anflughafen integer,
    fk_flugzeugtyp integer,
    constraint fk_flug_abflughafen
		foreign key (fk_abflughafen)
        references flughafen(flughafenid)
        on delete cascade
        on update cascade,
	constraint fk_flug_anflughafen
		foreign key (fk_anflughafen)
        references flughafen(flughafenid)
        on delete cascade
        on update cascade,
	constraint fk_flug_flugzeugtyp
		foreign key (fk_flugzeugtyp)
        references flugzeugtyp(flugzeugtypid)
        on delete cascade
        on update cascade
);

create table angebot(
	angebotid integer primary key auto_increment,
    bezeichnung varchar(255),
    beschreibung blob,
    bild blob,
    angebotspreis decimal(10,2),
    fk_flug integer,
    constraint fk_angebot_flug
		foreign key (fk_flug)
        references flug(flugid)
        on delete cascade
        on update cascade
);

create table sitzplatz(
	sitzplatzid integer,
    istFirstClass boolean,
    status varchar(10),
    fk_flug integer,
    constraint pk_sitzplatz primary key (fk_flug, sitzplatzid),
    constraint fk_sitzplatz_flug
		foreign key (fk_flug)
        references flug(flugid)
        on delete cascade
        on update cascade
);

create table buchung(
	buchungid integer primary key auto_increment,
    zeitstempel timestamp default current_timestamp,
    preis decimal(10,2),
    fk_flug integer,
    fk_sitzplatz integer,
    fk_kunde integer,
    constraint fk_buchung_sitzplatz
		foreign key (fk_flug, fk_sitzplatz)
        references sitzplatz(fk_flug, sitzplatzid)
        on delete cascade
        on update cascade,
	constraint fk_buchung_nutzer
		foreign key (fk_kunde)
        references kunde(kundeid)
        on delete cascade
        on update cascade
);
    