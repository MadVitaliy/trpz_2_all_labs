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

        [HttpGet]
        public ActionResult Create()
        {
            Employee emp = new Employee();
            return View();
        }

        [HttpPost]
        public ActionResult Create(Employee emp)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Employees.Add(emp);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch(Exception ex)
            {
                ModelState.AddModelError(String.Empty, ex);
            }
            return View(emp);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var empEdit = (from emp in db.Employees where emp.IdEmployee == id select emp).First();
            return View(empEdit);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var empEdit = (from emp in db.Employees where emp.IdEmployee == id select emp).First();
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
            var empDelete = (from emp in db.Employees where emp.IdEmployee == id select emp).First();
            return View(empDelete);
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var empDelete = (from emp in db.Employees where emp.IdEmployee == id select emp).First();
            try
            {
                db.Employees.Remove(empDelete);
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