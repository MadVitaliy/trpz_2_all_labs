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

        [HttpGet]
        public ActionResult Create()
        {
            Teacher emp = new Teacher();
            return View(emp);
        }

        [HttpPost]
        public ActionResult Create(Teacher emp)
        {
            try
            {
               if (ModelState.IsValid)
               {
                    db.Teachers.Add(emp);
                    db.SaveChanges();
                    return RedirectToAction("Index");
               }

            }
            catch (Exception ex)
            {
                ModelState.AddModelError(String.Empty, ex);
                ViewBag.result = ex.ToString();
                
            }
            return View(emp);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var empEdit = (from emp in db.Teachers where emp.IdTeacher == id select emp).First();
            return View(empEdit);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var empEdit = (from emp in db.Teachers where emp.IdTeacher == id select emp).First();
            try
            {
                UpdateModel(empEdit);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(empEdit);
            }
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var empDelete = (from emp in db.Teachers where emp.IdTeacher == id select emp).First();
            return View(empDelete);
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var empDelete = (from emp in db.Teachers where emp.IdTeacher == id select emp).First();
            try
            {
                db.Teachers.Remove(empDelete);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(empDelete);
            }

        }
    }

   
}