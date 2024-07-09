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
        public string username { get; set; }
        public string passwordHash { get; set; }
        public int iconID { get; set; }

        public User(string username, string passwordHash, int iconID)
        {
            this.username = username;
            this.passwordHash = passwordHash;
            this.iconID = iconID;
        }
    }
}
