using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.ComponentModel;

namespace Lab9MVC2.Models
{
    [MetadataType(typeof(EmployeeMetaData))]
    public partial class  Employee
    {
        [Bind(Exclude = "IdEmployee")]
        public class EmployeeMetaData {

            [ScaffoldColumn(false)]
            public int IdEmployee { get; set; }

            [DisplayName("Name")]
            [Required(ErrorMessage = "Employee name is required")]
            [DisplayFormat(ConvertEmptyStringToNull = false)]
            [StringLength(25)]
            public string Name { get; set; }

            [DisplayName("Age")]
            [Required(ErrorMessage = "Age is required")]
            [DisplayFormat(ConvertEmptyStringToNull = false)]
            [Range(15, 90, ErrorMessage = "Employee age should be in range 15-90 years \n (yes, we maintain child labour)")]
            public int Age { get; set; }
        }
    }
}