using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Helpers;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories
{
    public class EarlyAdopterRepository : IEarlyAdopterRepository<EarlyAdopter>
    {
        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public EarlyAdopter Get(int id)
        {
            using (var context = new YanaContext())
            {
                EarlyAdopter adopter = (from ctx in context.EarlyAdopter
                                                 where ctx.IdEarlyAdopter == id
                                                     select ctx).FirstOrDefault();

                return adopter;
            }
        }

        public List<EarlyAdopter> GetAll()
        {
            using (var context = new YanaContext())
            {
                List<EarlyAdopter> adopters = (from ctx in context.EarlyAdopter
                                                            select ctx).ToList();

                return adopters;
            }
        }

        public int Insert(EarlyAdopter entity)
        {
            using (var context = new YanaContext())
            {
                entity.FechaAlta = DateTime.Now;

                context.EarlyAdopter.Add(entity);
                context.SaveChanges();

                return entity.IdEarlyAdopter;
            }
        }

        public void Update(EarlyAdopter entity)
        {
            using (var context = new YanaContext())
            {
                EarlyAdopter adopter = (from ctx in context.EarlyAdopter
                                                     where ctx.IdEarlyAdopter == entity.IdEarlyAdopter
                                                 select ctx).FirstOrDefault();

                if (adopter != null)
                {
                    adopter.Email = entity.Email;
                    adopter.FechaAlta = DateTime.Now;
                    adopter.TipoEarlyAdopter = entity.TipoEarlyAdopter;
                }

                context.SaveChanges();
            }
        }
    }
}
