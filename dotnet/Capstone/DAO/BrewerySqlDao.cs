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
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM brewerys WHERE brewery_id = @breweryId", conn);
                    cmd.Parameters.AddWithValue("@breweryId", breweryId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        brewery = CreateBreweryFromReader(reader);
                    }
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
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM  brewerys AS b JOIN userbrewery AS ub ON b.brewery_id = ub.brewery_id WHERE ub.user_id = @brewerId; ", conn);
                    cmd.Parameters.AddWithValue("@brewerId", brewerId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        breweries.Add(CreateBreweryFromReader(reader));
                    }
                }
            }
            catch
            {

            }
            return breweries;
        }
        public List<Brewery> GetAllBreweries()
        {
            List<Brewery> breweries = new List<Brewery>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM brewerys", conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        breweries.Add(CreateBreweryFromReader(reader));
                    }
                }
            }
            catch
            {

            }
            return breweries;
        }
        public Brewery UpdateBrewery(Brewery brewery)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("UPDATE brewerys SET name = @name, hours = @hours, phone_number = @phone_number, website = @website, address = @address, longitude = @longitude, latitude = @latitude, history = @history, image = @image, GF_food = @GF_food, GF_beer = @GF_beer, is_open = @is_open WHERE brewery_id = @brewery_id; ", conn);
                    cmd.Parameters.AddWithValue("@name", brewery.Name);
                    cmd.Parameters.AddWithValue("@hours", brewery.HoursOfOperation);
                    cmd.Parameters.AddWithValue("@phone_number", brewery.PhoneNumber);
                    cmd.Parameters.AddWithValue("@website", brewery.WebsiteURL);
                    cmd.Parameters.AddWithValue("@address", brewery.Address);
                    cmd.Parameters.AddWithValue("@longitude", brewery.Longitude);
                    cmd.Parameters.AddWithValue("@latitude", brewery.Latitude);
                    cmd.Parameters.AddWithValue("@history", brewery.History);
                    cmd.Parameters.AddWithValue("@image", brewery.ImgURL);
                    cmd.Parameters.AddWithValue("@GF_food", brewery.HasGlutenFreeFood);
                    cmd.Parameters.AddWithValue("@GF_beer", brewery.HasGlutenFreeBeer);
                    cmd.Parameters.AddWithValue("@is_open", brewery.IsOpen);
                    cmd.Parameters.AddWithValue("@brewery_id", brewery.Id);
                    cmd.ExecuteNonQuery();
                }
            }
            catch
            {

            }
            return brewery;
        }
        public Brewery ToggleActivation(Brewery brewery)
        {
            try
            {
                string sqlCommandStr = "";
                brewery.IsOpen = !brewery.IsOpen;
                if(brewery.IsOpen == true)
                {
                    sqlCommandStr = "UPDATE brewerys SET activitylevel = 1 WHERE brewery_id = @breweryId;";
                }
                else
                {
                    sqlCommandStr = "UPDATE brewerys SET activitylevel = 0 WHERE brewery_id = @breweryId;";
                }
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sqlCommandStr, conn);
                    cmd.Parameters.AddWithValue("@breweryId", brewery.Id);
                    cmd.ExecuteNonQuery();
                }
            }
            catch
            {

            }
            return brewery;
        }
        public Brewery AddBrewery(Brewery brewery)
        {
            
            try
            {

                using (SqlConnection conn = new SqlConnection(connectionString))
                {

                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open) " +
                                                    "VALUES(@name, @hours, @phone_number, @website, @address, @longitude, @latitude, 'history', @image, @GF_food, @GF_beer, 1); ", conn);
                    cmd.Parameters.AddWithValue("@name", brewery.Name);
                    cmd.Parameters.AddWithValue("@hours", brewery.HoursOfOperation);
                    cmd.Parameters.AddWithValue("@history", brewery.History);
                    cmd.Parameters.AddWithValue("@website", brewery.WebsiteURL);
                    cmd.Parameters.AddWithValue("@image", brewery.ImgURL);
                    cmd.Parameters.AddWithValue("@phone_number", brewery.PhoneNumber);
                    cmd.Parameters.AddWithValue("@address", brewery.Address);
                    cmd.Parameters.AddWithValue("@longitude", brewery.Longitude);
                    cmd.Parameters.AddWithValue("@latitude", brewery.Latitude);
                    cmd.Parameters.AddWithValue("@GF_food", brewery.HasGlutenFreeFood);
                    cmd.Parameters.AddWithValue("@GF_beer", brewery.HasGlutenFreeBeer);


                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return brewery;
        }
        public Brewery CreateBreweryFromReader(SqlDataReader reader)
        {
            Brewery brewery = new Brewery();
            brewery.Id = Convert.ToInt32(reader["brewery_id"]);
            brewery.Name = Convert.ToString(reader["name"]);
            brewery.HoursOfOperation = Convert.ToString(reader["hours"]);
            brewery.PhoneNumber = Convert.ToString(reader["phone_number"]);
            brewery.WebsiteURL = Convert.ToString(reader["website"]);
            brewery.Address = Convert.ToString(reader["address"]);
            brewery.Longitude = Convert.ToDouble(reader["longitude"]);
            brewery.Latitude = Convert.ToDouble(reader["latitude"]);
            brewery.History = Convert.ToString(reader["history"]);
            brewery.ImgURL = Convert.ToString(reader["image"]);
            brewery.HasGlutenFreeFood = Convert.ToBoolean(reader["GF_food"]);
            brewery.HasGlutenFreeBeer = Convert.ToBoolean(reader["GF_beer"]);
            brewery.IsOpen = Convert.ToBoolean(reader["is_open"]);

            return brewery;
        }
    }
}
