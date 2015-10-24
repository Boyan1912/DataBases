namespace EntityFramework
{


    using System;
    using System.Collections.Generic;
    using System.Linq;
    public class DAO
    {

        public static void InsertCustomer(Customer customer, NORTHWNDEntities dataBase)
        {
            dataBase.Customers.Add(customer);
            dataBase.SaveChanges();
        }

        public static void DeleteCustomer(string customerId, NORTHWNDEntities dataBase)
        {
            var customer = dataBase.Customers.FirstOrDefault(x => x.CustomerID.ToLower() == customerId.ToLower());
            dataBase.Customers.Remove(customer);
            dataBase.SaveChanges();
        }

        public static void ModifyCustomerInfo(string customerId, NORTHWNDEntities dataBase, string companyName = null, string contactName = null, string contactTitle = null, string address = null, string city = null, string region = null, string postalCode = null, string country = null, string phone = null, string fax = null)
        {
            var customer = dataBase.Customers.FirstOrDefault(x => x.CustomerID.ToLower() == customerId.ToLower());

            customer.CompanyName = companyName;
            customer.ContactName = contactName;
            customer.ContactTitle = contactTitle;
            customer.Address = address;
            customer.City = city;
            customer.Region = region;
            customer.PostalCode = postalCode;
            customer.Country = country;
            customer.Phone = phone;
            customer.Fax = fax;

            dataBase.SaveChanges();
        }

        public static HashSet<Customer> GetCustomersByOrderDateAndShippingCountry(int year, string shippingDestination, NORTHWNDEntities dataBase)
        {
            var result = dataBase.Orders.Where(o => o.OrderDate.Value.Year == year && o.ShipCountry == shippingDestination)
                            .Select(o => o.Customer)
                            .ToList();

            var hashSet = new HashSet<Customer>(result);
            return hashSet;
        }

        public static IList<string> GetCustomersByOrderDateAndShippingCountryNativeSQL(NORTHWNDEntities dataBase)
        {
            var result = new List<Customer>();

            string sqlQuery =
                "SELECT DISTINCT c.ContactName " +
                "FROM Customers c " +
                "JOIN Orders o " +
                "ON c.CustomerID = o.CustomerID " +
                "WHERE YEAR(o.OrderDate) = 1997 " +
                "AND o.ShipCountry = 'Canada';";

            var customers = dataBase.Database.SqlQuery<string>(sqlQuery).ToList();

            return customers;
        }
    }
}
