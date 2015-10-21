/* Write a method that adds a new product in the products table in the Northwind database.
    -Use a parameterized SQL command.*/
namespace ADO.NET
{
    using System.Data.SqlClient;
    class Program
    {
        static void Main(string[] args)
        {
            SqlConnection dbCon = new SqlConnection("Server=.; " +
            "Database=NORTHWND; Integrated Security=true");

            InstertProduct(dbCon, "CHETKA", 7, 7, "1 by 1", 25.00M, 7, 2, 0);

            dbCon.ConnectionString = "Server=.; " +
            "Database=NORTHWND; Integrated Security=true";
            dbCon.Open();
            var newProductCheck = new SqlCommand("SELECT * FROM Products WHERE ProductName = 'CHETKA';", dbCon);
            System.Console.WriteLine("Product Added Successfully: {0}", (int)newProductCheck.ExecuteScalar() > 0);
            dbCon.Close();
        }

        private static void InstertProduct(SqlConnection connection, string productName, int? supplierId, int? categoryId, string quantityPerUnit, decimal? unitPrice, int? unitsInStock, int? unitsOnOrder, int? reorderLevel, bool discontinued = false)
        {
            string command = "INSERT INTO Products(" +
            "ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)" +
            "VALUES(@productName, @supplierID, @categoryID, @quantityPerUnit, @unitPrice, @unitsInStock, @unitsOnOrder, @reorderLevel, @discontinued)";

            connection.Open();
            using (connection)
            {
                var cmnd = new SqlCommand(command, connection);
                cmnd.Parameters.AddWithValue("@productName", productName);
                cmnd.Parameters.AddWithValue("@supplierID", supplierId);
                cmnd.Parameters.AddWithValue("@categoryID", categoryId);
                cmnd.Parameters.AddWithValue("@quantityPerUnit", quantityPerUnit);
                cmnd.Parameters.AddWithValue("@unitPrice", unitPrice);
                cmnd.Parameters.AddWithValue("@unitsInStock", unitsInStock);
                cmnd.Parameters.AddWithValue("@unitsOnOrder", unitsOnOrder);
                cmnd.Parameters.AddWithValue("@reorderLevel", reorderLevel);
                cmnd.Parameters.AddWithValue("@discontinued", discontinued);

                cmnd.ExecuteNonQuery();
            }
        }
    }
}
