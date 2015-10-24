namespace StudentsSystem.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    public class Student
    {
        private ICollection<Homework> homeworks;
        private ICollection<Course> courses;

        public Student()
        {
            this.StudentNumber = Guid.NewGuid();
            this.HomeWorks = new HashSet<Homework>();
            this.Courses = new HashSet<Course>();
        }

        [Key]
        public int StudentId { get; set; }

        [MinLength(2)]
        [MaxLength(50)]
        [Required]
        public string Name { get; set; }

        [Required]
        public Guid StudentNumber { get; set; }

        public virtual ICollection<Homework> HomeWorks
        {
            get { return this.homeworks; }
            set { this.homeworks = value; }
        }

        public virtual ICollection<Course> Courses
        {
            get { return this.courses; }
            set { this.courses = value; }
        }
    }
}
