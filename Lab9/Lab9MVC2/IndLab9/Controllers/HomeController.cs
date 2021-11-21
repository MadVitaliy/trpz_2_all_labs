using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IndLab9.Models;

namespace IndLab9.Controllers
{
    public class HomeController : Controller
    {
        private ILab9DBEntities db = new ILab9DBEntities();
        public ActionResult Index()
        {
            var emps = (from teachers in db.Teachers select teachers).ToList();
            return View(emps);
        }

        public ActionResult Details(int id)
        {
            var emps = (from position in db.Positions
                        where position.IdTeacher == id
                        select position.Subject).ToList();
            return View(emps);
        }
    }

   
}