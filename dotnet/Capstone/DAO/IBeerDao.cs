using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IBeerDao
    {
        Beer GetBeerById(int beerId);
        Beer UpdateBeer(Beer beer);
        Beer ToggleIsAvaliable(Beer beer);
        Beer AddBeer(Beer beer);
        List<Beer> GetBeersByBrewery(int breweryId);
        List<Beer> GetFavoriteBeers(int userId);
        List<Review> GetReviewsForBeer(int beerId);
        Review SubmitNewReview(Review review);
        List<Review> GetUsersBeerReviews(int userId);
    }
}
