create schema Vente;

create dbspace SP_COMMANDES;

create dbspace SP_CLIENT;

create table CLIENT ( NUMCLIENT char (12) not null,

                      NOM char (38) not null,

                      PRENOM char (40) not null,

                      ADRESSE char (60) not null,

             primary key (NUMCLIENT) )

             in SP_CLIENT;


create table COMMANDES ( NUMCOMMANDE char (12) not null,

                        ADRESSELIVRAISON char (60) not null,

                        PRODUITS char (30) not null,

                        QUANTITE decimal (60)

                        DATE date,



             primary key (NUMCOMMANDE) )

             in SP_COMMANDES;


create table PRODUITS ( REFERENCE char (30) not null,

                    	  LIBELLE char (20) not null,

                        PRIX decimal (15);

             primary key (REFERENCE),


create table INCLUSION 	    (NUMCOMMANDE char (12) not null,

                          	REFERENCE char (30) not null,

             	primary key (REFERENCE,NUMCOMMANDE),

            	foreign key (REFERENCE) references PRODUITS

                	on delete no action on update no action,

            	foreign key (NUMCOMMANDE) references COMMANDES

                	on delete cascade on update cascade)

            	in SP_CLIENT
            	in SP_COMMANDES;


create index XREF_REF on PRODUITS(REF);

create index XREF_REF on INCLUSION(REF);

create index XCOM_NUMCOM on COMMANDES(NUMCOM);

create index XCOM_NUMCOM on INCLUSION(NUMCOM);

create unique index XCLI_NUMCLI on CLIENT(NUMCLI);