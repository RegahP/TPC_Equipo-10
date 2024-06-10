using DomainModel;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace DBAccess
{
    public class DBUsers
    {
        public List<User> usersList()
        {
            List<User> userList = new List<User>();
            DataAccess data = new DataAccess();

            try
            {
                data.setQuery("Select ID_User, Username, PasswordHash from Users");
                data.runRead();

                while(data.Reader.Read()) 
                {
                    User aux = new User();
                    aux.id = (int)data.Reader["ID_User"];
                    aux.userName = (string)data.Reader["Username"];
                    aux.passwordHash = (string)data.Reader["PasswordHash"];



                    userList.Add(aux);
                }

                return userList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                data.closeConnection();
            }
        }
    }
}
