using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using System.Collections.Generic;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BreweryController : Controller
    {
        private readonly IBreweryDao BreweryDao;
        public BreweryController(IBreweryDao breweryDao)
        {
            BreweryDao = breweryDao;
        }

        [HttpGet ("{id}")]
        public Brewery GetBrewery(int breweryId)
        {
            return BreweryDao.GetBreweryById(breweryId);
        }
        [HttpGet ("/breweries")]
        public List<Brewery> GetAllBreweries()
        {
            return BreweryDao.GetAllBreweries();
        }
        [HttpGet ("/breweries/{id}")]
        public List<Brewery> GetBreweries(int brewerId)
        {
            return BreweryDao.GetBreweriesByBrewerId(brewerId);
        }
        [HttpPut ("update")]
        public Brewery UpdateBrewery(Brewery brewery)
        {
            return BreweryDao.UpdateBrewery(brewery);
        }
        [HttpPut ("deactivate")]
        public Brewery DeactivateBrewery(Brewery brewery)
        {
            return BreweryDao.UpdateBrewery(brewery);
        }
        [HttpPut("reactivate")]
        public Brewery ReactivateBrewery(Brewery brewery)
        {
            return BreweryDao.UpdateBrewery(brewery);
        }
    }
}
