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
        public List<Favorite> UsersFavBeers(int user_id)
        {
            List<Favorite> favoriteBeers = new List<Favorite>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM beeruserfav WHERE user_id = @user_id;", conn);
                    cmd.Parameters.AddWithValue("@user_id", user_id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Favorite favorite = new Favorite();
                        favorite.BeerId = Convert.ToInt32(reader["beer_id"]);
                        favorite.UserId = Convert.ToInt32(reader["user_id"]);
                        favoriteBeers.Add(favorite);
                    }
                }
            }
            catch
            {

            }
            return favoriteBeers;
        }
    }
}
