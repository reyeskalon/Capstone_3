using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Brewery
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public bool HasGlutenFreeBeer { get; set; }
        public bool HasGlutenFreeFood { get; set; }
        public string HoursOfOperation { get; set; }
        public string History { get; set; }
        public string ImgURL { get; set; }
        public string WebsiteURL { get; set; }
        public string PhoneNumber { get; set; }
    }
}
