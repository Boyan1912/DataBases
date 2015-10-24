namespace StudentsSystem.ConsoleClient
{
    using System;
    using System.Linq;
    using StudentsSystem.Data;
    using StudentsSystem.Models;
    using System.Data.Entity;
    using StudentsSystem.Data.Migrations;

    class Startup
    {
        static void Main()
        {

            Database.SetInitializer(new MigrateDatabaseToLatestVersion<StudentsDbContext, Configuration>());

            var db = new StudentsDbContext();

            var student = new Student()
            {
                Name = "Pesho"
            };

            db.Students.Add(student);
            db.SaveChanges();

            Console.WriteLine(db.Students.Count());
        }
    }
}
