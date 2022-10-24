using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Helpers;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories
{
    public class DomicilioUsuarioRepository : IDomicilioUsuarioRepository<DomicilioUsuario>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                DomicilioUsuario domicilioUsuario = context.DomicilioUsuario.FirstOrDefault(a => a.IdDomicilioUsuario == id);

                if (domicilioUsuario != null)
                {
                    domicilioUsuario.BajaLogica = true;
                    domicilioUsuario.FechaModificacion = DateTime.Now;
                    domicilioUsuario.IdUsuarioModificacion = UserCache.IdUsuario;
                }

                context.SaveChanges();
            }
        }

        public DomicilioUsuario Get(int id)
        {
            using (var context = new LunaContext())
            {
                DomicilioUsuario domicilioUsuario = (from ctx in context.DomicilioUsuario
                                                     where !ctx.BajaLogica
                                                         && ctx.IdDomicilioUsuario == id
                                                     select ctx).FirstOrDefault();

                return domicilioUsuario;
            }
        }

        public List<DomicilioUsuario> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<DomicilioUsuario> domiciliosUsuario = (from ctx in context.DomicilioUsuario
                                                            where !ctx.BajaLogica
                                                            select ctx).ToList();

                return domiciliosUsuario;
            }
        }

        public int Insert(DomicilioUsuario entity)
        {
            using (var context = new LunaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.DomicilioUsuario.Add(entity);
                context.SaveChanges();

                return entity.IdDomicilioUsuario;
            }
        }

        public void Update(DomicilioUsuario entity)
        {
            using (var context = new LunaContext())
            {
                DomicilioUsuario domicilioUsuario = (from ctx in context.DomicilioUsuario
                                                     where !ctx.BajaLogica
                                                            && ctx.IdDomicilioUsuario == entity.IdDomicilioUsuario
                                                     select ctx).FirstOrDefault();

                if (domicilioUsuario != null)
                {
                    domicilioUsuario.Calle = entity.Calle;
                    domicilioUsuario.Numero = entity.Numero;
                    domicilioUsuario.Piso = entity.Piso;
                    domicilioUsuario.Depto = entity.Depto;
                    domicilioUsuario.EntreCalle1 = entity.EntreCalle1;
                    domicilioUsuario.EntreCalle2 = entity.EntreCalle2;
                    domicilioUsuario.Telefono1 = entity.Telefono1;
                    domicilioUsuario.Telefono2 = entity.Telefono2;
                    domicilioUsuario.Celular1 = entity.Celular1;
                    domicilioUsuario.Celular2 = entity.Celular2;
                    domicilioUsuario.TelefonoEmergencia = entity.TelefonoEmergencia;
                    domicilioUsuario.Observaciones = entity.Observaciones;
                    domicilioUsuario.IdTipoDomicilio = entity.IdTipoDomicilio;
                    domicilioUsuario.IdLocalidad = entity.IdLocalidad;

                    domicilioUsuario.FechaModificacion = entity.FechaModificacion;
                    domicilioUsuario.IdUsuarioModificacion = UserCache.IdUsuario;
                }

                context.SaveChanges();
            }
        }
    }
}
