using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Review
    {
        public int ReviewId { get; set; }
        public double Rating { get; set; }
        public string ReviewText { get; set; }
    }
}
