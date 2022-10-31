using System;
using Microsoft.AspNetCore.Mvc;
using Yana.Enums;

namespace luna.Controllers
{
    public class BillingController : Controller
    {
        public BillingController()
        {
            
        }

        #region Billing

        public IActionResult Index()
        {
            return View();
        }
        #endregion
    }
}