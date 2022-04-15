using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using System.Collections.Generic;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BreweryController : ControllerBase
    {
        private readonly IBreweryDao BreweryDao;
        public BreweryController(IBreweryDao breweryDao)
        {
            BreweryDao = breweryDao;
        }

        [HttpGet("{breweryId}")]
        public Brewery GetBreweryById(int breweryId)
        {
            return BreweryDao.GetBreweryById(breweryId);
        }
        [HttpGet ("/breweries")]
        public List<Brewery> GetAllBreweries()
        {
            return BreweryDao.GetAllBreweries();
        } 
        [HttpGet ("/breweries/{brewerId}")]
        public List<Brewery> GetBreweries(int brewerId)
        {
            return BreweryDao.GetBreweriesByBrewerId(brewerId);
        }
        [HttpPut ("update")]
        public Brewery UpdateBrewery(Brewery brewery)
        {
            return BreweryDao.UpdateBrewery(brewery);
        }
        [HttpPut ("toggleactivation")]
        public Brewery DeactivateBrewery(Brewery brewery)
        {
            return BreweryDao.ToggleActivation(brewery);
        }
    }
}
