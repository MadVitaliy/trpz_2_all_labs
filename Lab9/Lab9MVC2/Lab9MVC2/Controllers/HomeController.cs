using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Lab9MVC2.Models;

namespace Lab9MVC2.Controllers
{
    public class HomeController : Controller
    {
        private Lab9DBEntities db = new Lab9DBEntities();
        public ActionResult Index()
        {
            var emps = (from employees in db.Employees select employees).ToList();
            return View(emps);
        }

        public ActionResult Details(int id)
        {
            var emps = (from position in db.Positions
                        where position.IdEmployee == id
                        select position.Specialization).First();
            return View(emps);
        }

      
    }
}