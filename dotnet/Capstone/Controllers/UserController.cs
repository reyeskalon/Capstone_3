using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Route("[user]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserDao UserDao;
        public UserController(IUserDao userDao)
        {
            UserDao = userDao;
        }
        [HttpGet("/users")]
        public List<ReturnUser> GetAllUsers()
        {
            return UserDao.GetUsers();
        }
    }

}
