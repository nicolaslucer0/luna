using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class SeguimientoPacienteRepository : ISeguimientoPacienteRepository<SeguimientoPaciente>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                SeguimientoPaciente seguimientoPaciente = context.SeguimientoPaciente.FirstOrDefault(a => a.IdSeguimientoPaciente == id);
                
                if(seguimientoPaciente != null)
                {
                    seguimientoPaciente.BajaLogica = true;
                    seguimientoPaciente.FechaModificacion = DateTime.Now;
                    seguimientoPaciente.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public SeguimientoPaciente Get(int id)
        {
            using (var context = new LunaContext())
            {
                SeguimientoPaciente seguimientoPaciente = (from ctx in context.SeguimientoPaciente
                                                           where !ctx.BajaLogica
                                                           && ctx.IdSeguimientoPaciente == id
                                                           select ctx).FirstOrDefault();
                return seguimientoPaciente;
            }
        }

        public List<SeguimientoPaciente> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<SeguimientoPaciente> seguimientoPaciente = (from ctx in context.SeguimientoPaciente
                                                                 where !ctx.BajaLogica
                                                                 select ctx).ToList();
                return seguimientoPaciente;
            }
        }

        public int Insert(SeguimientoPaciente entity)
        {
            using (var context = new LunaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;
                entity.FechaAlta = DateTime.Now;

                entity.IdProfesional = UserCache.IdUsuario;

                context.SeguimientoPaciente.Add(entity);
                context.SaveChanges();

                return entity.IdSeguimientoPaciente;
            }
        }

        public void Update(SeguimientoPaciente entity)
        {
            using (var context = new LunaContext())
            {
                SeguimientoPaciente seguimientoPaciente = (from ctx in context.SeguimientoPaciente
                                                           where !ctx.BajaLogica
                                                           && ctx.IdSeguimientoPaciente == entity.IdSeguimientoPaciente
                                                           select ctx).FirstOrDefault();
                if(seguimientoPaciente!=null)
                {
                    seguimientoPaciente.Nota = entity.Nota;

                    seguimientoPaciente.FechaModificacion = DateTime.Now;
                    seguimientoPaciente.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public List<SeguimientoPaciente> GetByIdPaciente(int idPaciente)
        {
            using (var context = new LunaContext())
            {
                List<SeguimientoPaciente> seguimientoPaciente = (from ctx in context.SeguimientoPaciente
                                                                 where !ctx.BajaLogica
                                                                    && ctx.IdPaciente == idPaciente
                                                                 select ctx).ToList();
                return seguimientoPaciente;
            }
        }
    }
}
