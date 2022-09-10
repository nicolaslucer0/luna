use Yana;

INSERT INTO
	Pais
values
	('AArgentina', 0, getdate(), 1);

INSERT INTO
	Provincia
values
	('Buenos Aires', 1, 0, getdate(), 1);

INSERT INTO
	TipoDomicilio (
		Descripcion,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	('Particular', 0, getdate(), 1),
	('Comercial', 0, getdate(), 1),
	('Laboral', 0, getdate(), 1);

INSERT INTO
	Localidad (
		Descripcion,
		IdProvincia,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	('Moron', 1, 0, getdate(), 1),
	('San Justo', 1, 0, getdate(), 1),
	('Ramos Mej�a', 1, 0, getdate(), 1),
	('Ciudad Evita', 1, 0, getdate(), 1),
	('Isidro Casanova', 1, 0, getdate(), 1),
	('Laferrere', 1, 0, getdate(), 1),
	('Gonz�lez Cat�n', 1, 0, getdate(), 1),
	('20 de Junio', 1, 0, getdate(), 1),
	('Ituzaing�', 1, 0, getdate(), 1),
	('Merlo', 1, 0, getdate(), 1);

INSERT INTO
	DomicilioUsuario (
		IdUsuario,
		Calle,
		Numero,
		Piso,
		Depto,
		EntreCalle1,
		EntreCalle2,
		Telefono1,
		Telefono2,
		Celular1,
		Celular2,
		TelefonoEmergencia,
		Observaciones,
		IdTipoDomicilio,
		IdLocalidad,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	(
		1,
		'Florencio Varela',
		'1903',
		null,
		null,
		'Omb�',
		'Zapiola',
		'01144808900',
		null,
		null,
		null,
		null,
		null,
		'3',
		'2',
		0,
		getdate(),
		1
	),
	(
		2,
		'Diego de Villarroel',
		'578',
		null,
		null,
		'Sim�n P�rez',
		'Equiza',
		null,
		null,
		null,
		null,
		null,
		null,
		'1',
		'7',
		0,
		getdate(),
		1
	),
	(
		3,
		'Av. Brig. Gral. Juan Manuel de Rosas ',
		'3910',
		null,
		null,
		'Av. Monse�or Bufano',
		'Sarandi',
		'1514447025',
		null,
		null,
		null,
		null,
		null,
		'2',
		'2',
		0,
		getdate(),
		1
	),
	(
		4,
		'Necochea',
		'955',
		null,
		null,
		'Tacuar�',
		'Gral. Alvarado',
		'01144691237',
		null,
		null,
		null,
		null,
		null,
		'1',
		'3',
		0,
		getdate(),
		1
	),
	(
		5,
		'M.M. de G�emes',
		'4197',
		null,
		null,
		'Jos� Mario Bevilacqua',
		'La chu�a',
		'1555791274',
		null,
		null,
		null,
		null,
		null,
		'2',
		'4',
		0,
		getdate(),
		1
	),
	(
		6,
		'Carlos Casares',
		'2362',
		3,
		'D',
		'J. Larsen',
		'Jos� Miguel Lanza',
		'1144662041',
		null,
		null,
		null,
		null,
		null,
		'3',
		'5',
		0,
		getdate(),
		1
	);

INSERT INTO
	Institucion (
		Nombre,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	('UNLAM', 0, getdate(), 1),
	('UBA', 0, getdate(), 1),
	('UAI', 0, getdate(), 1);

INSERT INTO
	Perfil (
		Nombre,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	('Administrador', 0, getdate(), 1),
	('Profesional', 0, getdate(), 1),
	('Paciente', 0, getdate(), 1),
	('Instituci�n', 0, getdate(), 1);

INSERT INTO
	Usuario (
		Nombre,
		Email,
		Password,
		IdPerfil,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	(
		'Admin',
		'admin@yana.com.ar',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		1,
		0,
		getdate(),
		1
	);

INSERT INTO
	Usuario (
		Nombre,
		Apellido,
		DNI,
		TelefonoParticular,
		Celular,
		Email,
		Password,
		IdPerfil,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	/* PACIENTES */
	(
		'Camila',
		'Minetti',
		41768854,
		null,
		1156988568,
		'camilaminetti.cdm@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Gabriel',
		'Cascallares',
		37376896,
		null,
		1158509535,
		'alejandro.c3737@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Cecilia',
		'Merlak',
		32361717,
		null,
		1151375053,
		'cecilia_merlak@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Elias',
		'G�mez',
		26496956,
		null,
		1151274963,
		'elias_gomez@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Luc�a',
		'D�az',
		38669328,
		null,
		1141658965,
		'lucia_diaz@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Micaela',
		'Benitez',
		36123987,
		null,
		1167884367,
		'micaela_benitez@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Gast�n',
		'L�pez',
		32489938,
		null,
		1136795776,
		'gaston_lopez@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Alejandro',
		'Borelli',
		28293849,
		null,
		1143279856,
		'alejandro_borelli@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Diego',
		'Juarez',
		23904887,
		null,
		1134759467,
		'diego_juarez@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Rebeca',
		'Lucero',
		34209378,
		null,
		1155746808,
		'rebeca_lucero@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Candela',
		'P�rez',
		29103515,
		null,
		1152480086,
		'candela_perez@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Adrian',
		'Albornoz',
		34357000,
		null,
		1152480086,
		'adrian_albornoz@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Gonzalo',
		'Crespo',
		38930490,
		null,
		1155387643,
		'gonzalo_crespo@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'Matias',
		'Prieto',
		34538900,
		null,
		1157434576,
		'gonzalo_crespo@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	(
		'M�nica',
		'Pereira',
		38425563,
		null,
		1145692326,
		'monica_pereira@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		3,
		0,
		getdate(),
		1
	),
	/* PROFESIONALES */
	(
		'Ignacio',
		'Baldo',
		38307024,
		null,
		1158962871,
		'baldoignacio.u@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		2,
		0,
		getdate(),
		1
	),
	(
		'Diego',
		'Gonz�lez',
		32361717,
		null,
		1141658965,
		'diego.gonzalez301@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		2,
		0,
		getdate(),
		1
	),
	(
		'Denise',
		'Torres',
		35122435,
		null,
		1136579073,
		'denis_torres@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		2,
		0,
		getdate(),
		1
	),
	(
		'Ayel�n',
		'Morales',
		33569485,
		null,
		1144278009,
		'ayelen_morales@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		2,
		0,
		getdate(),
		1
	),
	(
		'Juli�n',
		'Vega',
		32361717,
		null,
		1144201270,
		'julian_vega@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		2,
		0,
		getdate(),
		1
	),
	(
		'Victoria',
		'Saenz',
		32361717,
		1144268900,
		null,
		'victoria_saenz@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		2,
		0,
		getdate(),
		1
	),
	(
		'Rodrigo',
		'Gimenez',
		36893345,
		1198874568,
		null,
		'rodrigo_gimenez@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		2,
		0,
		getdate(),
		1
	),
	(
		'Ivan',
		'Rivas',
		27456345,
		1123644568,
		null,
		'ivan_rivas@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		2,
		0,
		getdate(),
		1
	),
	/* REPRESENTANTES INSTITUCI�N */
	(
		'Juan',
		'Barbosa',
		34123768,
		1167090345,
		null,
		'juan_barbosa@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		4,
		0,
		getdate(),
		1
	),
	(
		'Mariano',
		'Juarez',
		30459204,
		1122380043,
		null,
		'mariano_juarez@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		4,
		0,
		getdate(),
		1
	),
	(
		'Gerardo',
		'Juiz',
		34569087,
		1123585473,
		null,
		'gerardo_juiz@gmail.com',
		'7c4a8d09ca3762af61e59520943dc26494f8941b',
		4,
		0,
		getdate(),
		1
	);

INSERT INTO
	UsuarioInstitucion (
		IdUsuario,
		IdInstitucion,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	(25, 1, 0, getdate(), 1),
	(26, 2, 0, getdate(), 1),
	(27, 3, 0, getdate(), 1);

INSERT INTO
	ProfesionalInstitucion (
		IdProfesional,
		IdInstitucion,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	(17, 1, 0, getdate(), 1),
	(17, 2, 0, getdate(), 1),
	(18, 1, 0, getdate(), 1),
	(19, 1, 0, getdate(), 1),
	(20, 1, 0, getdate(), 1),
	(20, 2, 0, getdate(), 1),
	(21, 2, 0, getdate(), 1),
	(21, 3, 0, getdate(), 1),
	(22, 2, 0, getdate(), 1),
	(23, 3, 0, getdate(), 1),
	(24, 3, 0, getdate(), 1),
	(25, 3, 0, getdate(), 1),
	(26, 1, 0, getdate(), 1),
	(26, 2, 0, getdate(), 1),
	(26, 3, 0, getdate(), 1);

INSERT INTO
	GrupoPatologia
values
	('Trastorno del estado de animo', 0, getdate(), 1),
	('Neurosis', 0, getdate(), 1),
	('Psicosis', 0, getdate(), 1),
	('Trastorno de personalidad', 0, getdate(), 1);

INSERT INTO
	Patologia
values
	('Depresivos', '', 0, getdate(), 1),
	('Bipolares', '', 0, getdate(), 1),
	('Ciclotimicos', '', 0, getdate(), 1),
	('Trastornos de ansiedad', '', 0, getdate(), 1),
	(
		'Trastornos obsesivo-compulsivo',
		'',
		0,
		getdate(),
		1
	),
	(
		'Trastornos de ansiedad fobica',
		'',
		0,
		getdate(),
		1
	),
	('Trastornos del animo', '', 0, getdate(), 1),
	('Trastornos somatomorfos', '', 0, getdate(), 1),
	('Trastornos disociativos', '', 0, getdate(), 1),
	(
		'Trastornos de la conducta alimentaria, sexuales, sue�o, etc',
		'',
		0,
		getdate(),
		1
	),
	('Trastornos de ansiedad', '', 0, getdate(), 1),
	('Ezquizofrenia', '', 0, getdate(), 1),
	(
		'Trastornos ezquizofreniforme',
		'',
		0,
		getdate(),
		1
	),
	(
		'Trastornos ezquizoafectivo',
		'',
		0,
		getdate(),
		1
	),
	('Trastornos delirante', '', 0, getdate(), 1),
	(
		'Trastornos psicotico breve',
		'',
		0,
		getdate(),
		1
	),
	(
		'Trastornos psicotico compartido (folie a deux)',
		'',
		0,
		getdate(),
		1
	),
	(
		'Trastornos psicotico por enfermedad medica',
		'',
		0,
		getdate(),
		1
	),
	(
		'Trastornos psicotico inducido por sustancias',
		'',
		0,
		getdate(),
		1
	),
	(
		'Trastornos psicotico no especificado',
		'',
		0,
		getdate(),
		1
	),
	(
		'Trastornos paranoide de la personalidad',
		'',
		0,
		getdate(),
		1
	),
	(
		'T.P. ezquizoide / ezquizotipico ',
		'',
		0,
		getdate(),
		1
	),
	('T.P. histrionico', '', 0, getdate(), 1),
	('T.P. narcisistica', '', 0, getdate(), 1),
	('T.P. antisocial', '', 0, getdate(), 1),
	(
		'T.P. por evitacion / por dependencia',
		'',
		0,
		getdate(),
		1
	),
	('T.P. obsesivo-compulsivo', '', 0, getdate(), 1);

INSERT INTO
	PatologiaGrupoPatologia
values
	(1, 1, 0, getdate(), 1),
	(2, 1, 0, getdate(), 1),
	(3, 1, 0, getdate(), 1),
	(4, 2, 0, getdate(), 1),
	(5, 2, 0, getdate(), 1),
	(6, 2, 0, getdate(), 1),
	(7, 2, 0, getdate(), 1),
	(8, 2, 0, getdate(), 1),
	(9, 2, 0, getdate(), 1),
	(10, 2, 0, getdate(), 1),
	(11, 3, 0, getdate(), 1),
	(12, 3, 0, getdate(), 1),
	(13, 3, 0, getdate(), 1),
	(14, 3, 0, getdate(), 1),
	(15, 3, 0, getdate(), 1),
	(16, 3, 0, getdate(), 1),
	(17, 3, 0, getdate(), 1),
	(18, 3, 0, getdate(), 1),
	(19, 3, 0, getdate(), 1),
	(20, 4, 0, getdate(), 1),
	(21, 4, 0, getdate(), 1),
	(22, 4, 0, getdate(), 1),
	(23, 4, 0, getdate(), 1),
	(24, 4, 0, getdate(), 1),
	(25, 4, 0, getdate(), 1),
	(26, 4, 0, getdate(), 1);

INSERT INTO
	PacientePatologia (
		IdPaciente,
		IdPatologia,
		BajaLogica,
		FechaModificacion,
		IdUsuarioModificacion
	)
values
	(2, 1, 0, getdate(), 1),
	(3, 2, 0, getdate(), 1),
	(4, 2, 0, getdate(), 1),
	(5, 3, 0, getdate(), 1),
	(6, 4, 0, getdate(), 1),
	(7, 4, 0, getdate(), 1),
	(8, 4, 0, getdate(), 1),
	(9, 4, 0, getdate(), 1),
	(10, 5, 0, getdate(), 1),
	(11, 6, 0, getdate(), 1),
	(12, 7, 0, getdate(), 1),
	(13, 7, 0, getdate(), 1),
	(14, 7, 0, getdate(), 1),
	(15, 7, 0, getdate(), 1);