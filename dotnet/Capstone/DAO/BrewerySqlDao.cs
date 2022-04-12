using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class BrewerySqlDao : IBreweryDao
    {
        private readonly string connectionString;
        public BrewerySqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public Brewery GetBreweryById(int breweryId)
        {
            Brewery brewery = new Brewery();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // SqlCommand cmd = new SqlCommand("SELECT")
                }
            }
            catch
            {

            }
            return brewery;
        }
        public List<Brewery> GetBreweriesByBrewerId(int brewerId)
        {
            List<Brewery> breweries = new List<Brewery>();
            return breweries;
        }
        public List<Brewery> GetAllBreweries()
        {
            List<Brewery> breweries = new List<Brewery>();
            return breweries;
        }
        public Brewery UpdateBrewery(Brewery brewery)
        {
            return brewery;
        }
        public Brewery DeactivateBrewery(Brewery brewery)
        {
            return brewery;
        }
        public Brewery ReactivateBrewery(Brewery brewery)
        {
            return brewery;
        }
    }
}
