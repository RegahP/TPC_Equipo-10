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
    public static class DataAccess
    {
        private static SqlConnection connection = new SqlConnection("server=.\\SQLEXPRESS; database=TPC_ChambersAndWyverns; integrated security=true");
        private static SqlCommand command = new SqlCommand();
        private static SqlDataReader reader;

        public static SqlDataReader Reader
        {
            get { return reader; }
        }

        public static void SetQuery(string query)
        {
            command.CommandType = System.Data.CommandType.Text;
            command.CommandText = query;
        }

        public static void SetProcedure(string procedure)
        {

            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = procedure;
        }

        public static void SetParameter(string parameter, object value)
        {
            command.Parameters.Add(new SqlParameter(parameter, value));
        }

        public static void ExecuteRead()
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

        public static void ExecuteAction()
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

        public static int ExecuteActionScalar()
        {
            command.Connection = connection;
            try
            {
                connection.Open();
                return int.Parse(command.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static void runRead()
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
        public static void CloseConnection()
        {
            if (reader != null)
            {
                reader.Close();
            }
            if (command != null)
            {
                command.Parameters.Clear();
            }
            connection.Close();
        }


        public static List<Ability> ListAbilities()
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



        public static List<Background> ListBackgrounds()
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


        public static List<Character> ListCharacters()
        {
            List<Character> listCharacters = new List<Character>();

            List<Race> listRaces = new List<Race>();
            listRaces = ListRaces();
            List<Class> listClasses = new List<Class>();
            listClasses = ListClasses();
            List<Background> listBackgrounds = new List<Background>();
            listBackgrounds = ListBackgrounds();
            List<Ability> listAbilities = new List<Ability>();
            listAbilities = ListAbilities();

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
                            aux.race = race.id;
                            break;
                        }
                    }
                    id = reader.GetInt32(4);
                    foreach (Class cl in listClasses)
                    {
                        if (cl.id == id)
                        {
                            aux.chrClass = cl.id;
                            break;
                        }
                    }
                    id = reader.GetInt32(5);
                    foreach (Background bg in listBackgrounds)
                    {
                        if (bg.id == id)
                        {
                            aux.bg = bg.id;
                            break;
                        }
                    }

                    foreach (Ability ab in listAbilities)
                    {
                        aux.abilities.Add(ab.id);
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

                    listCharacters.Add(aux);
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

            return listCharacters;

        }


        public static List<Class> ListClasses()
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



        public static List<Race> ListRaces()
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


        public static List<Skill> ListSkills()
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

        public static void NewCharacter(Character character, int userID)
        {

            try
            {
                SetProcedure("SP_InsertNewCharacter");

                SetParameter("@ID_User", userID);
                SetParameter("@Sex", character.sex);
                SetParameter("@ID_Race", character.race);
                SetParameter("@ID_Class", character.chrClass);
                SetParameter("@ID_Background", character.bg);
                SetParameter("@_Name", character.name);
                SetParameter("@Abilities", "12, 10, 13, 8, 15, 16"); //temp, deberia tomar los valores rolleados

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

        public static List<Weapon> GetWeapons()
        {
            List<Weapon> weapons = new List<Weapon>();

            try
            {
                SetProcedure("SP_GetWeapons");
                ExecuteRead();
                while (reader.Read())
                {
                    Weapon aux = new Weapon();
                    DamageType dmgAux = new DamageType();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.type = 1; //equippable
                    aux.equippableType = false; //weapon
                    aux.damage = reader.GetInt32(3);
                    aux.abilityModID = reader.GetInt32(4); //skippeamos la columna con el nombre
                    dmgAux.id = reader.GetInt32(6);
                    dmgAux.name = reader.GetString(7);
                    aux.dmgTypeID = dmgAux.id;
                    aux.price = reader.GetInt32(8);

                    weapons.Add(aux);
                }

                return weapons;
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

        public static List<Armor> GetArmorsShields()
        {
            List<Armor> armors = new List<Armor>();

            try
            {
                SetProcedure("SP_GetArmorsShields");
                ExecuteRead();
                while (reader.Read())
                {
                    Armor aux = new Armor();
                    DamageType dmgAux = new DamageType();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.type = 1; //equippable
                    aux.equippableType = true; //armor
                    aux.armorType = reader.GetBoolean(3) ? 1 : 0;
                    dmgAux.id = reader.GetInt32(4);
                    dmgAux.name = reader.GetString(5);
                    aux.dmgTypeID = dmgAux.id;
                    aux.armor = reader.GetInt32(6);
                    aux.price = reader.GetInt32(7);

                    armors.Add(aux);
                }

                return armors;
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

        public static List<Consumable> GetConsumables()
        {
            List<Consumable> consumables = new List<Consumable>();

            try
            {
                SetProcedure("SP_GetConsumables");
                ExecuteRead();
                while (reader.Read())
                {
                    Consumable aux = new Consumable();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.type = 2; //consumable
                    aux.effectID = reader.GetInt32(3);
                    aux.amount = reader.GetInt32(4);
                    aux.price = reader.GetInt32(5);

                    consumables.Add(aux);
                }

                return consumables;
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

        public static List<Item> GetItems()
        {
            List<Item> items = new List<Item>();

            List<Weapon> weapons = GetWeapons();
            List<Armor> armors = GetArmorsShields();
            List<Consumable> consumables = GetConsumables();

            foreach (Weapon weapon in weapons)
            {
                items.Add(weapon);
            }
            foreach (Armor armor in armors)
            {
                items.Add(armor);
            }
            foreach (Consumable consumable in consumables)
            {
                items.Add(consumable);
            }
            return items;
        }

        public static bool logear(User user)
        {
            try
            {
                DataAccess.SetQuery("select ID_User, Username, PasswordHash from users where Username = @user AND PasswordHash = @pass");
                DataAccess.command.Parameters.AddWithValue("@user", user.userName);
                DataAccess.command.Parameters.AddWithValue("@pass", user.passwordHash);

                DataAccess.ExecuteRead();
                while (DataAccess.reader.Read())
                {
                    user.id = (int)DataAccess.reader["ID_User"];
                    return true;
                }
                return false;

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

        public static int userRegistration(User user)
        {
            try
            {
                DataAccess.SetProcedure("SP_InsertNewUser");
                DataAccess.command.Parameters.AddWithValue("@UserName", user.userName);
                DataAccess.command.Parameters.AddWithValue("@PasswordHash", user.passwordHash);
                return DataAccess.ExecuteActionScalar();
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
