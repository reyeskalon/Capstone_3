using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IFavoriteDao
    {
        Favorite SetFavBeer(Favorite favorite);
        List<Favorite> UsersFavBeers(int user_id);
    }
        void RemoveFavBeer(int userId, int beerId);
     } 
}
