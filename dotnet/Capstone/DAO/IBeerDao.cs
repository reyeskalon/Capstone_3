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
        Beer RemoveBeer(Beer beer);
        Beer AddBeer(Beer beer);
        List<Beer> GetBeersByBrewery(int breweryId);
        List<Beer> GetFavoriteBeers(int userId);
        Review AddReview(Beer beer);
    }
}
