using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IBreweryDao
    {
        Brewery GetBreweryById(int breweryId);
        List<Brewery> GetBreweriesByBrewerId(int brewerId);
        List<Brewery> GetAllBreweries();
        Brewery UpdateBrewery(Brewery brewery);
        Brewery ToggleActivation(Brewery brewery);
        Brewery AddBrewery(Brewery brewery);
    }
}
