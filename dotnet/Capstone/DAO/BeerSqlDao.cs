using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public class BeerSqlDao : IBeerDao
    {
        public Beer GetBeerById(int beerId)
        {
            Beer beer = new Beer();
            return beer;
        }
        public Beer UpdateBeer(Beer beer)
        {
            return beer;
        }
        public Beer RemoveBeer(Beer beer)
        {
            return beer;
        }
        public Beer AddBeer(Beer beer)
        {
            return beer;
        }
        public List<Beer> GetBeersByBrewery(int breweryId)
        {
            List<Beer> beers = new List<Beer>();
            return beers;
        }
        public List<Beer> GetFavoriteBeers(int userId)
        {
            List<Beer> beers = new List<Beer>();
            return beers;
        }
        public Review AddReview(Beer beer)
        {
            Review review = new Review();
            return review;
        }
    }
}
