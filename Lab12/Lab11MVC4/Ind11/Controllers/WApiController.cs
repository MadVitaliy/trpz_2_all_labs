using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Ind11.Models;
using System.Text;

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
        [ActionName("GetTeach")]
        public ICollection<TeacherPerson> GetTeach()
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
        [ActionName("GetPos")]
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

        //sdfasfafsdfasdf

        [HttpPost]
        [ActionName("CreateTeach")]
        public HttpResponseMessage CreateEmp(Teacher teacher)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK);

            try
            {
                db.Teachers.Add(teacher);
                db.SaveChanges();
                response.Content = new StringContent("{Id:" + teacher.IdTeacher + ",Name:" + teacher.Name + ",Age:" + teacher.Age + "}", Encoding.UTF8, "application/json");
            }
            catch (Exception ex)
            {
                response.Content = new StringContent("{Error:" + ex.Message + "}", Encoding.UTF8, "application/json");

            }
            return response;
        }

        [HttpPost]
        [ActionName("UpdateTeach")]
        public HttpResponseMessage UpdateEmp(Teacher teacher)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK);
            var emp = (from o in db.Teachers where o.IdTeacher == teacher.IdTeacher select o).First();

            try
            {
                db.Teachers.Remove(emp);
                db.Teachers.Add(teacher);
                db.SaveChanges();
                response.Content = new StringContent("{Id:" + teacher.IdTeacher + ",Name:" + teacher.Name + ",Age:" + teacher.Age + "}", Encoding.UTF8, "application/json");
            }
            catch (Exception ex)
            {
                response.Content = new StringContent("{Error:" + ex.Message + "}", Encoding.UTF8, "application/json");

            }
            return response;
        }


        [HttpPost]
        [ActionName("DeleteTeach")]
        public HttpResponseMessage DeleteEmp(Teacher teacher)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK);
            var emp = (from o in db.Teachers where o.IdTeacher == teacher.IdTeacher select o).First();

            try
            {
                db.Teachers.Remove(emp);
                db.SaveChanges();
                response.Content = new StringContent("{Id:" + emp.IdTeacher + ",Name:" + emp.Name + ",Age:" + emp.Age + "}", Encoding.UTF8, "application/json");
            }
            catch (Exception ex)
            {
                response.Content = new StringContent("{Error:" + ex.Message + "}", Encoding.UTF8, "application/json");

            }
            return response;
        }

    }
}
