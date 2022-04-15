using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Beer
    {
        public int BeerId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImgURL { get; set; }
        public double ABV { get; set; }
        public string BeerType { get; set; }
        public bool IsGlutenFree { get; set; }
        public int BreweryId { get; set; }
        public bool IsAvaliable { get; set; }
    }
}