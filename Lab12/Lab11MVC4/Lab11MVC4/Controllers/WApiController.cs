using System;
using System.Collections;
using System.Text;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Lab11MVC4.Models;

namespace Lab11MVC4.Controllers
{
    public class EmployeePerson
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class PersonSpecialization
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    public class WApiController : ApiController
    {
        private Lab9DBEntities db = new Lab9DBEntities();

        [HttpGet]
        [ActionName("GetEmp")]
        public ICollection<EmployeePerson> GetEmp()
        {
            var emps = (from employees in db.Employees select employees).ToList();

            Collection<EmployeePerson> EP = new Collection<EmployeePerson>();

            foreach (Employee e in emps)
            {
                EP.Add(new EmployeePerson { Id = e.IdEmployee, Name = e.Name });
            }

            return EP;
        }

        [HttpGet]
        [ActionName("GetPos")]
        public ICollection<PersonSpecialization> GetPos(int id)
        {
            var emps = (from position in db.Positions
                        where position.IdEmployee == id
                        select position.Specialization).ToList();

            Collection<PersonSpecialization> SP = new Collection<PersonSpecialization>();

            foreach (Specialization s in emps)
            {
                SP.Add(new PersonSpecialization { Id = s.IdSpec, Name = s.Name });
            }

            return SP;
        }

        [HttpPost]
        [ActionName("CreateEmp")]
        public HttpResponseMessage CreateEmp(Employee emp)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK);

            try
            {
                db.Employees.Add(emp);
                db.SaveChanges();
                response.Content = new StringContent("{Id:"+emp.IdEmployee+",Name:"+emp.Name+",Age:"+emp.Age+"}",Encoding.UTF8, "application/json");
            }
            catch (Exception ex)
            {
                response.Content = new StringContent("{Error:" + ex.Message + "}", Encoding.UTF8, "application/json");

            }
            return response;
        }

        [HttpPost]
        [ActionName("UpdateEmp")]
        public HttpResponseMessage UpdateEmp(Employee sEmp)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK);
            var emp = (from o in db.Employees where o.IdEmployee == sEmp.IdEmployee select o).First();

            try
            {
                db.Employees.Remove(emp);
                db.Employees.Add(sEmp);
                db.SaveChanges();
                response.Content = new StringContent("{Id:" + sEmp.IdEmployee + ",Name:" + sEmp.Name + ",Age:" + sEmp.Age + "}", Encoding.UTF8, "application/json");
            }
            catch (Exception ex)
            {
                response.Content = new StringContent("{Error:" + ex.Message + "}", Encoding.UTF8, "application/json");

            }
            return response;
        }


        [HttpPost]
        [ActionName("DeleteEmp")]
        public HttpResponseMessage DeleteEmp(Employee sEmp)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK);
            var emp = (from o in db.Employees where o.IdEmployee == sEmp.IdEmployee select o).First();

            try
            {
                db.Employees.Remove(emp);
                db.SaveChanges();
                response.Content = new StringContent("{Id:" + emp.IdEmployee + ",Name:" + emp.Name + ",Age:" + emp.Age + "}", Encoding.UTF8, "application/json");
            }
            catch (Exception ex)
            {
                response.Content = new StringContent("{Error:" + ex.Message + "}", Encoding.UTF8, "application/json");

            }
            return response;
        }
    }
}