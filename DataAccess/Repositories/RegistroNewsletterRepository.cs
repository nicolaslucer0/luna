using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Helpers;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories
{
    public class RegistroNewsletterRepository : IRegistroNewsletterRepository<RegistroNewsletter>
    {
        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public RegistroNewsletter Get(int id)
        {
            using (var context = new LunaContext())
            {
                RegistroNewsletter adopter = (from ctx in context.RegistroNewsletter
                                              where ctx.IdRegistroNewsletter == id
                                                     select ctx).FirstOrDefault();

                return adopter;
            }
        }

        public List<RegistroNewsletter> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<RegistroNewsletter> adopters = (from ctx in context.RegistroNewsletter
                                                     select ctx).ToList();

                return adopters;
            }
        }

        public int Insert(RegistroNewsletter entity)
        {
            using (var context = new LunaContext())
            {
                entity.FechaAlta = DateTime.Now;

                context.RegistroNewsletter.Add(entity);
                context.SaveChanges();

                return entity.IdRegistroNewsletter;
            }
        }

        public void Update(RegistroNewsletter entity)
        {
            using (var context = new LunaContext())
            {
                RegistroNewsletter adopter = (from ctx in context.RegistroNewsletter
                                              where ctx.IdRegistroNewsletter == entity.IdRegistroNewsletter
                                                 select ctx).FirstOrDefault();

                if (adopter != null)
                {
                    adopter.Email = entity.Email;
                    adopter.FechaAlta = DateTime.Now;
                }

                context.SaveChanges();
            }
        }
    }
}
