CREATE DATABASE IF NOT EXISTS acrp_db CHARACTER SET = latin1 COLLATE = latin1_spanish_ci;
USE acrp_db;

#  -----===== USUARIOS =====----- 
DROP TABLE IF EXISTS main_log;

CREATE TABLE main_log (
	logNr SERIAL,
	ts TIMESTAMP,
	app VARCHAR(50),
	appName VARCHAR(50),
	messType VARCHAR(1),
	message TEXT,
	PRIMARY KEY (lognr)
);

#  -----===== USUARIOS =====----- 
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
	usuario VARCHAR(20) NOT NULL,
	md5pass VARCHAR(32) NOT NULL,
	cargo VARCHAR(50) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	email VARCHAR(255) NOT NULL,
	PRIMARY KEY (usuario)
);

INSERT INTO usuarios VALUES ('vfurgeri', MD5( '12345' ) ,  'Jefa de Aeródromo',  'Valeria Noemí',  'Furgeri',  '');
INSERT INTO usuarios VALUES ('dsantovito', MD5( '12345' ) ,  'Encargado',  'Diego',  'Santovito',  '');


#  -----===== CATEGORÍAS =====----- 
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
	catID VARCHAR(10) NOT NULL,
	catVal VARCHAR(4) NOT NULL,
	descripcion VARCHAR(200),
	PRIMARY KEY (catID,catVal)
);
# Roles de Personas
INSERT INTO categorias VALUES('PER_ROL','PERS','Personal');                #  Personal 
INSERT INTO categorias VALUES('PER_ROL','INST','Instructor');              #  Instructor
INSERT INTO categorias VALUES('PER_ROL','SOCI','Socio');                   #  Socio 
INSERT INTO categorias VALUES('PER_ROL','CLIN','Cliente');                 #  Cliente 
INSERT INTO categorias VALUES('PER_ROL','PROV','Proveedor');               #  Proveedor 
# Clases de Activos
INSERT INTO categorias VALUES('ACTV_CL','HANG','Hangar');                  #  Hangar 
INSERT INTO categorias VALUES('ACTV_CL','INST','Instalación');             #  Instalación 
INSERT INTO categorias VALUES('ACTV_CL','ACFT','Avión');                   #  Avión 
# Tipos de Activos
INSERT INTO categorias VALUES('ACTV_HANG','HNG1','Hangar Clase 1');        #  Hangar Clase 1 
INSERT INTO categorias VALUES('ACTV_HANG','HNG2','Hangar Clase 2');        #  Hangar Clase 2 
INSERT INTO categorias VALUES('ACTV_ACFT','PA11','Piper PA-11');           #  Piper PA-11 
INSERT INTO categorias VALUES('ACTV_ACFT','PA38','Piper PA-38 Tomahawk');  #  Piper PA-38 Tomahawk 
INSERT INTO categorias VALUES('ACTV_ACFT','C150','Cessna 150');            #  Cessna 150 
INSERT INTO categorias VALUES('ACTV_ACFT','C152','Cessna 152');            #  Cessna 152 
INSERT INTO categorias VALUES('ACTV_ACFT','C172','Cessna 172');            #  Cessna 172 
INSERT INTO categorias VALUES('ACTV_INST','FLD','Campo');                  #  Campo 
INSERT INTO categorias VALUES('ACTV_INST','OFI','Oficinas');               #  Oficinas 
INSERT INTO categorias VALUES('ACTV_INST','TAXI','Rodaje');                #  Rodaje 
INSERT INTO categorias VALUES('ACTV_INST','RWY','Pista');                  #  Pista 
INSERT INTO categorias VALUES('ACTV_INST','FUEL','Area de Combustible');   #  Area de Combustible 
# Finalidad del Vuelo
INSERT INTO categorias VALUES('FLGT_FIN','ENT','Entrenamieto');            #  Entrenamieto 
INSERT INTO categorias VALUES('FLGT_FIN','INST','Instrucción');            #  Instrucción 
INSERT INTO categorias VALUES('FLGT_FIN','ADAP','Adaptación');             #  Adaptación 
INSERT INTO categorias VALUES('FLGT_FIN','EXA','Exámen');                  #  Exámen 

#  -----===== CONCEPTOS =====----- 
DROP TABLE IF EXISTS conceptos ;

CREATE TABLE conceptos (
	conID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	ingegr VARCHAR(1) NOT NULL,
	conGrup  VARCHAR(30) NOT NULL, #  Cliente, Socio, Otros, Avión, Servició, etc... 
	conSubGr VARCHAR(30), #  Taller, Mantenimiento, etc... 
	conName  VARCHAR(30) NOT NULL, #  Hs. de Vuelo, Combustible, etc... 
	descripcion VARCHAR(200) NOT NULL,
	PRIMARY KEY (conID)
);

