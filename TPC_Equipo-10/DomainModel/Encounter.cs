using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Encounter
    {
        public int id {  get; set; }
        public int characterID {  get; set; }
        public int creatureID { get; set; }
        public int creatureCurrHealth { get; set; }
        public int currRound { get; set; }
        public bool turn { get; set; }

        public List<Effect> effects = new List<Effect>();
    }
}
