insert into Pais
values
('Argentina',0,getdate(),1);


insert into Provincia
values
('Buenos Aires',1,0,getdate(),1);


insert into TipoDomicilio (Descripcion, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
('Particular',0, getdate(),1),
('Comercial',0, getdate(),1),
('Laboral',0, getdate(),1);


insert into Localidad (Descripcion, IdProvincia, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
('Moron',1,0,getdate(),1),
('San Justo',1,0,getdate(),1),
('Ramos Mejía',1,0,getdate(),1),
('Ciudad Evita',1,0,getdate(),1),
('Isidro Casanova',1,0,getdate(),1),
('Laferrere',1,0,getdate(),1),
('González Catán',1,0,getdate(),1),
('20 de Junio',1,0,getdate(),1),
('Ituzaingó',1,0,getdate(),1),
('Merlo',1,0,getdate(),1);


insert into Institucion (Nombre, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
('UNLAM',0,getdate(),1),
('UBA',0,getdate(),1),
('UAI',0,getdate(),1);

/*
insert into Perfil (Nombre, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
('Administrador',0,getdate(),1),
('Profesional',0,getdate(),1),
('Paciente',0,getdate(),1),
('Institución',0,getdate(),1); 
*/


insert into Usuario (Nombre, Email, Password, IdPerfil, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
('Admin','admin@yana.com.ar','7c4a8d09ca3762af61e59520943dc26494f8941b',1,0,getdate(),1);

insert into Usuario (Nombre, Apellido, DNI, TelefonoParticular, Celular, Email, Password, IdPerfil, FechaNacimiento, Sexo,
BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
/* PACIENTES */
('Camila','Minetti',41768854,null,1156988568,'camilaminetti.cdm@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1999/04/09 00:00:00.000','F',0,getdate(),1),
('Gabriel','Cascallares',37376896,null,1158509535,'alejandro.c3737@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1993/04/05 00:00:00.000','M',0,getdate(),1),
('Cecilia','Merlak',32361717,null,1151375053,'cecilia_merlak@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1979/09/03 00:00:00.000','F',0,getdate(),1),
('Elias','Gómez',26496956,null,1151274963,'elias_gomez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1990/01/01 00:00:00.000','M',0,getdate(),1),
('Lucía','Díaz',38669328,null,1141658965,'lucia_diaz@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1994/07/25 00:00:00.000','F',0,getdate(),1),
('Micaela','Benitez',36123987,null,1167884367,'micaela_benitez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1999/01/17 00:00:00.000','F',0,getdate(),1),
('Gastón','López',32489938,null,1136795776,'gaston_lopez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1984/09/19 00:00:00.000','M',0,getdate(),1),
('Alejandro','Borelli',28293849,null,1143279856,'alejandro_borelli@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1992/12/12 00:00:00.000','M',0,getdate(),1),
('Diego','Juarez',23904887,null,1134759467,'diego_juarez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1990/02/09 00:00:00.000','M',0,getdate(),1),
('Rebeca','Lucero',34209378,null,1155746808,'rebeca_lucero@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1976/05/27 00:00:00.000','F',0,getdate(),1),
('Candela','Pérez',29103515,null,1152480086,'candela_perez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1983/10/29 00:00:00.000','F',0,getdate(),1),
('Adrian','Albornoz',34357000,null,1152480086,'adrian_albornoz@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1997/02/13 00:00:00.000','M',0,getdate(),1),
('Gonzalo','Crespo',38930490,null,1155387643,'gonzalo_crespo@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1984/05/07 00:00:00.000','M',0,getdate(),1),
('Matias','Prieto',34538900,null,1157434576,'matias_prieto@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1987/12/01 00:00:00.000','M',0,getdate(),1),
('Mónica','Pereira',38425563,null,1145692326,'monica_pereira@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1981/05/25 00:00:00.000','F',0,getdate(),1),


/* PROFESIONALES */
('Ignacio','Baldo',38307024,null,1158962871,'baldoignacio.u@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
2,'1994/06/18 00:00:00.000','M',0,getdate(),1),
('Diego','González',32361717,null,1141658965,'diego.gonzalez301@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
2,'1986/08/09 00:00:00.000','M',0,getdate(),1),
('Denise','Torres',35122435,null,1136579073,'denis_torres@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
2,'1992/05/13 00:00:00.000','F',0,getdate(),1),
('Ayelén','Morales',33569485,null,1144278009,'ayelen_morales@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
2,'1990/01/30 00:00:00.000','F',0,getdate(),1),
('Julián','Vega',32361717,null,1144201270,'julian_vega@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
2,'1987/12/28 00:00:00.000','M',0,getdate(),1),
('Victoria','Saenz',32361717,1144268900,null,'victoria_saenz@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
2,'1975/03/19 00:00:00.000','F',0,getdate(),1),
('Rodrigo','Gimenez',36893345,1198874568,null,'rodrigo_gimenez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
2,'1984/07/15 00:00:00.000','M',0,getdate(),1),
('Ivan','Rivas',27456345,1123644568,null,'ivan_rivas@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
2,'1991/02/28 00:00:00.000','M',0,getdate(),1),

/* REPRESENTANTES INSTITUCIÓN */
('Juan','Barbosa',34123768,1167090345,null,'juan_barbosa@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
4,'1974/11/13 00:00:00.000','M',0,getdate(),1),
('Mariano','Juarez',30459204,1122380043,null,'mariano_juarez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
4,'1983/12/03 00:00:00.000','M',0,getdate(),1),
('Gerardo','Juiz',34569087,1123585473,null,'gerardo_juiz@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
4,'1977/10/09 00:00:00.000','M',0,getdate(),1),

/* NUEVOS USUARIOS PACIENTES*/
('Hernan','Martin',34538100,null,1157434576,'hernan_martin@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1988/12/01 00:00:00.000','M',0,getdate(),1),
('Julieta','Churukian',38425101,null,1145692326,'julieta_churukian@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1980/05/25 00:00:00.000','F',0,getdate(),1),
('Alan','Snyder',34538900,null,1157434576,'alan_snyder@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1981/12/01 00:00:00.000','M',0,getdate(),1),
('María','Soto',38425563,null,1145692326,'maria_sotogmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1982/05/25 00:00:00.000','F',0,getdate(),1),
('Alejo','Martinez',34538900,null,1157434576,'alejo_martinez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1983/12/01 00:00:00.000','M',0,getdate(),1),
('Yanina','Denis',38425563,null,1145692326,'yanina_denis@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1984/05/25 00:00:00.000','F',0,getdate(),1),
('Ignacio','Crescenzo',34538900,null,1157434576,'ignacio_crescenzo@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1985/12/01 00:00:00.000','M',0,getdate(),1),
('Casandra','Lastra',38425563,null,1145692326,'monica_pereira@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1986/05/25 00:00:00.000','F',0,getdate(),1),
('Tomas','Nuñez',34538900,null,1157434576,'tomas_nunez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1987/12/01 00:00:00.000','M',0,getdate(),1),
('Tamara','Senatore',38425563,null,1145692326,'tamara_senatore@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1988/05/25 00:00:00.000','F',0,getdate(),1),
('Martin','Nuñez',34538900,null,1157434576,'martin_nunez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1989/12/01 00:00:00.000','M',0,getdate(),1),
('Leila','Gomez',38425563,null,1145692326,'leila_gomez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1990/05/25 00:00:00.000','F',0,getdate(),1),
('Fernando','Gimenez',34538900,null,1157434576,'fernando_gimenez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1991/12/01 00:00:00.000','M',0,getdate(),1),
('Brenda','Iracheta',38425563,null,1145692326,'julieta_iracheta@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1992/05/25 00:00:00.000','F',0,getdate(),1),
('Alan','Gonzalez',34538900,null,1157434576,'alan_gonzalez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1993/12/01 00:00:00.000','M',0,getdate(),1),
('Candela','Barba',38425563,null,1145692326,'candela_barba@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1994/05/25 00:00:00.000','F',0,getdate(),1),
('Daniel','De marco',34538900,null,1157434576,'daniel_demarco@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1985/12/01 00:00:00.000','M',0,getdate(),1),
('Abigail','Diaz',38425563,null,1145692326,'abigail_diaz@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1996/05/25 00:00:00.000','F',0,getdate(),1),
('Carlos','Perez',34538900,null,1157434576,'carlos_perez@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1997/12/01 00:00:00.000','M',0,getdate(),1),
('Carolina','Moreyra',38425563,null,1145692326,'carolina_moreyra@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1998/05/25 00:00:00.000','F',0,getdate(),1),
('Dylan','Albornoz',34538900,null,1157434576,'dylan_albornoz@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'1999/12/01 00:00:00.000','M',0,getdate(),1),
('Micaela','Nuño',38425563,null,1145692326,'micaela_nuno@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',
3,'2000/05/25 00:00:00.000','F',0,getdate(),1);


/*
insert into DomicilioUsuario (IdUsuario, Calle, Numero, Piso, Depto, EntreCalle1, 
	EntreCalle2, Telefono1, Telefono2, Celular1, Celular2, TelefonoEmergencia, Observaciones, 
	IdTipoDomicilio, IdLocalidad, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
(2,'Florencio Varela', '1903', null, null, 'Ombú', 'Zapiola', '01144808900', null, null, null, null, 
null, '3','2',0,getdate(),1),
(3,'Diego de Villarroel', '578', null, null, 'Simón Pérez', 'Equiza', null, null, null, null, null, 
null, '1','7',0,getdate(),1),
(4,'Av. Brig. Gral. Juan Manuel de Rosas ', '3910', null, null, 'Av. Monseñor Bufano', 'Sarandi', '1514447025', null, null, null, null, 
null, '2','2',0,getdate(),1),
(5,'Necochea', '955', null, null, 'Tacuarí', 'Gral. Alvarado', '01144691237', null, null, null, null, 
null, '1','3',0,getdate(),1),
(6,'M.M. de Güemes', '4197', null, null, 'José Mario Bevilacqua', 'La chuña', '1555791274', null, null, null, null, 
null, '2','4',0,getdate(),1),
(7,'Carlos Casares', '2362', 3, 'D', 'J. Larsen', 'José Miguel Lanza', '1144662041', null, null, null, null, 
null, '3','5',0,getdate(),1);
*/


insert into UsuarioInstitucion (IdUsuario, IdInstitucion,BajaLogica,FechaModificacion,IdUsuarioModificacion)
values 
(25,1,0,getdate(),1),
(26,2,0,getdate(),1),
(27,3,0,getdate(),1);


insert into ProfesionalInstitucion (IdProfesional, IdInstitucion, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
(17,1,0,getdate(),1),
(18,1,0,getdate(),1),
(19,1,0,getdate(),1),
(20,1,0,getdate(),1),
(21,2,0,getdate(),1),
(22,2,0,getdate(),1),
(23,3,0,getdate(),1);
/*(24,3,0,getdate(),1)*/


insert into GrupoPatologia
values
('Trastorno del estado de animo',0,getdate(),1),
('Neurosis',0,getdate(),1),
('Psicosis',0,getdate(),1),
('Trastorno de personalidad',0,getdate(),1);

insert into Patologia
values
('Depresivos','',0,getdate(),1),
('Bipolares','',0,getdate(),1),
('Ciclotimicos','',0,getdate(),1),
('Trastornos de ansiedad','',0,getdate(),1),
('Trastornos obsesivo-compulsivo','',0,getdate(),1),
('Trastornos de ansiedad fobica','',0,getdate(),1),
('Trastornos del animo','',0,getdate(),1),
('Trastornos somatomorfos','',0,getdate(),1),
('Trastornos disociativos','',0,getdate(),1),
('Trastornos de la conducta alimentaria, sexuales, sueño, etc','',0,getdate(),1),
('Trastornos de ansiedad','',0,getdate(),1),
('Ezquizofrenia','',0,getdate(),1),
('Trastornos ezquizofreniforme','',0,getdate(),1),
('Trastornos ezquizoafectivo','',0,getdate(),1),
('Trastornos delirante','',0,getdate(),1),
('Trastornos psicotico breve','',0,getdate(),1),
('Trastornos psicotico compartido (folie a deux)','',0,getdate(),1),
('Trastornos psicotico por enfermedad medica','',0,getdate(),1),
('Trastornos psicotico inducido por sustancias','',0,getdate(),1),
('Trastornos psicotico no especificado','',0,getdate(),1),
('Trastornos paranoide de la personalidad','',0,getdate(),1),
('T.P. ezquizoide / ezquizotipico ','',0,getdate(),1),
('T.P. histrionico','',0,getdate(),1),
('T.P. narcisistica','',0,getdate(),1),
('T.P. antisocial','',0,getdate(),1),
('T.P. por evitacion / por dependencia','',0,getdate(),1),
('T.P. obsesivo-compulsivo','',0,getdate(),1);

insert into PatologiaGrupoPatologia
values
(1,1,0,getdate(),1),
(2,1,0,getdate(),1),
(3,1,0,getdate(),1),
(4,2,0,getdate(),1),
(5,2,0,getdate(),1),
(6,2,0,getdate(),1),
(7,2,0,getdate(),1),
(8,2,0,getdate(),1),
(9,2,0,getdate(),1),
(10,2,0,getdate(),1),
(11,3,0,getdate(),1),
(12,3,0,getdate(),1),
(13,3,0,getdate(),1),
(14,3,0,getdate(),1),
(15,3,0,getdate(),1),
(16,3,0,getdate(),1),
(17,3,0,getdate(),1),
(18,3,0,getdate(),1),
(19,3,0,getdate(),1),
(20,4,0,getdate(),1),
(21,4,0,getdate(),1),
(22,4,0,getdate(),1),
(23,4,0,getdate(),1),
(24,4,0,getdate(),1),
(25,4,0,getdate(),1),
(26,4,0,getdate(),1);


insert into PacientePatologia (IdPaciente, IdPatologia, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
(2,1,0,getdate(),1),
(3,2,0,getdate(),1),
(4,2,0,getdate(),1),
(5,3,0,getdate(),1),
(6,4,0,getdate(),1),
(7,4,0,getdate(),1),
(8,4,0,getdate(),1),
(9,4,0,getdate(),1),
(10,5,0,getdate(),1),
(11,6,0,getdate(),1),
(12,7,0,getdate(),1),
(13,7,0,getdate(),1),
(14,7,0,getdate(),1),
(15,7,0,getdate(),1),
(28,8,0,getdate(),1),
(29,8,0,getdate(),1),
(30,8,0,getdate(),1),
(31,8,0,getdate(),1),
(32,9,0,getdate(),1),
(33,9,0,getdate(),1),
(34,9,0,getdate(),1),
(35,9,0,getdate(),1),
(36,9,0,getdate(),1),
(37,10,0,getdate(),1),
(38,10,0,getdate(),1),
(39,10,0,getdate(),1),
(40,10,0,getdate(),1),
(41,10,0,getdate(),1),
(42,1,0,getdate(),1),
(43,1,0,getdate(),1),
(44,1,0,getdate(),1),
(45,1,0,getdate(),1),
(46,1,0,getdate(),1),
(47,2,0,getdate(),1),
(48,3,0,getdate(),1),
(49,4,0,getdate(),1);


insert into EstadoProfesionalPaciente (Descripcion, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values 
('Activo',0,getdate(),1),
('Inactivo',0,getdate(),1);


insert into ProfesionalPaciente (IdProfesional, IdPaciente, IdEstadoProfesionalPaciente, BajaLogica, 
FechaModificacion, IdUsuarioModificacion)
values
(17,2,1,0,getdate(),1),
(17,3,1,0,getdate(),1),
(17,4,1,0,getdate(),1),
(17,5,1,0,getdate(),1),
(17,6,1,0,getdate(),1),
(17,7,1,0,getdate(),1),
(17,8,1,0,getdate(),1),
(17,9,1,0,getdate(),1),
(17,10,1,0,getdate(),1),
(17,11,1,0,getdate(),1),
(17,12,1,0,getdate(),1),
(17,13,1,0,getdate(),1),
(17,14,1,0,getdate(),1),
(17,15,1,0,getdate(),1),
(17,28,1,0,getdate(),1),
(17,29,1,0,getdate(),1),
(17,30,1,0,getdate(),1),

(18,31,1,0,getdate(),1),
(18,32,1,0,getdate(),1),
(18,33,1,0,getdate(),1),
(18,34,1,0,getdate(),1),
(18,35,1,0,getdate(),1),
(18,36,1,0,getdate(),1),
(18,37,1,0,getdate(),1),
(18,38,1,0,getdate(),1),
(18,39,1,0,getdate(),1),
(18,40,1,0,getdate(),1),

(19,41,1,0,getdate(),1),
(19,42,1,0,getdate(),1),
(19,43,1,0,getdate(),1),
(19,45,1,0,getdate(),1),
(19,46,1,0,getdate(),1),
(19,47,1,0,getdate(),1),
(19,48,1,0,getdate(),1),
(19,49,1,0,getdate(),1);


insert into Parentesco
values
('Padre',0,getdate(),1),
('Madre',0,getdate(),1),
('Hermano',0,getdate(),1),
('Hermana',0,getdate(),1),
('Abuelo',0,getdate(),1),
('Abuela',0,getdate(),1),
('Tio',0,getdate(),1),
('Tia',0,getdate(),1),
('Hijo',0,getdate(),1),
('Hija',0,getdate(),1),
('Nieto',0,getdate(),1),
('Nieta',0,getdate(),1);

insert into GrupoFamiliar (IdPaciente, Nombre, IdParentesco, Observaciones, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
(2,'Pedro',1,'Fallecido',0,getdate(),1),
(2,'Raquel',2,'Fallecido',0,getdate(),1),
(3,'Marcela',8,'Presente',0,getdate(),1),
(3,'Claudio',3,'Fallecido',0,getdate(),1),
(4,'Roberto',1,'Presente',0,getdate(),1),
(4,'Emilia',2,'Ausente',0,getdate(),1),
(4,'Gonzalo',3,'Presente',0,getdate(),1),
(5,'Julián',1,'Presente',0,getdate(),1),
(6,'Norma',2,'Presente',0,getdate(),1);


insert into TipoEmocion
values
('Tristeza',0,getdate(),1),
('Felicidad',0,getdate(),1),
('Miedo',0,getdate(),1),
('Sorpresa',0,getdate(),1),
('Asco',0,getdate(),1),
('Ira',0,getdate(),1),
('Frustracion',0,getdate(),1);


insert into RegistroDiario (IdPaciente, Situacion, MotivoSituacion, IdTipoEmocion, IntensidadEmocion, 
PensamientoAutomatico, GradoCreenciaPensamientoAutomatico, RespuestaRacional, GradoCreenciaRespuestaRacional, 
GradoCreenciaResultado, IdTipoEmocionResultado, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
(2,'Rendir un parcial','Bajo rendimiento',7,90,'Pensar que la facultad no es para mi',80,'Pedir ayuda a compañeros',50,50,1,0,getdate(),1),
(2,'Ir de Compras','Ir de Compras',2,70,'Pensar que habia ratas escondidas',80,'Pedir que alguien revise el lugar',50,50,2,0,getdate(),1),
(2,'Pelear con pareja','Pelear con pareja',7,80,'Me fue infiel',80,'El se lo pierde',50,100,7,0,getdate(),1),
(2,'Entrevista laboral','Bajo rendimiento',3,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(2,'Pelear con hermano','Pelear con hermano',6,90,'Pensar que es un tarado',80,'No hablar más sobre el problema',50,50,1,0,getdate(),1),
(2,'Mal día en la facultad','Desaprobar un final',6,90,'No sirvo para esto',80,'Pedir ayuda a compañeros y rendir nuevamente',50,50,7,0,getdate(),1),
(2,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,7,0,getdate(),1),
(2,'Discutir con vecino','Discutir con vecino',6,90,'Ensució mi vereda',80,'Denunciarlo a la policía',50,50,6,0,getdate(),1),
(2,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(2,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(2,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(3,'Ordenar la casa','Ordenar la casa',6,70,'Lo hago por obligación',80,'Pedir que alguien revise el lugar',50,50,1,0,getdate(),1),
(3,'Ver películas de terror','Ver películas de terror',3,80,'Me asusta mucho',80,'Pensar que son actores y hay un guión',50,100,3,0,getdate(),1),

(4,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(4,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(4,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(5,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(5,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(5,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(6,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(6,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(6,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(6,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(6,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(6,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(7,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(7,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(7,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(7,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(7,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(7,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(7,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(7,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(7,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(7,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(7,'Entrevista laboral','Bajo rendimiento',6,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(7,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(7,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(7,'Entrevista laboral','Bajo rendimiento',2,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(7,'Ver fotos de ratas','Ver fotos de ratas',1,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(8,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(9,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(9,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(10,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(10,'Entrevista laboral','Bajo rendimiento',1,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(10,'Ver fotos de ratas','Ver fotos de ratas',2,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(10,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(10,'Entrevista laboral','Bajo rendimiento',3,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(10,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(11,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(12,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(12,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(13,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(13,'Entrevista laboral','Bajo rendimiento',4,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(13,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(13,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(13,'Entrevista laboral','Bajo rendimiento',2,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(13,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(14,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(14,'Entrevista laboral','Bajo rendimiento',6,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(14,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(14,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(14,'Entrevista laboral','Bajo rendimiento',3,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(14,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(14,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(14,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(14,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feas y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),

(15,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(15,'Entrevista laboral','Bajo rendimiento',6,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),

(16,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(16,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(16,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(16,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(16,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(28,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(28,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(29,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(29,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(29,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(29,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(29,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),


(30,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(30,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(30,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(30,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(30,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(30,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(30,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(31,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(31,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(31,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(31,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(31,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(32,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(32,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(32,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(32,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(32,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(32,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(33,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(33,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(34,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(34,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(34,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(34,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(34,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(34,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(35,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(35,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(35,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(35,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(36,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(36,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(36,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(36,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(36,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(36,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(36,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(37,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(37,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(37,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(37,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(37,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(37,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(37,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(38,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(38,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(38,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(38,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(39,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(39,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(39,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(40,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(40,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(40,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(40,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(40,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(41,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(41,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(41,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(42,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(42,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(42,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(42,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(42,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(43,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(43,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(43,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(43,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(43,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(43,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(43,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(43,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(44,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(44,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(44,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(45,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(45,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(45,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(46,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(46,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(47,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(47,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(47,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(47,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(47,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(47,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(48,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(48,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(48,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(48,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(48,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(48,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(48,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),

(49,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(49,'Rendir examen de manejo','Bajo rendimiento',6,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(49,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(49,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(49,'Rendir examen de manejo','Bajo rendimiento',2,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(49,'Rendir examen de manejo','Bajo rendimiento',4,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(49,'Rendir examen de manejo','Bajo rendimiento',1,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(49,'Rendir examen de manejo','Bajo rendimiento',3,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1),
(49,'Rendir examen de manejo','Bajo rendimiento',5,80,'Pensar que nunca podre conducir',80,'Anotarme en una academia',50,50,3,0,getdate(),1);


insert into EstadoNotificacion (Descripcion, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
('Pendiente',0,getdate(),1),
('Entregada',0,getdate(),1),
('Respondida',0,getdate(),1),
('Vencida',0,getdate(),1);


insert into RegistroDiarioRespuesta (IdRegistroDiario, IdProfesional, Nota, BajaLogica, FechaModificacion, 
IdUsuarioModificacion)
values
(1,17,'Estudia más para el próximo parcial y te va a ir mejor',0,getdate(),1),
(2,17,'Si el lugar está habilitado municipalmente no deberías tener ese miedo',0,getdate(),1),
(3,17,'Exacto. No pierdas el tiempo ni energía en esa persona',0,getdate(),1),
(4,17,'Estás capacitado para muchos empleos, no tengas miedo',0,getdate(),1),
(5,17,'Hay que buscar el momento para poder conversar',0,getdate(),1),
(6,17,'No te desconcentres. En el próximo parcial te va a ir mejor',0,getdate(),1),
(7,17,'Estás capacitado para muchos empleos, no tengas miedo',0,getdate(),1),
(8,17,'No es necesario llegar al extremo de la denuncia. Conversando se pueden entender',0,getdate(),1),

(12,17,'Ordenar la casa también te ayuda a ordenar tus pensamientos',0,getdate(),1),
(13,17,'Quizás mirarlas de día y acompañado te ayuda a superar el miedo',0,getdate(),1),

(14,17,'Con el tiempo vas a superar el miedo a la calle',0,getdate(),1),
(15,17,'Estás capacitado para muchos empleos, no tengas miedo',0,getdate(),1),
(16,17,'No mires por el momento fotos de ratas hasta que lo charlemos en la próxima sesion',0,getdate(),1);



insert into SeguimientoPaciente (IdProfesional, IdPaciente, Nota, FechaAlta, BajaLogica, FechaModificacion,
IdUsuarioModificacion)
values
(17,2,'<u>Entrevista inicial<u>',getdate(),0,getdate(),1),
(17,2,'<p>Sesión numero 2 seguimiento<p>',getdate(),0,getdate(),1),
(17,2,'<p><b>Sesión numero 3 seguimiento</b><p>',getdate(),0,getdate(),1),
(17,2,'Sesión numero 4 seguimiento',getdate(),0,getdate(),1),
(17,2,'Sesión numero 5 seguimiento',getdate(),0,getdate(),1),
(17,2,'Sesión numero 6 seguimiento',getdate(),0,getdate(),1),

(18,3,'Entrevista inicial',getdate(),0,getdate(),1),
(18,3,'Sesión numero 2 seguimiento',getdate(),0,getdate(),1),
(18,3,'Sesión numero 3 seguimiento',getdate(),0,getdate(),1),

(19,4,'Entrevista inicial',getdate(),0,getdate(),1),
(19,4,'Sesión numero 2 seguimiento',getdate(),0,getdate(),1),
(19,4,'Sesión numero 3 seguimiento',getdate(),0,getdate(),1),
(19,4,'Sesión numero 4 seguimiento',getdate(),0,getdate(),1),
(19,4,'Sesión numero 5 seguimiento',getdate(),0,getdate(),1);



Insert into GrupoNotificacion (Descripcion, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
('Desde:29/11/2019 00:00:00Hasta:01/12/2019 23:59:59',0,getdate(),1), /*Vencida*/
('Desde:02/11/2019 22:00:00Hasta:04/12/2019 23:59:59',0,getdate(),1), /*A tiempo*/
('Desde:03/12/2019 12:00:00Hasta:05/12/2019 23:59:59',0,getdate(),1), /*A tiempo*/
('Notificación Standar',0,getdate(),1), /*Vencida*/
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),

('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),

('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),

('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1),
('Notificación Standar',0,getdate(),1);


insert into Notificacion (IdProfesional, IdPaciente, Mensaje, FechaHora, IdEstadoNotificacion, IdGrupoNotificacion, 
BajaLogica, FechaModificacion, IdUsuarioModificacion, EsTipoEstadoEmocional)
values
(17,2,'¿Cómo te fue en la entrevista de trabajo?',getdate(),2,1,0,getdate(),1,0),
(17,2,'¿Cómo te fue en la demo que presentaste hoy?',getdate(),2,2,0,getdate(),1,0),
(17,2,'¿Cómo te fue en la entrevista de trabajo?',getdate(),2,3,0,getdate(),1,0),
(17,2,'¿Cómo estas?','2019-12-02 10:00:00.000',3,4,0,getdate(),1,1),
(17,2,'¿Cómo estas?','2019-12-02 18:00:00.000',2,4,0,getdate(),1,1),
(17,2,'¿Cómo estas?','2019-12-02 20:00:00.000',3,4,0,getdate(),1,1),
(17,2,'¿Cómo estas?','2019-12-02 20:00:00.000',3,4,0,getdate(),1,1),
(17,2,'¿Cómo estas?','2019-12-02 20:00:00.000',3,4,0,getdate(),1,1),
(17,2,'¿Cómo estas?','2019-12-02 20:00:00.000',3,4,0,getdate(),1,1),

(17,3,'¿Cómo estas?','2019-12-02 20:00:00.000',4,5,0,getdate(),1,1),
(17,3,'¿Cómo estas?','2019-12-02 21:00:00.000',3,5,0,getdate(),1,1),
(17,3,'¿Cómo estas?','2019-12-02 22:00:00.000',3,5,0,getdate(),1,1),
(17,3,'¿Cómo estas?','2019-12-02 23:00:00.000',3,5,0,getdate(),1,1),

(17,4,'¿Cómo estas?','2019-12-02 10:00:00.000',1,6,0,getdate(),1,1),
(17,4,'¿Cómo estas?','2019-12-02 11:00:00.000',2,6,0,getdate(),1,1),
(17,4,'¿Cómo estas?','2019-12-02 12:00:00.000',3,6,0,getdate(),1,1),
(17,4,'¿Cómo estas?','2019-12-02 13:00:00.000',3,6,0,getdate(),1,1),
(17,4,'¿Cómo estas?','2019-12-02 14:00:00.000',3,6,0,getdate(),1,1),
(17,4,'¿Cómo estas?','2019-12-02 15:00:00.000',3,6,0,getdate(),1,1),
(17,4,'¿Cómo estas?','2019-12-02 16:00:00.000',4,6,0,getdate(),1,1),
(17,4,'¿Cómo estas?','2019-12-02 17:00:00.000',4,6,0,getdate(),1,1),

(17,5,'¿Cómo estas?','2019-12-02 17:00:00.000',2,7,0,getdate(),1,1),
(17,5,'¿Cómo estas?','2019-12-02 18:00:00.000',3,7,0,getdate(),1,1),
(17,5,'¿Cómo estas?','2019-12-02 19:00:00.000',3,7,0,getdate(),1,1),
(17,5,'¿Cómo estas?','2019-12-02 20:00:00.000',3,7,0,getdate(),1,1),
(17,5,'¿Cómo estas?','2019-12-02 21:00:00.000',3,7,0,getdate(),1,1),
(17,5,'¿Cómo estas?','2019-12-02 22:00:00.000',4,7,0,getdate(),1,1),

(17,6,'¿Cómo estas?','2019-12-05 17:00:00.000',2,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 18:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 19:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 20:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 21:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 22:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 17:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 18:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 19:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 20:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 21:00:00.000',3,8,0,getdate(),1,1),
(17,6,'¿Cómo estas?','2019-12-02 22:00:00.000',4,8,0,getdate(),1,1),

(17,7,'¿Cómo estas?','2019-12-02 23:00:00.000',3,9,0,getdate(),1,1),
(17,7,'¿Cómo estas?','2019-12-02 01:00:00.000',3,9,0,getdate(),1,1),
(17,7,'¿Cómo estas?','2019-12-05 02:00:00.000',2,9,0,getdate(),1,1),
(17,7,'¿Cómo estas?','2019-12-02 03:00:00.000',3,9,0,getdate(),1,1),
(17,7,'¿Cómo estas?','2019-12-02 04:00:00.000',3,9,0,getdate(),1,1),
(17,7,'¿Cómo estas?','2019-12-02 05:00:00.000',3,9,0,getdate(),1,1),

(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-02 22:00:00.000',3,10,0,getdate(),1,1),
(17,8,'¿Cómo estas?','2019-12-05 22:00:00.000',2,10,0,getdate(),1,1),

(17,9,'¿Cómo estas?','2019-12-05 22:00:00.000',2,11,0,getdate(),1,1),
(17,9,'¿Cómo estas?','2019-12-02 22:00:00.000',3,11,0,getdate(),1,1),
(17,9,'¿Cómo estas?','2019-12-02 22:00:00.000',3,11,0,getdate(),1,1),
(17,9,'¿Cómo estas?','2019-12-02 22:00:00.000',3,11,0,getdate(),1,1),
(17,9,'¿Cómo estas?','2019-12-02 22:00:00.000',3,11,0,getdate(),1,1),
(17,9,'¿Cómo estas?','2019-12-02 22:00:00.000',3,11,0,getdate(),1,1),
(17,9,'¿Cómo estas?','2019-12-02 22:00:00.000',3,11,0,getdate(),1,1),

(17,10,'¿Cómo estas?','2019-12-05 01:00:00.000',2,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-05 01:00:00.000',2,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',4,12,0,getdate(),1,1),
(17,10,'¿Cómo estas?','2019-12-02 01:00:00.000',3,12,0,getdate(),1,1),

(17,11,'¿Cómo estas?','2019-12-02 01:00:00.000',3,13,0,getdate(),1,1),
(17,11,'¿Cómo estas?','2019-12-02 01:00:00.000',3,13,0,getdate(),1,1),
(17,11,'¿Cómo estas?','2019-12-02 01:00:00.000',3,13,0,getdate(),1,1),
(17,11,'¿Cómo estas?','2019-12-02 01:00:00.000',3,13,0,getdate(),1,1),
(17,11,'¿Cómo estas?','2019-12-05 01:00:00.000',2,13,0,getdate(),1,1),
(17,11,'¿Cómo estas?','2019-12-02 01:00:00.000',4,13,0,getdate(),1,1),

(17,12,'¿Cómo estas?','2019-12-02 01:00:00.000',3,14,0,getdate(),1,1),
(17,12,'¿Cómo estas?','2019-12-02 01:00:00.000',3,14,0,getdate(),1,1),
(17,12,'¿Cómo estas?','2019-12-02 01:00:00.000',3,14,0,getdate(),1,1),
(17,12,'¿Cómo estas?','2019-12-02 01:00:00.000',3,14,0,getdate(),1,1),
(17,12,'¿Cómo estas?','2019-12-02 01:00:00.000',3,14,0,getdate(),1,1),
(17,12,'¿Cómo estas?','2019-12-02 01:00:00.000',3,14,0,getdate(),1,1),

(17,13,'¿Cómo estas?','2019-12-05 01:00:00.000',2,15,0,getdate(),1,1),
(17,13,'¿Cómo estas?','2019-12-05 01:00:00.000',2,15,0,getdate(),1,1),
(17,13,'¿Cómo estas?','2019-12-02 01:00:00.000',3,15,0,getdate(),1,1),
(17,13,'¿Cómo estas?','2019-12-02 01:00:00.000',3,15,0,getdate(),1,1),
(17,13,'¿Cómo estas?','2019-12-02 01:00:00.000',3,15,0,getdate(),1,1),
(17,13,'¿Cómo estas?','2019-12-02 01:00:00.000',3,15,0,getdate(),1,1),
(17,13,'¿Cómo estas?','2019-12-02 01:00:00.000',3,15,0,getdate(),1,1),
(17,13,'¿Cómo estas?','2019-12-05 01:00:00.000',2,15,0,getdate(),1,1),
(17,13,'¿Cómo estas?','2019-12-02 01:00:00.000',4,15,0,getdate(),1,1),

(17,14,'¿Cómo estas?','2019-12-02 01:00:00.000',3,16,0,getdate(),1,1),
(17,14,'¿Cómo estas?','2019-12-02 01:00:00.000',3,16,0,getdate(),1,1),
(17,14,'¿Cómo estas?','2019-12-02 01:00:00.000',3,16,0,getdate(),1,1),
(17,14,'¿Cómo estas?','2019-12-02 01:00:00.000',3,16,0,getdate(),1,1),
(17,14,'¿Cómo estas?','2019-12-02 01:00:00.000',3,16,0,getdate(),1,1),

(17,15,'¿Cómo estas?','2019-12-05 01:00:00.000',2,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-05 01:00:00.000',2,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',3,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',4,17,0,getdate(),1,1),
(17,15,'¿Cómo estas?','2019-12-02 01:00:00.000',4,17,0,getdate(),1,1),

(17,16,'¿Cómo estas?','2019-12-02 01:00:00.000',4,18,0,getdate(),1,1),
(17,16,'¿Cómo estas?','2019-12-02 01:00:00.000',3,18,0,getdate(),1,1),
(17,16,'¿Cómo estas?','2019-12-02 01:00:00.000',3,18,0,getdate(),1,1),
(17,16,'¿Cómo estas?','2019-12-02 01:00:00.000',3,18,0,getdate(),1,1),
(17,16,'¿Cómo estas?','2019-12-02 01:00:00.000',3,18,0,getdate(),1,1),
(17,16,'¿Cómo estas?','2019-12-05 01:00:00.000',2,18,0,getdate(),1,1),
(17,16,'¿Cómo estas?','2019-12-05 01:00:00.000',2,18,0,getdate(),1,1),
(17,16,'¿Cómo estas?','2019-12-05 01:00:00.000',2,18,0,getdate(),1,1),

(17,28,'¿Cómo estas?','2019-12-02 01:00:00.000',3,19,0,getdate(),1,1),
(17,28,'¿Cómo estas?','2019-12-02 01:00:00.000',3,19,0,getdate(),1,1),
(17,28,'¿Cómo estas?','2019-12-02 01:00:00.000',3,19,0,getdate(),1,1),
(17,28,'¿Cómo estas?','2019-12-05 01:00:00.000',2,19,0,getdate(),1,1),
(17,28,'¿Cómo estas?','2019-12-02 01:00:00.000',4,19,0,getdate(),1,1),

(17,29,'¿Cómo estas?','2019-12-05 01:00:00.000',2,20,0,getdate(),1,1),
(17,29,'¿Cómo estas?','2019-12-02 01:00:00.000',3,20,0,getdate(),1,1),
(17,29,'¿Cómo estas?','2019-12-02 01:00:00.000',3,20,0,getdate(),1,1),
(17,29,'¿Cómo estas?','2019-12-02 01:00:00.000',3,20,0,getdate(),1,1),
(17,29,'¿Cómo estas?','2019-12-02 01:00:00.000',3,20,0,getdate(),1,1),
(17,29,'¿Cómo estas?','2019-12-02 01:00:00.000',3,20,0,getdate(),1,1),
(17,29,'¿Cómo estas?','2019-12-02 01:00:00.000',3,20,0,getdate(),1,1),
(17,29,'¿Cómo estas?','2019-12-02 01:00:00.000',3,20,0,getdate(),1,1),
(17,29,'¿Cómo estas?','2019-12-02 01:00:00.000',3,20,0,getdate(),1,1),

(17,30,'¿Cómo estas?','2019-12-02 01:00:00.000',3,21,0,getdate(),1,1),
(17,30,'¿Cómo estas?','2019-12-02 01:00:00.000',3,21,0,getdate(),1,1),
(17,30,'¿Cómo estas?','2019-12-02 01:00:00.000',3,21,0,getdate(),1,1),
(17,30,'¿Cómo estas?','2019-12-02 01:00:00.000',4,21,0,getdate(),1,1),
(17,30,'¿Cómo estas?','2019-12-05 01:00:00.000',2,21,0,getdate(),1,1),

(17,31,'¿Cómo estas?','2019-12-02 01:00:00.000',3,22,0,getdate(),1,1),
(17,31,'¿Cómo estas?','2019-12-02 01:00:00.000',3,22,0,getdate(),1,1),
(17,31,'¿Cómo estas?','2019-12-02 01:00:00.000',3,22,0,getdate(),1,1),
(17,31,'¿Cómo estas?','2019-12-02 01:00:00.000',3,22,0,getdate(),1,1),
(17,31,'¿Cómo estas?','2019-12-05 01:00:00.000',2,22,0,getdate(),1,1),

(17,32,'¿Cómo estas?','2019-12-02 01:00:00.000',4,23,0,getdate(),1,1),
(17,32,'¿Cómo estas?','2019-12-02 01:00:00.000',4,23,0,getdate(),1,1),
(17,32,'¿Cómo estas?','2019-12-05 01:00:00.000',2,23,0,getdate(),1,1),
(17,32,'¿Cómo estas?','2019-12-02 01:00:00.000',3,23,0,getdate(),1,1),
(17,32,'¿Cómo estas?','2019-12-02 01:00:00.000',3,23,0,getdate(),1,1),
(17,32,'¿Cómo estas?','2019-12-02 01:00:00.000',3,23,0,getdate(),1,1),
(17,32,'¿Cómo estas?','2019-12-02 01:00:00.000',3,23,0,getdate(),1,1),
(17,32,'¿Cómo estas?','2019-12-02 01:00:00.000',3,23,0,getdate(),1,1),
(17,32,'¿Cómo estas?','2019-12-02 01:00:00.000',3,23,0,getdate(),1,1),

(17,33,'¿Cómo estas?','2019-12-05 01:00:00.000',3,24,0,getdate(),1,1),
(17,33,'¿Cómo estas?','2019-12-02 01:00:00.000',3,24,0,getdate(),1,1),
(17,33,'¿Cómo estas?','2019-12-02 01:00:00.000',3,24,0,getdate(),1,1),
(17,33,'¿Cómo estas?','2019-12-02 01:00:00.000',3,24,0,getdate(),1,1),
(17,33,'¿Cómo estas?','2019-12-02 01:00:00.000',3,24,0,getdate(),1,1),

(17,34,'¿Cómo estas?','2019-12-02 01:00:00.000',3,25,0,getdate(),1,1),
(17,34,'¿Cómo estas?','2019-12-02 01:00:00.000',3,25,0,getdate(),1,1),
(17,34,'¿Cómo estas?','2019-12-02 01:00:00.000',3,25,0,getdate(),1,1),
(17,34,'¿Cómo estas?','2019-12-02 01:00:00.000',3,25,0,getdate(),1,1),
(17,34,'¿Cómo estas?','2019-12-02 01:00:00.000',4,25,0,getdate(),1,1),
(17,34,'¿Cómo estas?','2019-12-05 01:00:00.000',2,25,0,getdate(),1,1),

(17,35,'¿Cómo estas?','2019-12-02 01:00:00.000',3,26,0,getdate(),1,1),
(17,35,'¿Cómo estas?','2019-12-02 01:00:00.000',3,26,0,getdate(),1,1),
(17,35,'¿Cómo estas?','2019-12-02 01:00:00.000',3,26,0,getdate(),1,1),
(17,35,'¿Cómo estas?','2019-12-02 01:00:00.000',3,26,0,getdate(),1,1),

(17,36,'¿Cómo estas?','2019-12-02 01:00:00.000',3,27,0,getdate(),1,1),
(17,36,'¿Cómo estas?','2019-12-02 01:00:00.000',3,27,0,getdate(),1,1),
(17,36,'¿Cómo estas?','2019-12-02 01:00:00.000',3,27,0,getdate(),1,1),
(17,36,'¿Cómo estas?','2019-12-02 01:00:00.000',3,27,0,getdate(),1,1),
(17,36,'¿Cómo estas?','2019-12-05 01:00:00.000',2,27,0,getdate(),1,1),
(17,36,'¿Cómo estas?','2019-12-05 01:00:00.000',2,27,0,getdate(),1,1),

(17,37,'¿Cómo estas?','2019-12-02 01:00:00.000',3,28,0,getdate(),1,1),
(17,37,'¿Cómo estas?','2019-12-02 01:00:00.000',3,28,0,getdate(),1,1),
(17,37,'¿Cómo estas?','2019-12-02 01:00:00.000',3,28,0,getdate(),1,1),
(17,37,'¿Cómo estas?','2019-12-02 01:00:00.000',4,28,0,getdate(),1,1),
(17,37,'¿Cómo estas?','2019-12-02 01:00:00.000',4,28,0,getdate(),1,1),
(17,37,'¿Cómo estas?','2019-12-02 01:00:00.000',4,28,0,getdate(),1,1),
(17,37,'¿Cómo estas?','2019-12-02 01:00:00.000',4,28,0,getdate(),1,1),

(17,38,'¿Cómo estas?','2019-12-02 01:00:00.000',3,29,0,getdate(),1,1),
(17,38,'¿Cómo estas?','2019-12-02 01:00:00.000',3,29,0,getdate(),1,1),
(17,38,'¿Cómo estas?','2019-12-02 01:00:00.000',3,29,0,getdate(),1,1),
(17,38,'¿Cómo estas?','2019-12-02 01:00:00.000',3,29,0,getdate(),1,1),

(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',3,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',3,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',3,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',3,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',3,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',3,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',3,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',3,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',4,30,0,getdate(),1,1),
(17,39,'¿Cómo estas?','2019-12-02 01:00:00.000',4,30,0,getdate(),1,1),

(17,40,'¿Cómo estas?','2019-12-02 01:00:00.000',3,31,0,getdate(),1,1),
(17,40,'¿Cómo estas?','2019-12-02 01:00:00.000',3,31,0,getdate(),1,1),
(17,40,'¿Cómo estas?','2019-12-02 01:00:00.000',3,31,0,getdate(),1,1),
(17,40,'¿Cómo estas?','2019-12-02 01:00:00.000',3,31,0,getdate(),1,1),
(17,40,'¿Cómo estas?','2019-12-05 01:00:00.000',2,31,0,getdate(),1,1),
(17,40,'¿Cómo estas?','2019-12-05 01:00:00.000',2,31,0,getdate(),1,1),

(17,41,'¿Cómo estas?','2019-12-02 01:00:00.000',3,32,0,getdate(),1,1),
(17,41,'¿Cómo estas?','2019-12-02 01:00:00.000',3,32,0,getdate(),1,1),
(17,41,'¿Cómo estas?','2019-12-02 01:00:00.000',3,32,0,getdate(),1,1),
(17,41,'¿Cómo estas?','2019-12-02 01:00:00.000',3,32,0,getdate(),1,1),
(17,41,'¿Cómo estas?','2019-12-05 01:00:00.000',2,32,0,getdate(),1,1),
(17,41,'¿Cómo estas?','2019-12-05 01:00:00.000',2,32,0,getdate(),1,1),

(17,42,'¿Cómo estas?','2019-12-02 01:00:00.000',3,33,0,getdate(),1,1),
(17,42,'¿Cómo estas?','2019-12-02 01:00:00.000',3,33,0,getdate(),1,1),
(17,42,'¿Cómo estas?','2019-12-02 01:00:00.000',3,33,0,getdate(),1,1),
(17,42,'¿Cómo estas?','2019-12-02 01:00:00.000',3,33,0,getdate(),1,1),
(17,42,'¿Cómo estas?','2019-12-05 01:00:00.000',2,33,0,getdate(),1,1),

(17,43,'¿Cómo estas?','2019-12-02 01:00:00.000',3,34,0,getdate(),1,1),
(17,43,'¿Cómo estas?','2019-12-02 01:00:00.000',3,34,0,getdate(),1,1),
(17,43,'¿Cómo estas?','2019-12-02 01:00:00.000',3,34,0,getdate(),1,1),

(17,44,'¿Cómo estas?','2019-12-02 01:00:00.000',3,35,0,getdate(),1,1),
(17,44,'¿Cómo estas?','2019-12-02 01:00:00.000',3,35,0,getdate(),1,1),
(17,44,'¿Cómo estas?','2019-12-02 01:00:00.000',3,35,0,getdate(),1,1),
(17,44,'¿Cómo estas?','2019-12-02 01:00:00.000',3,35,0,getdate(),1,1),
(17,44,'¿Cómo estas?','2019-12-02 01:00:00.000',3,35,0,getdate(),1,1),
(17,44,'¿Cómo estas?','2019-12-02 01:00:00.000',3,35,0,getdate(),1,1),

(17,45,'¿Cómo estas?','2019-12-02 01:00:00.000',3,36,0,getdate(),1,1),
(17,45,'¿Cómo estas?','2019-12-02 01:00:00.000',3,36,0,getdate(),1,1),
(17,45,'¿Cómo estas?','2019-12-02 01:00:00.000',3,36,0,getdate(),1,1),
(17,45,'¿Cómo estas?','2019-12-02 01:00:00.000',3,36,0,getdate(),1,1),
(17,45,'¿Cómo estas?','2019-12-02 01:00:00.000',3,36,0,getdate(),1,1),
(17,45,'¿Cómo estas?','2019-12-02 01:00:00.000',4,36,0,getdate(),1,1),
(17,45,'¿Cómo estas?','2019-12-02 01:00:00.000',4,36,0,getdate(),1,1),

(17,46,'¿Cómo estas?','2019-12-05 01:00:00.000',2,37,0,getdate(),1,1),
(17,46,'¿Cómo estas?','2019-12-05 01:00:00.000',2,37,0,getdate(),1,1),
(17,46,'¿Cómo estas?','2019-12-02 01:00:00.000',3,37,0,getdate(),1,1),
(17,46,'¿Cómo estas?','2019-12-02 01:00:00.000',3,37,0,getdate(),1,1),
(17,46,'¿Cómo estas?','2019-12-02 01:00:00.000',3,37,0,getdate(),1,1),

(17,47,'¿Cómo estas?','2019-12-02 01:00:00.000',3,38,0,getdate(),1,1),
(17,47,'¿Cómo estas?','2019-12-02 01:00:00.000',3,38,0,getdate(),1,1),
(17,47,'¿Cómo estas?','2019-12-02 01:00:00.000',3,38,0,getdate(),1,1),
(17,47,'¿Cómo estas?','2019-12-02 01:00:00.000',3,38,0,getdate(),1,1),
(17,47,'¿Cómo estas?','2019-12-02 01:00:00.000',3,38,0,getdate(),1,1),

(17,48,'¿Cómo estas?','2019-12-02 01:00:00.000',3,39,0,getdate(),1,1),
(17,48,'¿Cómo estas?','2019-12-02 01:00:00.000',3,39,0,getdate(),1,1),
(17,48,'¿Cómo estas?','2019-12-02 01:00:00.000',3,39,0,getdate(),1,1),
(17,48,'¿Cómo estas?','2019-12-02 01:00:00.000',3,39,0,getdate(),1,1),
(17,48,'¿Cómo estas?','2019-12-02 01:00:00.000',3,39,0,getdate(),1,1),
(17,48,'¿Cómo estas?','2019-12-02 01:00:00.000',4,39,0,getdate(),1,1),
(17,48,'¿Cómo estas?','2019-12-02 01:00:00.000',4,39,0,getdate(),1,1),

(17,49,'¿Cómo estas?','2019-12-02 01:00:00.000',3,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-02 01:00:00.000',3,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-02 01:00:00.000',3,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-02 01:00:00.000',3,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-02 01:00:00.000',3,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-02 01:00:00.000',3,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-02 01:00:00.000',3,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-02 01:00:00.000',4,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-05 01:00:00.000',2,40,0,getdate(),1,1),
(17,49,'¿Cómo estas?','2019-12-05 01:00:00.000',2,40,0,getdate(),1,1);


insert into NotificacionOpcion (IdNotificacion, Descripcion, Orden, BajaLogica, FechaModificacion, IdUsuarioModificacion)
values
(4,'Bien',1,0,getdate(),1),
(4,'Regular',2,0,getdate(),1),
(4,'Mal',3,0,getdate(),1),
(5,'Bien',1,0,getdate(),1),
(5,'Regular',2,0,getdate(),1),
(5,'Mal',3,0,getdate(),1),
(6,'Bien',1,0,getdate(),1),
(6,'Regular',2,0,getdate(),1),
(6,'Mal',3,0,getdate(),1),
(1,'Excelente',1,0,getdate(),1),
(1,'Creo que mas o menos',2,0,getdate(),1),
(1,'Pesimo',3,0,getdate(),1),
(1,'Malisimamente mal',4,0,getdate(),1);


/*
update Notificacion set FechaHora = DATEADD(DAY, -1, getdate()) where IdNotificacion = 3 --vencida
update Notificacion set FechaHora = DATEADD(MINUTE, -30, getdate()) where IdNotificacion = 1 --al dia
update Notificacion set FechaHora = DATEADD(MINUTE, -90, getdate())where IdNotificacion = 2 --por vencer
*/