#  Ingresos 
INSERT INTO conceptos VALUES(NULL,'I','Socio',NULL,'Hs. de Vuelo','Hs. de Vuelo Aeronave');     #  Hs. de Vuelo 
INSERT INTO conceptos VALUES(NULL,'I','Socio',NULL,'Cuota Social','Cuota Social');              #  Cuota Social 
INSERT INTO conceptos VALUES(NULL,'I','Socio',NULL,'Combustible','Combustible');                #  Combustible 
INSERT INTO conceptos VALUES(NULL,'I','Socio',NULL,'Aceite','Aceite');                          #  Aceite 
INSERT INTO conceptos VALUES(NULL,'I','Socio',NULL,'Hangaraje','Hangaraje');                    #  Hangaraje 
INSERT INTO conceptos VALUES(NULL,'I','Cliente',NULL,'Búsqueda','Búsqueda');                    #  Búsqueda 
INSERT INTO conceptos VALUES(NULL,'I','Cliente',NULL,'Vuelo de Bautismo','Vuelo de Bautismo');  #  Vuelo de Bautismo 
INSERT INTO conceptos VALUES(NULL,'I','Cliente',NULL,'Combustible','Combustible');              #  Combustible 
INSERT INTO conceptos VALUES(NULL,'I','Cliente',NULL,'Aceite','Aceite');                        #  Aceite 
INSERT INTO conceptos VALUES(NULL,'I','Otros',NULL,'Publicidad','Publicidad por');              #  Publicidad 
INSERT INTO conceptos VALUES(NULL,'I','Otros',NULL,'Ingreso Eventual','Ingreso Eventual por');  #  Ingreso Eventual 
#  Egresos 
INSERT INTO conceptos VALUES(NULL,'E','Insumos',NULL,'Combustible','Combustible');               #  Combustible 
INSERT INTO conceptos VALUES(NULL,'E','Insumos',NULL,'Aceite','Aceite');                         #  Aceite 
INSERT INTO conceptos VALUES(NULL,'E','Insumos',NULL,'Repuesto','Repuesto');                     #  Repuesto 
INSERT INTO conceptos VALUES(NULL,'E','Insumos',NULL,'Otro','Otro');                             #  Otro 
INSERT INTO conceptos VALUES(NULL,'E','Servicios',NULL,'Pago','Pago por Servicio');              #  Pago por Servicio 
INSERT INTO conceptos VALUES(NULL,'E','Avión','Taller','Inspección 25hs.','Inspección 25hs.');   #  Inspección 25hs. 
INSERT INTO conceptos VALUES(NULL,'E','Avión','Taller','Inspección 50hs.','Inspección 50hs.');   #  Inspección 50hs. 
INSERT INTO conceptos VALUES(NULL,'E','Avión','Taller','Inspección 100hs.','Inspección 100hs.'); #  Inspección 100hs. 
INSERT INTO conceptos VALUES(NULL,'E','Avión','Taller','Overhaul','Overhaul');                   #  Overhaul 
INSERT INTO conceptos VALUES(NULL,'E','Avión','Taller','Reparación','Reparación');               #  Reparación 
INSERT INTO conceptos VALUES(NULL,'E','Hangar','Mantenimiento','Materiales','Materiales');       #  Materiales 
INSERT INTO conceptos VALUES(NULL,'E','Hangar','Mantenimiento','M/O','Mano de Obra');            #  Mano de Obra 
INSERT INTO conceptos VALUES(NULL,'E','Instalación','Mantenimiento','Materiales','Materiales');  #  Materiales 
INSERT INTO conceptos VALUES(NULL,'E','Instalación','Mantenimiento','M/O','Mano de Obra');       #  Mano de Obra 
INSERT INTO conceptos VALUES(NULL,'E','Personal',NULL,'Salario','Salario');                      #  Salario 
INSERT INTO conceptos VALUES(NULL,'E','Personal',NULL,'Viáticos','Viáticos');                    #  Viáticos 
INSERT INTO conceptos VALUES(NULL,'E','Personal',NULL,'Honorarios','Honorarios');                #  Honorarios 
INSERT INTO conceptos VALUES(NULL,'E','Personal',NULL,'Adelanto','Adelanto');                    #  Adelanto 

#  -----===== ACTIVOS =====----- 
DROP TABLE IF EXISTS activos ;

CREATE TABLE activos (
	actID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	actCl VARCHAR(4) NOT NULL, #  Clase: Hangar, Inst., Avión,... sale de categorias por ACTV_CL 
	actTp VARCHAR(4) NOT NULL, #  Tipo: Hangar Clase 1, Rodaje, PA-11, etc... sale de categorías por ACTV_.actCl 
	matricula VARCHAR(10),
	marca VARCHAR(20),
	potencia TINYINT UNSIGNED,
	clase VARCHAR(10),
	nombre VARCHAR(200),
	ingresos BOOL NOT NULL DEFAULT 0,
	egresos BOOL NOT NULL DEFAULT 0,
	PRIMARY KEY (actID)
);

