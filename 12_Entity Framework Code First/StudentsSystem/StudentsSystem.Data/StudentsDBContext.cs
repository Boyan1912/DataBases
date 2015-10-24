namespace StudentsSystem.Data
{
    using StudentsSystem.Models;
    using System.Data.Entity;
    public class StudentsDbContext : DbContext
    {
        public StudentsDbContext()
            : base("StudentsSystem")
        {
        }
        
        public virtual IDbSet<Student> Students { get; set; }

        public virtual IDbSet<Course> Courses { get; set; }

        public virtual IDbSet<Homework> Homeworks { get; set; }

    }
}
