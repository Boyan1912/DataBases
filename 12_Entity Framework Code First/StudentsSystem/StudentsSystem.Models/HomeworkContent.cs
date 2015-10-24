namespace StudentsSystem.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [ComplexType]
    public class HomeworkContent
    {
        private const string filePath = "../../Homeworks";

        [Key]
        public int ContentId { get; set; }

        [Required]
        public string FilePath 
        {
            get { return filePath; }
        }

        [Column("Original File Name")]
        public string OriginalFileName { get; set; }
    }
}
