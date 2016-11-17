create schema Banque;

create dbspace SP_COMPTES;

create dbspace SP_CLIENT;

create table CLIENT ( NUMCLIENT char (12) not null,

                      NOM char (38) not null,

                      PRENOM char (40) not null,

                      ADRESSE char (60) not null,

             primary key (NUMCLIENT) )

             in SP_CLIENT;


create table COMPTES ( NUMCOMPTE char (12) not null,

                      MONTANT decimal (50),

             primary key (NUMCOMPTE) )

             in SP_COMPTES;


create table OPERATIONS ( NUMOPERATION char (25) not null,

                    	  NUMCOMPTE char (12) not null,

                      	  DATE date,

                    	  RETRAIT decimal (50),

                    	  DEPOT decimal (50),

             primary key (NUMOPERATION),

             foreign key (NUMCOMPTE) references COMPTES

             		on delete no action on update cascade)

             in SP_COMPTES;


create table POSSESSION 	(NUMCLIENT char (12) not null,

                          	NUMCOMPTE char (12) not null,

             	primary key (NUMCLIENT,NUMCOMPTE),

            	foreign key (NUMCLIENT) references CLIENT

                	on delete no action on update cascade,

            	foreign key (NUMCOMPTE) references COMPTES

                	on delete cascade on update cascade)

            	in SP_CLIENT
            	in SP_COMPTES;


create index XCLI_NUMCLI on CLIENT(NUMCLI);

create index XCLI_NUMCLI on POSSESSION(NUMCLI);

create index XCMPT_NUMCMPT on COMPTES(NUMCMPT);

create index XCMPT_NUMCMPT on POSSESSION(NUMCMPT);

create unique index XOP_NUMOP on OPERATIONS(NUMOP);