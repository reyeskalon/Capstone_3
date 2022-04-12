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
        [HttpGet ("{id}")]
        public Beer GetBeerById(int beerId)
        {
            return BeerDao.GetBeerById(beerId);
        }
        [HttpGet ("/beers/{id}")]
        public List<Beer> GetBeersByBrewery(int breweryId)
        {
            return BeerDao.GetBeersByBrewery(breweryId);
        }
        [HttpGet ("/favoritebeers/{id}")]
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
        [HttpPut ("remove")]
        public  Beer RemoveBeer(Beer beer)
        {
            return BeerDao.RemoveBeer(beer);
        }
        [HttpPost ("addreview")]
        public Review AddReview(Beer beer)
        {
            return BeerDao.AddReview(beer);
        }
    }
}
