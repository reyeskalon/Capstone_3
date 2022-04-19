using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class BeerSqlDao : IBeerDao
    {
        private readonly string connectionString;

        public BeerSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public Beer GetBeerById(int beerId)
        {
            Beer returnBeer = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM beers WHERE beer_id = @beer_id", conn);
                    cmd.Parameters.AddWithValue("@beer_id", beerId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        returnBeer = GetBeerFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnBeer;
        }
        public Beer UpdateBeer(Beer beer)
        {
    
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("UPDATE beers SET name = @name, description = @description, image = @image, abv = @abv, category = @category, GF = @GF, brewery_id = @brewery_id, is_avaliable = @is_avaliable WHERE beer_id = @beer_id; ", conn);
                    cmd.Parameters.AddWithValue("@name", beer.Name);
                    cmd.Parameters.AddWithValue("@description", beer.Description);
                    cmd.Parameters.AddWithValue("@image", beer.ImgURL);
                    cmd.Parameters.AddWithValue("@abv", beer.ABV);
                    cmd.Parameters.AddWithValue("@category", beer.BeerType);
                    cmd.Parameters.AddWithValue("@GF", beer.IsGlutenFree);
                    cmd.Parameters.AddWithValue("@brewery_id", beer.BreweryId);
                    cmd.Parameters.AddWithValue("@is_avaliable", beer.BreweryId);
                    cmd.Parameters.AddWithValue("@beer_id", beer.BeerId);


                    cmd.ExecuteNonQuery();

                }
            }
            catch (SqlException)
            {
                throw;
            }

            return beer;
        }
        public Beer ToggleIsAvaliable(Beer beer)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    if (beer.IsAvaliable == false)
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE beers SET is_avaliable = 0 WHERE beer_id = @beer_id; ", conn);
                        cmd.Parameters.AddWithValue("@is_avaliable", beer.BreweryId);
                        cmd.Parameters.AddWithValue("@beer_id", beer.BeerId);
                        cmd.ExecuteNonQuery();
                    }
                    if (beer.IsAvaliable == true)
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE beers SET is_avaliable = 1 WHERE beer_id = @beer_id; ", conn);
                        cmd.Parameters.AddWithValue("@beer_id", beer.BeerId);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return beer;
        }
        public Beer AddBeer(Beer beer)
        {
            int newBeerId;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id) " +
                        "OUTPUT INSERTED.beer_id " +
                        "VALUES(@name, @description, @image, @is_avaliable, @abv, @category, @GF, @brewery_id);", conn);
                    cmd.Parameters.AddWithValue("@name", beer.Name);
                    cmd.Parameters.AddWithValue("@description", beer.Description); 
                    cmd.Parameters.AddWithValue("@image", beer.ImgURL);
                    cmd.Parameters.AddWithValue("@is_avaliable", beer.IsAvaliable);
                    cmd.Parameters.AddWithValue("@abv", beer.ABV);
                    cmd.Parameters.AddWithValue("@category", beer.BeerType);
                    cmd.Parameters.AddWithValue("@GF", beer.IsGlutenFree);
                    cmd.Parameters.AddWithValue("@brewery_id", beer.BreweryId);

                    newBeerId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return GetBeerById(newBeerId);
        }
        public List<Beer> GetBeersByBrewery(int breweryId)
        {
            List<Beer> returnBeers = new List<Beer>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM beers WHERE brewery_id = @brewery_id", conn);
                    cmd.Parameters.AddWithValue("@brewery_id", breweryId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Beer beer = GetBeerFromReader(reader);
                        returnBeers.Add(beer);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnBeers;
        }
        public List<Beer> GetFavoriteBeers(int userId)
        {
            List<Beer> returnBeers = new List<Beer>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * " +
                                                    "FROM beers " +
                                                    "JOIN beeruserfav " +
                                                    "ON beers.beer_id = beeruserfav.beer_id " +
                                                    "WHERE user_id = @user_id; ", conn);
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Beer beer = GetBeerFromReader(reader);
                        returnBeers.Add(beer);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnBeers;
        }
        public List<Review> GetReviewsForBeer(int beerId)
        {
            List<Review> reviews = new List<Review>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * " +
                                                    "FROM beer_reviews " +
                                                    "WHERE beer_id = @beer_id; ", conn);
                    cmd.Parameters.AddWithValue("@beer_id", beerId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Review review = GetReviewFromReader(reader);
                        reviews.Add(review);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return reviews;
        }
        public List<Review> GetUsersBeerReviews(int userId)
        {
            List<Review> reviews = new List<Review>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT review_id, rating, review_body, beer_id, user_id " +
                                                    "FROM beer_reviews " +
                                                    "WHERE user_id = @user_id; ", conn);
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Review review = GetReviewFromReader(reader);
                        reviews.Add(review);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return reviews;
        }
        public List<Beer> GetAllBeers()
        {
            List<Beer> returnBeers = new List<Beer>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM beers", conn);
                 
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Beer beer = GetBeerFromReader(reader);
                        returnBeers.Add(beer);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnBeers;
        }
        public Beer GetBeerFromReader(SqlDataReader reader)
        {
            Beer beer = new Beer()
            {
                BeerId = Convert.ToInt32(reader["beer_id"]),
                Name = Convert.ToString(reader["name"]),
                Description = Convert.ToString(reader["description"]),
                ImgURL = Convert.ToString(reader["image"]),
                ABV = Convert.ToDouble(reader["abv"]),
                BeerType = Convert.ToString(reader["category"]),
                IsGlutenFree = Convert.ToBoolean(reader["GF"]),
                BreweryId = Convert.ToInt32(reader["brewery_id"]),
            };

            return beer;
        }
        
        public Review GetReviewFromReader(SqlDataReader reader)
        {
            Review review = new Review()
            {
                ReviewId = Convert.ToInt32(reader["review_id"]),
                Rating = Convert.ToInt32(reader["rating"]),
                ReviewText = Convert.ToString(reader["review_body"]),
                BeerId = Convert.ToInt32(reader["beer_id"]),
                UserId = Convert.ToInt32(reader["user_id"])
            };

            return review;
        }
       public  Review SubmitNewReview(Review review)
       {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO beer_reviews (rating, review_body, beer_id, user_id) " +
                        "OUTPUT INSERTED.review_id " +
                        "VALUES(@rating, @review_text, @beer_id, @user_id);", conn);
                    cmd.Parameters.AddWithValue("@rating", review.Rating);
                    cmd.Parameters.AddWithValue("@review_text", review.ReviewText);
                    cmd.Parameters.AddWithValue("@beer_id", review.BeerId);
                    cmd.Parameters.AddWithValue("@user_id", review.UserId);

                    review.ReviewId = Convert.ToInt32(cmd.ExecuteScalar());

                }
            }
            catch (SqlException)
            {
                throw;
            }

            return review;
        }
    }
}
