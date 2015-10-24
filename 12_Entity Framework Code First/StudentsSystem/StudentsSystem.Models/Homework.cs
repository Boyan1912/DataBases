namespace StudentsSystem.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    public class Homework
    {
        [Key]
        public int HomeworkId { get; set; }

        public virtual HomeworkContent Content { get; set; }

        public DateTime? TimeSent { get; set; }

        [Required]
        public int StudentId { get; set; }

        public virtual Student Student { get; set; }

        [Required]
        public int CourseId { get; set; }

        public virtual Course Course { get; set; }

    }
}
