using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class User
    {
        public int id { get; set; }
        public string userName { get; set; }
        public string passwordHash { get; set; }
    }
}
