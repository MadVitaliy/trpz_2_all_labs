//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IndLab9.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Teacher
    {
        public Teacher()
        {
            this.Positions = new HashSet<Position>();
        }
    
        public int IdTeacher { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
    
        public virtual ICollection<Position> Positions { get; set; }
    }
}
