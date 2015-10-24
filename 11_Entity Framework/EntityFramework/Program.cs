namespace EntityFramework
{
    using System;
    using System.Linq;

    class Program
    {
        static void Main()
        {
            var db = new NORTHWNDEntities();
            var pesho = new Customer()
            {
                CustomerID = "Pesho",
                CompanyName = "Pesho's Company"
            };

           // DAO.InsertCustomer(pesho, db);
           // DAO.DeleteCustomer(pesho.CustomerID, db);
           // DAO.ModifyCustomerInfo("ANATR", db, "NEW COMPANY", "Pesho");

            foreach (var cust in DAO.GetCustomersByOrderDateAndShippingCountry(1997, "Canada", db))
            {
                Console.WriteLine(cust.ContactName);
                Console.WriteLine(cust.Country);
            }

            Console.WriteLine(new string('=', 30));
            foreach (var customerName in DAO.GetCustomersByOrderDateAndShippingCountryNativeSQL(db))
            {
                Console.WriteLine(customerName);
            }

            Console.ReadKey();
        }
    }
}
