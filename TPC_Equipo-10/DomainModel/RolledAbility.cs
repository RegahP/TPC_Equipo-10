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

        public RolledAbility(int abilityID, int rolledScore)
        {
            this.abilityID = abilityID;
            this.rolledScore = rolledScore;
        }

        public int GetModifier()
        {
            return (int)((rolledScore - 10) / 2);
        }
    }
}
