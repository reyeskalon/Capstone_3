using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;


namespace Capstone.DAO
{
    public class FavoriteSqlDao : IFavoriteDao
    {
        private readonly string connectionString;
        public FavoriteSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public Favorite SetFavBeer(Favorite favorite)
        {

            try
            {

                using (SqlConnection conn = new SqlConnection(connectionString))
                {

                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO beeruserfav (user_id, beer_id) " +
                                                    "VALUES(@user_id, @beer_id); ", conn);
                    cmd.Parameters.AddWithValue("@user_id", favorite.UserId);
                    cmd.Parameters.AddWithValue("@beer_id", favorite.BeerId);



                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return favorite;
        }
    }
}
