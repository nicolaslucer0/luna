using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services
{
    public class RegistroNewsLetterService : IRegistroNewsLetterService
    {
        private readonly RegistroNewsletterRepository registroNewsletterRepository;

        public RegistroNewsLetterService()
        {
            this.registroNewsletterRepository = new RegistroNewsletterRepository();
        }

        public List<RegistroNewsletter> GetAll()
        {
            return this.registroNewsletterRepository.GetAll();
        }

        public RegistroNewsletter GetById(int id)
        {
            return this.registroNewsletterRepository.Get(id);
        }

        public int Insert(RegistroNewsletter entity)
        {
            return this.registroNewsletterRepository.Insert(entity);
        }

        public void Update(RegistroNewsletter entity)
        {
            this.registroNewsletterRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.registroNewsletterRepository.Delete(id);
        }

        #region NotImplementedMembers


        #endregion

    }
}
