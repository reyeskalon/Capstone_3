using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Route("[contorller]")]
    [ApiController]
    public class FavoriteController : ControllerBase
    {
        private readonly IFavoriteDao FavoriteDao;

        public FavoriteController(IFavoriteDao favoriteDao)
        {
            FavoriteDao = favoriteDao;
        }

        [HttpPost("/addfavbeer")]
        public Favorite SetFavBeer(Favorite favorite)
        {
            return FavoriteDao.SetFavBeer(favorite);
        }
    }
}
