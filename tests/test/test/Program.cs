/* Write a program that retrieves the images for all categories
 * in the Northwind database and stores them as JPG files in the file system. */
namespace T5.ImagesToJPG
{
    using System;
    using System.Configuration;
    using System.IO;
    using System.Drawing;
    using System.Data.SqlClient;
    using System.Data.OleDb;
    class Program
    {
        private const int OLE_METAFILEPICT_START_POSITION = 78;
        private static SqlConnection dbConnection;

        static void Main()
        {

            dbConnection = new SqlConnection("Server=.; Database=NORTHWND; Integrated Security=true");
            dbConnection.Open();

            using (dbConnection)
            {
                SqlCommand cmdCategoryPictures = new SqlCommand(
                    @"SELECT Picture FROM Categories", dbConnection);



                Console.WriteLine("Pictures of all categories saved into files *.JPG - folder ..\\..\\images\n");

                SqlDataReader reader = cmdCategoryPictures.ExecuteReader();
                var count = 0;
                string filePath;
                byte[] picture = null;

                while (reader.Read())
                {
                    filePath = String.Format(@"..\..\images\CategoryPicture{0}.jpg", count);
                    picture = (byte[])reader["Picture"];
                    WiritePictureToFile(filePath, picture);
                    count++;
                }
            }
        }
        private static void WiritePictureToFile(string fileName, byte[] fileContents)
        {
            using (var ms = new MemoryStream(fileContents, OLE_METAFILEPICT_START_POSITION, fileContents.Length - OLE_METAFILEPICT_START_POSITION))
            {
                Image img = Image.FromStream(ms);


                img.Save(fileName);
            }
        }
    }
}



