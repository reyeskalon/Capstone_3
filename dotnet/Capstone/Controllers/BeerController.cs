using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using System.Collections.Generic;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BeerController : Controller
    {
        private readonly IBeerDao BeerDao;
        public BeerController(IBeerDao beerDao)
        {
            BeerDao = beerDao;
        }
        [HttpGet ("{beerId}")]
        public Beer GetBeerById(int beerId)
        {
            return BeerDao.GetBeerById(beerId);
        }
        [HttpGet ("/beers/{breweryId}")]
        public List<Beer> GetBeersByBrewery(int breweryId)
        {
            return BeerDao.GetBeersByBrewery(breweryId);
        }
        [HttpGet ("/favoritebeers/{userId}")]
        public List<Beer> GetFavoriteBeers(int userId)
        {
            return BeerDao.GetFavoriteBeers(userId);
        }
        [HttpPost ("add")]
        public Beer AddBeer(Beer beer)
        {
            return BeerDao.AddBeer(beer);
        }
        [HttpPut ("update")]
        public Beer UpdateBeer(Beer beer)
        {
            return BeerDao.UpdateBeer(beer);
        }
        [HttpPut ("toggleavaliable")]
        public  Beer ToggleBeer(Beer beer)
        {
            return BeerDao.ToggleIsAvaliable(beer);
        }
        [HttpGet ("/reviews/{beerId}")]
        public List<Review> GetReviewByBeerId(int beerId)
        {
            return BeerDao.GetReviewsForBeer(beerId);
        }
        [HttpGet ("/userreviews/{userId}")]
        public List<Review> GetUsersBeerReviews(int userId)
        {
            return BeerDao.GetUsersBeerReviews(userId);
        }
        [HttpPost("/reviews")]
        public Review SubmitNewReview(Review review)
        {
            return BeerDao.SubmitNewReview(review);
        }
    }
}
