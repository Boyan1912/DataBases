namespace ADO.NET
{
    /* 05 Write a program that retrieves the images for all categories in the Northwind database and stores them as JPG files in the file system. */
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.IO;
    using System.Drawing;
    using System.Drawing.Imaging;
    class Program
    {
        private const string ConnectionString = "Server=.; Database=NORTHWND; Integrated Security=true";

        static void Main(string[] args)
        {
            ExtractAndStoreImages();
        }

        private static void ExtractAndStoreImages()
        {
            var result = new List<byte[]>();

            var dbCon = new SqlConnection(ConnectionString);
            dbCon.Open();

            using(dbCon)
            {
                var cmnd = new SqlCommand("SELECT Picture FROM Categories", dbCon);
                
                var reader = cmnd.ExecuteReader();

                int index = 1;
                while(reader.Read())
                {
                    string path = string.Format("../../images/picture{0}.jpg", index++);
                    var image = (byte[])reader["Picture"];
                    WriteImageToFile(image, path);
                }
            }
        }

        private static void WriteImageToFile(byte[] image, string path)
        {
            var stream = new MemoryStream(image, 78, image.Length - 78);
            using (stream)
            {
                Image picture = Image.FromStream(stream);
                picture.Save(path, ImageFormat.Jpeg);
            }
        }
        
    }
}
