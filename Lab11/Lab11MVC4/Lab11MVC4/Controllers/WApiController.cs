using System;
using System.Collections;
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
    }
}