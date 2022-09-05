using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Yana.Models.DomainEntities
{
    public partial class YanaContext : DbContext
    {
        public YanaContext()
        {
        }

        public YanaContext(DbContextOptions<YanaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<DomicilioUsuario> DomicilioUsuario { get; set; }
        public virtual DbSet<EarlyAdopter> EarlyAdopter { get; set; }
        public virtual DbSet<EstadoNotificacion> EstadoNotificacion { get; set; }
        public virtual DbSet<EstadoProfesionalPaciente> EstadoProfesionalPaciente { get; set; }
        public virtual DbSet<GrupoFamiliar> GrupoFamiliar { get; set; }
        public virtual DbSet<GrupoNotificacion> GrupoNotificacion { get; set; }
        public virtual DbSet<GrupoPatologia> GrupoPatologia { get; set; }
        public virtual DbSet<Institucion> Institucion { get; set; }
        public virtual DbSet<Localidad> Localidad { get; set; }
        public virtual DbSet<MenuItem> MenuItem { get; set; }
        public virtual DbSet<Metrica> Metrica { get; set; }
        public virtual DbSet<Notificacion> Notificacion { get; set; }
        public virtual DbSet<NotificacionOpcion> NotificacionOpcion { get; set; }
        public virtual DbSet<NotificacionRespuesta> NotificacionRespuesta { get; set; }
        public virtual DbSet<PacientePatologia> PacientePatologia { get; set; }
        public virtual DbSet<Pais> Pais { get; set; }
        public virtual DbSet<Parentesco> Parentesco { get; set; }
        public virtual DbSet<Patologia> Patologia { get; set; }
        public virtual DbSet<PatologiaGrupoPatologia> PatologiaGrupoPatologia { get; set; }
        public virtual DbSet<Perfil> Perfil { get; set; }
        public virtual DbSet<PerfilMenuItem> PerfilMenuItem { get; set; }
        public virtual DbSet<ProfesionalInstitucion> ProfesionalInstitucion { get; set; }
        public virtual DbSet<ProfesionalPaciente> ProfesionalPaciente { get; set; }
        public virtual DbSet<Provincia> Provincia { get; set; }
        public virtual DbSet<RegistroDiario> RegistroDiario { get; set; }
        public virtual DbSet<RegistroDiarioRespuesta> RegistroDiarioRespuesta { get; set; }
        public virtual DbSet<RegistroNewsletter> RegistroNewsletter { get; set; }
        public virtual DbSet<SeguimientoPaciente> SeguimientoPaciente { get; set; }
        public virtual DbSet<TipoDomicilio> TipoDomicilio { get; set; }
        public virtual DbSet<TipoEmocion> TipoEmocion { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<UsuarioInstitucion> UsuarioInstitucion { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Database=Yana;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<DomicilioUsuario>(entity =>
            {
                entity.HasKey(e => e.IdDomicilioUsuario);

                entity.Property(e => e.Calle)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Celular1)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Celular2)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Depto)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.EntreCalle1)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.EntreCalle2)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Observaciones).IsUnicode(false);

                entity.Property(e => e.Telefono1)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono2)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.TelefonoEmergencia)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdLocalidadNavigation)
                    .WithMany(p => p.DomicilioUsuario)
                    .HasForeignKey(d => d.IdLocalidad)
                    .HasConstraintName("FK_DomicilioUsuario_Localidad");

                entity.HasOne(d => d.IdTipoDomicilioNavigation)
                    .WithMany(p => p.DomicilioUsuario)
                    .HasForeignKey(d => d.IdTipoDomicilio)
                    .HasConstraintName("FK_DomicilioUsuario_TipoDomicilio");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.DomicilioUsuario)
                    .HasForeignKey(d => d.IdUsuario)
                    .HasConstraintName("FK_DomicilioUsuario_Usuario");
            });

            modelBuilder.Entity<EarlyAdopter>(entity =>
            {
                entity.HasKey(e => e.IdEarlyAdopter);

                entity.Property(e => e.Email)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.FechaAlta)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<EstadoNotificacion>(entity =>
            {
                entity.HasKey(e => e.IdEstadoNotificacion);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<EstadoProfesionalPaciente>(entity =>
            {
                entity.HasKey(e => e.IdEstadoProfesionalPaciente);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<GrupoFamiliar>(entity =>
            {
                entity.HasKey(e => e.IdGrupoFamiliar);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.Observaciones).IsUnicode(false);

                entity.HasOne(d => d.IdPacienteNavigation)
                    .WithMany(p => p.GrupoFamiliar)
                    .HasForeignKey(d => d.IdPaciente)
                    .HasConstraintName("FK_GrupoFamiliar_Paciente");

                entity.HasOne(d => d.IdParentescoNavigation)
                    .WithMany(p => p.GrupoFamiliar)
                    .HasForeignKey(d => d.IdParentesco)
                    .HasConstraintName("FK_GrupoFamiliar_Parentesco");
            });

            modelBuilder.Entity<GrupoNotificacion>(entity =>
            {
                entity.HasKey(e => e.IdGrupoNotificacion);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<GrupoPatologia>(entity =>
            {
                entity.HasKey(e => e.IdGrupoPatologia);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Institucion>(entity =>
            {
                entity.HasKey(e => e.IdInstitucion);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(200)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Localidad>(entity =>
            {
                entity.HasKey(e => e.IdLocalidad);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdProvinciaNavigation)
                    .WithMany(p => p.Localidad)
                    .HasForeignKey(d => d.IdProvincia)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Localidad_Provincia");
            });

            modelBuilder.Entity<MenuItem>(entity =>
            {
                entity.HasKey(e => e.IdMenuItem)
                    .HasName("PK_Items");

                entity.Property(e => e.Accion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Controller)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdParentNavigation)
                    .WithMany(p => p.InverseIdParentNavigation)
                    .HasForeignKey(d => d.IdParent)
                    .HasConstraintName("FK_MenuItem_Parent");
            });

            modelBuilder.Entity<Metrica>(entity =>
            {
                entity.HasKey(e => e.IdMetrica);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Notificacion>(entity =>
            {
                entity.HasKey(e => e.IdNotificacion);

                entity.Property(e => e.FechaHora).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Mensaje).IsUnicode(false);

                entity.HasOne(d => d.IdEstadoNotificacionNavigation)
                    .WithMany(p => p.Notificacion)
                    .HasForeignKey(d => d.IdEstadoNotificacion)
                    .HasConstraintName("FK_Notificacion_EstadoNotificacion");

                entity.HasOne(d => d.IdGrupoNotificacionNavigation)
                    .WithMany(p => p.Notificacion)
                    .HasForeignKey(d => d.IdGrupoNotificacion)
                    .HasConstraintName("FK_Notificacion_GrupoNotificacion");

                entity.HasOne(d => d.IdPacienteNavigation)
                    .WithMany(p => p.NotificacionIdPacienteNavigation)
                    .HasForeignKey(d => d.IdPaciente)
                    .HasConstraintName("FK_Notificacion_Paciente");

                entity.HasOne(d => d.IdProfesionalNavigation)
                    .WithMany(p => p.NotificacionIdProfesionalNavigation)
                    .HasForeignKey(d => d.IdProfesional)
                    .HasConstraintName("FK_Notificacion_Profesional");
            });

            modelBuilder.Entity<NotificacionOpcion>(entity =>
            {
                entity.HasKey(e => e.IdNotificacionOpcion);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdNotificacionNavigation)
                    .WithMany(p => p.NotificacionOpcion)
                    .HasForeignKey(d => d.IdNotificacion)
                    .HasConstraintName("FK_NotificacionOpcion_Notificacion");
            });

            modelBuilder.Entity<NotificacionRespuesta>(entity =>
            {
                entity.HasKey(e => e.IdNotificacionRespuesta);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Respuesta).IsUnicode(false);

                entity.HasOne(d => d.IdNotificacionNavigation)
                    .WithMany(p => p.NotificacionRespuesta)
                    .HasForeignKey(d => d.IdNotificacion)
                    .HasConstraintName("FK_NotificacionRespuesta_Notificacion");

                entity.HasOne(d => d.IdNotificacionOpcionNavigation)
                    .WithMany(p => p.NotificacionRespuesta)
                    .HasForeignKey(d => d.IdNotificacionOpcion)
                    .HasConstraintName("FK_NotificacionRespuesta_NotificacionOpcion");
            });

            modelBuilder.Entity<PacientePatologia>(entity =>
            {
                entity.HasKey(e => e.IdPacientePatologia);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdPacienteNavigation)
                    .WithMany(p => p.PacientePatologia)
                    .HasForeignKey(d => d.IdPaciente)
                    .HasConstraintName("FK_PacientePatologia_Paciente");

                entity.HasOne(d => d.IdPatologiaNavigation)
                    .WithMany(p => p.PacientePatologia)
                    .HasForeignKey(d => d.IdPatologia)
                    .HasConstraintName("FK_PacientePatologia_Patologia");
            });

            modelBuilder.Entity<Pais>(entity =>
            {
                entity.HasKey(e => e.IdPais);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Parentesco>(entity =>
            {
                entity.HasKey(e => e.IdParentesco);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Patologia>(entity =>
            {
                entity.HasKey(e => e.IdPatologia);

                entity.Property(e => e.Descripcion).IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(200)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<PatologiaGrupoPatologia>(entity =>
            {
                entity.HasKey(e => e.IdPatologiaGrupoPatologia);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdGrupoPatologiaNavigation)
                    .WithMany(p => p.PatologiaGrupoPatologia)
                    .HasForeignKey(d => d.IdGrupoPatologia)
                    .HasConstraintName("FK_PatologiaGrupoPatologia_GrupoPatologia");

                entity.HasOne(d => d.IdPatologiaNavigation)
                    .WithMany(p => p.PatologiaGrupoPatologia)
                    .HasForeignKey(d => d.IdPatologia)
                    .HasConstraintName("FK_PatologiaGrupoPatologia_Patologia");
            });

            modelBuilder.Entity<Perfil>(entity =>
            {
                entity.HasKey(e => e.IdPerfil)
                    .HasName("PK_Perfiles");

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(40)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<PerfilMenuItem>(entity =>
            {
                entity.HasKey(e => e.IdPerfilMenuItem)
                    .HasName("PK_PerfilesItems");

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdMenuItemNavigation)
                    .WithMany(p => p.PerfilMenuItem)
                    .HasForeignKey(d => d.IdMenuItem)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PerfilMenuItem_MenuItem");

                entity.HasOne(d => d.IdPerfilNavigation)
                    .WithMany(p => p.PerfilMenuItem)
                    .HasForeignKey(d => d.IdPerfil)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PerfilMenuItem_Perfil");
            });

            modelBuilder.Entity<ProfesionalInstitucion>(entity =>
            {
                entity.HasKey(e => e.IdProfesionalInstitucion);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdInstitucionNavigation)
                    .WithMany(p => p.ProfesionalInstitucion)
                    .HasForeignKey(d => d.IdInstitucion)
                    .HasConstraintName("FK_ProfesionalInstitucion_Institucion");

                entity.HasOne(d => d.IdProfesionalNavigation)
                    .WithMany(p => p.ProfesionalInstitucion)
                    .HasForeignKey(d => d.IdProfesional)
                    .HasConstraintName("FK_ProfesionalInstitucion_Profesional");
            });

            modelBuilder.Entity<ProfesionalPaciente>(entity =>
            {
                entity.HasKey(e => e.IdProfesionalPaciente);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdEstadoProfesionalPacienteNavigation)
                    .WithMany(p => p.ProfesionalPaciente)
                    .HasForeignKey(d => d.IdEstadoProfesionalPaciente)
                    .HasConstraintName("FK_ProfesionalPaciente_EstadoProfesionalPaciente");

                entity.HasOne(d => d.IdPacienteNavigation)
                    .WithMany(p => p.ProfesionalPacienteIdPacienteNavigation)
                    .HasForeignKey(d => d.IdPaciente)
                    .HasConstraintName("FK_ProfesionalPaciente_Paciente");

                entity.HasOne(d => d.IdProfesionalNavigation)
                    .WithMany(p => p.ProfesionalPacienteIdProfesionalNavigation)
                    .HasForeignKey(d => d.IdProfesional)
                    .HasConstraintName("FK_ProfesionalPaciente_Profesional");
            });

            modelBuilder.Entity<Provincia>(entity =>
            {
                entity.HasKey(e => e.IdProvincia);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdPaisNavigation)
                    .WithMany(p => p.Provincia)
                    .HasForeignKey(d => d.IdPais)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Provincia_Pais");
            });

            modelBuilder.Entity<RegistroDiario>(entity =>
            {
                entity.HasKey(e => e.IdRegistroDiario);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.MotivoSituacion).IsUnicode(false);

                entity.Property(e => e.PensamientoAutomatico).IsUnicode(false);

                entity.Property(e => e.RespuestaRacional).IsUnicode(false);

                entity.Property(e => e.Situacion).IsUnicode(false);

                entity.HasOne(d => d.IdPacienteNavigation)
                    .WithMany(p => p.RegistroDiario)
                    .HasForeignKey(d => d.IdPaciente)
                    .HasConstraintName("FK_RegistroDiario_Paciente");

                entity.HasOne(d => d.IdTipoEmocionNavigation)
                    .WithMany(p => p.RegistroDiarioIdTipoEmocionNavigation)
                    .HasForeignKey(d => d.IdTipoEmocion)
                    .HasConstraintName("FK_RegistroDiario_TipoEmocion");

                entity.HasOne(d => d.IdTipoEmocionResultadoNavigation)
                    .WithMany(p => p.RegistroDiarioIdTipoEmocionResultadoNavigation)
                    .HasForeignKey(d => d.IdTipoEmocionResultado)
                    .HasConstraintName("FK_RegistroDiario_TipoEmocionResultado");
            });

            modelBuilder.Entity<RegistroDiarioRespuesta>(entity =>
            {
                entity.HasKey(e => e.IdRegistroDiarioRespuesta);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Nota).IsUnicode(false);

                entity.HasOne(d => d.IdProfesionalNavigation)
                    .WithMany(p => p.RegistroDiarioRespuesta)
                    .HasForeignKey(d => d.IdProfesional)
                    .HasConstraintName("FK_RegistroDiarioRespuesta_Profesional");

                entity.HasOne(d => d.IdRegistroDiarioNavigation)
                    .WithMany(p => p.RegistroDiarioRespuesta)
                    .HasForeignKey(d => d.IdRegistroDiario)
                    .HasConstraintName("FK_RegistroDiarioRespuesta_RegistroDiario");
            });

            modelBuilder.Entity<RegistroNewsletter>(entity =>
            {
                entity.HasKey(e => e.IdRegistroNewsletter);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.FechaAlta)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Mensaje)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<SeguimientoPaciente>(entity =>
            {
                entity.HasKey(e => e.IdSeguimientoPaciente);

                entity.Property(e => e.FechaAlta).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Nota).IsUnicode(false);

                entity.HasOne(d => d.IdPacienteNavigation)
                    .WithMany(p => p.SeguimientoPacienteIdPacienteNavigation)
                    .HasForeignKey(d => d.IdPaciente)
                    .HasConstraintName("FK_SeguimientoPaciente_Paciente");

                entity.HasOne(d => d.IdProfesionalNavigation)
                    .WithMany(p => p.SeguimientoPacienteIdProfesionalNavigation)
                    .HasForeignKey(d => d.IdProfesional)
                    .HasConstraintName("FK_SeguimientoPaciente_Profesional");
            });

            modelBuilder.Entity<TipoDomicilio>(entity =>
            {
                entity.HasKey(e => e.IdTipoDomicilio);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<TipoEmocion>(entity =>
            {
                entity.HasKey(e => e.IdTipoEmocion);

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.IdUsuario);

                entity.Property(e => e.Apellido)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Celular)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Dni).HasColumnName("DNI");

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.FechaNacimiento).HasColumnType("datetime");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Password).IsUnicode(false);

                entity.Property(e => e.Sexo)
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.TelefonoParticular)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdPerfilNavigation)
                    .WithMany(p => p.Usuario)
                    .HasForeignKey(d => d.IdPerfil)
                    .HasConstraintName("FK_Usuario_Perfil");
            });

            modelBuilder.Entity<UsuarioInstitucion>(entity =>
            {
                entity.HasKey(e => e.IdUsuarioInstitucion);

                entity.Property(e => e.FechaModificacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.IdInstitucionNavigation)
                    .WithMany(p => p.UsuarioInstitucion)
                    .HasForeignKey(d => d.IdInstitucion)
                    .HasConstraintName("FK_UsuarioInstitucion_Institucion");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.UsuarioInstitucion)
                    .HasForeignKey(d => d.IdUsuario)
                    .HasConstraintName("FK_UsuarioInstitucion_Usuario");
            });
        }
    }
}
