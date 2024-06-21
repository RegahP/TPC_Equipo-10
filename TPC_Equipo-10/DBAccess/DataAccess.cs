using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Security.Permissions;
using DomainModel;
using System.Xml.Linq;
using System.Diagnostics;

namespace DBAccess
{
    public class DataAccess
    {
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;

        public SqlDataReader Reader
        {
            get { return reader; }
        }

        public DataAccess()
        {
            connection = new SqlConnection("server=.\\SQLEXPRESS; database=TPC_ChambersAndWyverns; integrated security=true");
            command = new SqlCommand();
        }

        public void SetQuery(string query)
        {
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = query;
        }

        public void SetProcedure(string procedure)
        {

            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = procedure;
        }

        public void ExecuteRead()
        {
            command.Connection = connection;
            try
            {
                connection.Open();
                reader = command.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ExecuteAction()
        {
            command.Connection = connection;
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void runRead()
        {
            command.Connection = connection;
            try
            {
                connection.Open();
                reader = command.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void CloseConnection()
        {
            if (reader != null)
            {
                reader.Close();
            }
            connection.Close();
        }


        public List<User> ListUsers()
        {
            List<User> userList = new List<User>();
            DataAccess data = new DataAccess();

            try
            {
                data.SetQuery("Select ID_User, Username, PasswordHash from Users");
                data.runRead();

                while (data.Reader.Read())
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
                data.CloseConnection();
            }
        }


        public List<Ability> ListAbilities()
        {
            List<Ability> list = new List<Ability>();

            try
            {
                SetQuery("select * from Abilities");
                ExecuteRead();

                while (reader.Read())
                {
                    Ability aux = new Ability();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    list.Add(aux);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }
        }



        public List<Background> ListBackgrounds()
        {
            List<Background> list = new List<Background>();

            try
            {
                SetQuery("select * from Backgrounds");
                ExecuteRead();

                while (reader.Read())
                {
                    Background aux = new Background();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.skill1BonusID = reader.GetInt32(3);
                    aux.skill2BonusID = reader.GetInt32(4);
                    aux.initialGold = reader.GetInt32(5);
                    list.Add(aux);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }
        }


        public List<Character> ListCharacters()
        {
            List<Character> list = new List<Character>();

            List<Race> listRaces = new List<Race>();
            listRaces = ListRaces();
            List<Class> listClasses = new List<Class>();
            listClasses = ListClasses();
            List<Background> listBackgrounds = new List<Background>();
            listBackgrounds = ListBackgrounds();
            List<Ability> listAbilities = new List<Ability>();


            try
            {
                SetQuery("select * from Characters");
                ExecuteRead();

                while (reader.Read())
                {
                    Character aux = new Character();

                    aux.id = reader.GetInt32(0);
                    aux.idUser = reader.GetInt32(1);
                    aux.sex = reader.GetBoolean(2);

                    int id = reader.GetInt32(3);
                    foreach (Race race in listRaces)
                    {
                        if (race.id == id)
                        {
                            aux.race = race;
                            break;
                        }
                    }
                    id = reader.GetInt32(4);
                    foreach (Class cl in listClasses)
                    {
                        if (cl.id == id)
                        {
                            aux.chrClass = cl;
                            break;
                        }
                    }
                    id = reader.GetInt32(5);
                    foreach (Background bg in listBackgrounds)
                    {
                        if (bg.id == id)
                        {
                            aux.bg = bg;
                            break;
                        }
                    }

                    aux.name = reader.GetString(6);
                    aux.level = reader.GetInt32(7);
                    aux.xp = reader.GetInt32(8);
                    aux.prof = reader.GetInt32(9);

                    aux.luck = reader.GetInt32(10);
                    aux.round = reader.GetInt32(11);
                    aux.encounters = reader.GetInt32(12);
                    aux.gameState = reader.GetInt32(13);

                    aux.armor = reader.GetInt32(14);
                    aux.maxHealth = reader.GetInt32(15);
                    aux.currHealth = reader.GetInt32(16);
                    aux.gold = reader.GetInt32(17);

                    list.Add(aux);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }


            foreach (Character c in list)
            {
                listAbilities = GetCharacterAbilities(c.id);
                c.abilities = listAbilities;
            }

            return list;

        }


        public List<Class> ListClasses()
        {
            List<Class> list = new List<Class>();

            try
            {
                SetQuery("select * from Classes");
                ExecuteRead();

                while (reader.Read())
                {
                    Class aux = new Class();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.classHealth = reader.GetInt32(3);
                    aux.specialName = reader.GetString(4);
                    aux.specialDesc = reader.GetString(5);
                    aux.abilityID = reader.GetInt32(6);
                    list.Add(aux);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }
        }



        public List<Race> ListRaces()
        {
            List<Race> list = new List<Race>();

            try
            {
                SetQuery("select * from Races");
                ExecuteRead();

                while (reader.Read())
                {
                    Race aux = new Race();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.abilityID = reader.GetInt32(3);
                    list.Add(aux);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }
        }


        public List<Skill> ListSkills()
        {
            List<Skill> list = new List<Skill>();

            try
            {
                SetQuery("select * from Skills");
                ExecuteRead();

                while (reader.Read())
                {
                    Skill aux = new Skill();
                    aux.id = reader.GetInt32(0);
                    aux.abilityID = reader.GetInt32(1);
                    aux.name = reader.GetString(2);
                    aux.desc = reader.GetString(3);
                    list.Add(aux);
                }
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }
        }

        public void NewCharacter(Character character)
        {

            try
            {
                SetProcedure("SP_InsertNewCharacter");

                command.Parameters.AddWithValue("@ID_User", 1);
                command.Parameters.AddWithValue("@Sex", character.sex);
                command.Parameters.AddWithValue("@ID_Race", character.race.id);
                command.Parameters.AddWithValue("@ID_Class", character.chrClass.id);
                command.Parameters.AddWithValue("@ID_Background", character.bg.id);
                command.Parameters.AddWithValue("@_Name", character.name);
                command.Parameters.AddWithValue("@Abilities", "12, 10, 13, 8, 15, 16"); //temp, deberia tomar los valores rolleados

                ExecuteAction();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }

        }


        public List<Ability> GetCharacterAbilities(int idCharacter)
        {
            List<Ability> abilities = new List<Ability>();

            try
            {
                SetProcedure("SP_GetCharacterAbilities");
                ExecuteRead();
                while (reader.Read())
                {
                    int chID = reader.GetInt32(0);

                    if (chID == idCharacter)
                    {
                        Ability aux = new Ability();
                        aux.id = reader.GetInt32(1);
                        aux.name = reader.GetString(2);
                        aux.desc = reader.GetString(3);
                        aux.rolledScore = reader.GetInt32(4);
                        aux.modifier = reader.GetInt32(5);

                        abilities.Add(aux);
                    }
                }

                return abilities;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CloseConnection();
            }

        }



    }
}