#  -----===== PERSONAS =====----- 
DROP TABLE IF EXISTS personas ;

CREATE TABLE personas (
	perID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	rol VARCHAR(4),
	nombre VARCHAR(100),
	apellido VARCHAR(100),
	numSoc INT,
	vtoPsico DATE,
	piloto BOOL,
	PRIMARY KEY (perID)
);

#  -----===== ASIENTOS =====----- 
DROP TABLE IF EXISTS asientos_head ;

CREATE TABLE asientos_head (
	doc INT ZEROFILL NOT NULL AUTO_INCREMENT,
	ts TIMESTAMP,
	fechaDoc DATE,
	recibo VARCHAR(13),
	perID INT UNSIGNED, # A quien se emite el Documento
	total DEC(10,2),
	ingegr VARCHAR(1), #  Ingreso / Egreso 
	status VARCHAR(1),
	usuario VARCHAR(20) NOT NULL,
	PRIMARY KEY (doc),
	FOREIGN KEY (perID)
	  REFERENCES personas(perID)
      ON UPDATE CASCADE ON DELETE RESTRICT
);

DROP TABLE IF EXISTS asientos_det ;

CREATE TABLE asientos_det (
	doc INT ZEROFILL NOT NULL,
	pos SMALLINT ZEROFILL NOT NULL,
	conID INT UNSIGNED NOT NULL,          #  Concepto 
	actID INT UNSIGNED,                   #  Si aplica, AVIÓN, HANGAR, ETC. 
	cant DEC(10,2),                       #  Cant. Horas por ej. 
	pr_un DEC(10,2),                      #  Pr. Unitario 
	valor DEC(10,2) NOT NULL,             #  Valor del Concepto (Cant x Pr.Un) 
	descripcion VARCHAR(200),             #  si Aplica 
	PRIMARY KEY (doc,pos),
	FOREIGN KEY (doc)
	  REFERENCES asientos_head(doc)
      ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (conID)
	  REFERENCES conceptos(conID)
      ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY (actID)
	  REFERENCES activos(actID)
      ON UPDATE CASCADE ON DELETE RESTRICT
);

#  -----===== VUELOS =====----- 
DROP TABLE IF EXISTS vuelos ;

CREATE TABLE vuelos (
	flID INT ZEROFILL NOT NULL AUTO_INCREMENT,
	perID_pilot INT UNSIGNED,
	perID_copi INT UNSIGNED,
	depLoc VARCHAR(20) NOT NULL,   #  AD Salida 
	arrLoc VARCHAR(20),            #  AD Arribo 
	localFl BOOL NOT NULL,         #  Vuelo local (sobre aeródromo) 
	depTs DATETIME,                #  Hora Departure 
	arrTs DATETIME,                #  Hora Arrival 
	depHor DEC(10,2),              #  Horímetro Sal. 
	arrHor DEC(10,2),              #  Horímetro Arribo 
	aterr  TINYINT UNSIGNED,       #  Aterrizajes 
	finalidad VARCHAR(10),         #  Finalidad del Vuelo: ENT, INST, ADAP, etc... sale de categorías por FLGT_FIN 
	usuario VARCHAR(20) NOT NULL,
	PRIMARY KEY (flID),
	INDEX pilot (perID_pilot),
	INDEX copi (perID_copi),
	FOREIGN KEY (perID_pilot)
	  REFERENCES personas(perID)
      ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (perID_copi)
	  REFERENCES personas(perID)
      ON UPDATE CASCADE ON DELETE RESTRICT
);

#  -----===== VISTAS =====-----
DROP VIEW IF EXISTS entradas ;
CREATE VIEW entradas 
  AS SELECT asientos_head.doc, 
            asientos_det.pos,
            asientos_head.fechaDoc,
            asientos_det.valor
  FROM asientos_head INNER JOIN asientos_det
    ON asientos_head.doc = asientos_det.doc
  WHERE asientos_head.ingegr = 'I'
  ORDER BY asientos_head.ts;

DROP VIEW IF EXISTS salidas ;
CREATE VIEW salidas 
  AS SELECT asientos_head.doc, 
            asientos_det.pos,
            asientos_head.fechaDoc,
            asientos_det.valor
  FROM asientos_head INNER JOIN asientos_det
    ON asientos_head.doc = asientos_det.doc
  WHERE asientos_head.ingegr = 'E'
  ORDER BY asientos_head.ts;
  
  INSERT INTO main_log VALUES (NULL, NULL, 'ACRP_DB_Init.sql','ACRP - Inicialización de BD','S','Inicialización de la Base de Datos finalizada con éxito.');