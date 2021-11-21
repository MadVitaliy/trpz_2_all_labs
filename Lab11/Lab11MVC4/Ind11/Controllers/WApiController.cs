using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Ind11.Models;

namespace Ind11.Controllers
{
    public class TeacherPerson
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
        private ILab9DBEntities db = new ILab9DBEntities();
        [HttpGet]
        public ICollection<TeacherPerson> GetEmp()
        {
            var emps = (from teachers in db.Teachers select teachers).ToList();

            Collection<TeacherPerson> TP = new Collection<TeacherPerson>();

            foreach (Teacher t in emps)
            {
                TP.Add(new TeacherPerson { Id = t.IdTeacher, Name = t.Name });
            }

            return TP;
        }
        [HttpGet]
        public ICollection<PersonSpecialization> GetPos(int id)
        {
            var emps = (from position in db.Positions
                        where position.IdTeacher == id
                        select position.Subject).ToList();

            Collection<PersonSpecialization> SP = new Collection<PersonSpecialization>();

            foreach (Subject s in emps)
            {
                SP.Add(new PersonSpecialization { Id = s.IdSubject, Name = s.Name });
            }

            return SP;
        }

    }
}
