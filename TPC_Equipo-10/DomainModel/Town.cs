using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Town
    {
        public int id {  get; set; }
        public int characterID { get; set; }
        public int merchantSex { get; set; }
        public int merchantRace { get; set; }
        public int merchantPersonality { get; set; }
        
        public List<int> catalogue = new List<int>();
    }
}
