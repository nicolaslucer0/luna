use Yana;

insert into Pais
values
('Argentina',0,getdate(),1);

insert into Provincia
values
('Buenos Aires',1,1,getdate(),1);

insert into Localidad
values
('Moron',1,0,getdate(),1),
('San Justo',1,0,getdate(),1);

insert into DomicilioUsuario
values
(1,'mendoza',22,1,'a',null,null,null,null,1588226633,null,null,null,1,2,0,getdate(),1),
(1,'Florencio Varela',1903,2,'b',null,null,null,null,1588226633,null,null,null,2,2,0,getdate(),1),
(1,'Santa Rosa',1000,2,'b',null,null,null,null,1500004444,null,null,null,2,2,0,getdate(),1);

insert into Institucion
values
('UNLAM',1,getdate(),1),
('UBA',1,getdate(),1),
('UAI',1,getdate(),1);

insert into Usuario
values
('Pac2','Test',1111111,111-11,11-111,'pac2@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',3,0,getdate(),1),
('Pro2','Test',222222,22-222,333-33,'pro2@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',2,0,getdate(),1),
('Pac3','Test',1111111,111-11,11-111,'pac3@gmail.com','7c4a8d09ca3762af61e59520943dc26494f8941b',3,0,getdate(),1);


insert into ProfesionalInstitucion
values
(2,1,0,getdate(),1),
(5,2,0,getdate(),1);


insert into ProfesionalPaciente
values
(2,3,1,0,getdate(),1),
(2,4,1,0,getdate(),1),
(5,6,1,0,getdate(),1);


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
('Trastornos obseso-compulsivo','',0,getdate(),1),
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


insert into PacientePatologia
values
(3,1,0,getdate(),1),
(4,9,0,getdate(),1),
(6,26,0,getdate(),1);


insert into parentesco
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

insert into GrupoFamiliar
values
(3,'Padre',1,'Fallecido',0,getdate(),1),
(3,'Madre',2,'Fallecido',0,getdate(),1),
(3,'Tia',8,'Presente',0,getdate(),1),
(3,'Hermano',3,'Fallecido',0,getdate(),1),
(4,'Padre',1,'Presente',0,getdate(),1),
(4,'Madre',2,'Ausente',0,getdate(),1),
(4,'Hermano',3,'Presente',0,getdate(),1),
(6,'Padre',1,'Presente',0,getdate(),1),
(6,'Madre',2,'Presente',0,getdate(),1),
(6,'Hermana',4,'Mala Relaciòn',0,getdate(),1);


insert into TipoEmocion
values
('Tristeza',0,getdate(),1),
('Felicidad',0,getdate(),1),
('Miedo',0,getdate(),1),
('Sorpresa',0,getdate(),1),
('Asco',0,getdate(),1),
('Ira',0,getdate(),1),
('Frustracion',0,getdate(),1);


insert into RegistroDiario
values
(3,'Rendir un parcial','Bajo rendimiento',7,90,'Pensar que la facultad no es para mi',80,'Pedir ayuda a compañeros',50,50,1,0,getdate(),1),
(3,'Guardar Compras','Guardar Compras',3,70,'Pensar que habia ratas escondidas',80,'Pedir que alguien revise el lugar',50,50,1,0,getdate(),1),
(3,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feos y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(4,'Entrevista laboral','Bajo rendimiento',7,90,'Pensar que el empleo no es para mi',80,'Pedir ayuda a familiares',50,50,1,0,getdate(),1),
(4,'Ordenar la casa','Ordenar la casa',3,70,'Pensar que habia insectos escondidas',80,'Pedir que alguien revise el lugar',50,50,1,0,getdate(),1),
(4,'Ver fotos de terror','Ver fotos de terror',3,80,'Me asusta mucho',80,'Ver que son solo fotos',50,100,2,0,getdate(),1),
(6,'Rendir examen de manejo','Bajo rendimiento',7,80,'Pensar que nunca podre conducir',80,'Pedir ayuda a amigos',50,50,1,0,getdate(),1),
(6,'Guardar Compras','Guardar Compras',3,70,'Pensar que habia ratas escondidas',80,'Pedir que alguien revise el lugar',50,50,1,0,getdate(),1),
(6,'Ver fotos de ratas','Ver fotos de ratas',5,80,'Son muy feos y me dan asco',80,'Ver que son solo fotos',50,100,2,0,getdate(),1);

insert into SeguimientoPaciente
values
(2,3,'Entrevista inicial',getdate(),0,getdate(),1),
(2,3,'Sesion numero 2 seguimiento',getdate(),0,getdate(),1),
(2,4,'Entrevista inicial',getdate(),0,getdate(),1),
(2,4,'Sesion numero 2 seguimiento',getdate(),0,getdate(),1),
(5,6,'Entrevista inicial',getdate(),0,getdate(),1),
(5,6,'Sesion numero 2 seguimiento',getdate(),0,getdate(),1);

