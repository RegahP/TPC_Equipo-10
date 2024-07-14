using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class RolledAbility
    {
        public int abilityID { get; set; }
        public int rolledScore { get; set; }
        public int modifier {  get; set; }

        public RolledAbility() { }

        public RolledAbility(int abilityID, int rolledScore, int modifier)
        {
            this.abilityID = abilityID;
            this.rolledScore = rolledScore;
            this.modifier = modifier;
        }
    }
}
