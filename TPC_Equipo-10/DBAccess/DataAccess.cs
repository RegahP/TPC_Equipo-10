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

        public static void DeleteCharacter(int characterID)
        {
            try
            {
                SetProcedure("SP_DeleteCharacter");
                SetParameter("@ID_Character", characterID);
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

        public static Character GetCharacter(int charID)
        {
            Character aux = new Character();

            try
            {
                SetProcedure("SP_GetCharacter");
                SetParameter("@ID_Character", charID);
                ExecuteRead();
                while (reader.Read())
                {
                    aux.id = reader.GetInt32(0);
                    aux.idUser = reader.GetInt32(1);
                    aux.sex = reader.GetBoolean(2);

                    aux.idRace = reader.GetInt32(3);
                    aux.idClass = reader.GetInt32(4);
                    aux.idBackground = reader.GetInt32(5);

                    aux.name = reader.GetString(6);
                    aux.level = reader.GetInt32(7);
                    aux.xp = reader.GetInt32(8);
                    aux.prof = reader.GetInt32(9);

                    aux.luck = reader.GetInt32(10);
                    aux.encounters = reader.GetInt32(11);
                    aux.gameState = reader.GetInt32(12);

                    aux.equippedWeaponID = reader.GetInt32(13);
                    aux.equippedArmorID = reader.GetInt32(14);
                    aux.equippedShieldID = reader.GetInt32(15);

                    aux.armor = reader.GetInt32(16);
                    aux.maxHealth = reader.GetInt32(17);
                    aux.currHealth = reader.GetInt32(18);
                    aux.gold = reader.GetInt32(19);

                    for (int i = 0; i < 6; i++)
                    {
                        RolledAbility auxRolled = new RolledAbility(i, reader.GetInt32(20 + i));
                        aux.abilities.Add(auxRolled);
                    }
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
            return aux;
        }

        public static List<Character> ListCharacters()
        {
            List<Character> listCharacters = new List<Character>();

            try
            {
                SetProcedure("SP_GetCharacters");
                ExecuteRead();
                while (reader.Read())
                {
                    Character aux = new Character();

                    aux.id = reader.GetInt32(0);
                    aux.idUser = reader.GetInt32(1);
                    aux.sex = reader.GetBoolean(2);

                    aux.idRace = reader.GetInt32(3);
                    aux.idClass = reader.GetInt32(4);
                    aux.idBackground = reader.GetInt32(5);

                    aux.name = reader.GetString(6);
                    aux.level = reader.GetInt32(7);
                    aux.xp = reader.GetInt32(8);
                    aux.prof = reader.GetInt32(9);

                    aux.luck = reader.GetInt32(10);
                    aux.encounters = reader.GetInt32(11);
                    aux.gameState = reader.GetInt32(12);

                    aux.equippedWeaponID = reader.GetInt32(13);
                    aux.equippedArmorID = reader.GetInt32(14);
                    aux.equippedShieldID = reader.GetInt32(15);

                    aux.armor = reader.GetInt32(16);
                    aux.maxHealth = reader.GetInt32(17);
                    aux.currHealth = reader.GetInt32(18);
                    aux.gold = reader.GetInt32(19);

                    for (int i = 0; i < 6; i++)
                    {
                        RolledAbility auxRolled = new RolledAbility(i, reader.GetInt32(20 + i));
                        aux.abilities.Add(auxRolled);
                    }

                    listCharacters.Add(aux);
                }
                return listCharacters;

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

        public static List<DamageType> ListDamageTypes()
        {
            List<DamageType> list = new List<DamageType>();

            try
            {
                SetQuery("select * from DamageTypes");
                ExecuteRead();

                while (reader.Read())
                {
                    DamageType aux = new DamageType();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
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

        public static List<Creature> ListCreatures()
        {
            List<Creature> listCreatures = new List<Creature>();

            try
            {
                SetProcedure("SP_GetCreatures");
                ExecuteRead();
                while (reader.Read())
                {
                    Creature aux = new Creature();

                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.rating = reader.GetInt32(3);
                    aux.xp = reader.GetInt32(4);
                    aux.prof = reader.GetInt32(5);
                    aux.armor = reader.GetInt32(6);
                    aux.maxHealth = reader.GetInt32(7);
                    aux.gold = reader.GetInt32(8);

                    for (int i = 0; i < 6; i++)
                    {
                        RolledAbility auxRolled = new RolledAbility(i, reader.GetInt32(9 + i));
                        aux.abilities.Add(auxRolled);
                    }

                    listCreatures.Add(aux);
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

            foreach (Creature creature in listCreatures)
            {
                try
                {
                    SetProcedure("SP_GetCreatureAttacks");
                    SetParameter("@ID_Creature", creature.id);

                    ExecuteRead();
                    while (reader.Read())
                    {
                        creature.attacks.Add(reader.GetInt32(0));
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
            }

            return listCreatures;
        }

        public static List<Attack> ListAttacks()
        {
            List<Attack> list = new List<Attack>();

            try
            {
                SetQuery("select * from Attacks");
                ExecuteRead();

                while (reader.Read())
                {
                    Attack aux = new Attack();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.dmgTypeID = reader.GetInt32(3);
                    aux.damage = reader.GetInt32(4);
                    aux.abilityID = reader.GetInt32(5);
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
                SetParameter("@ID_Race", character.idRace);
                SetParameter("@ID_Class", character.idClass);
                SetParameter("@ID_Background", character.idBackground);
                SetParameter("@_Name", character.name);

                int str = character.abilities[0].rolledScore;
                int dex = character.abilities[1].rolledScore;
                int con = character.abilities[2].rolledScore;
                int nte = character.abilities[3].rolledScore;
                int wis = character.abilities[4].rolledScore;
                int cha = character.abilities[5].rolledScore;

                SetParameter("@Abilities", str + ", " + dex + ", " + con + ", " + nte + ", " + wis +", " + cha);

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


        public static void ModifyCharacter(int modValue, int characterID, int propValue, bool sexValue, string modName)
        {

            try
            {
                SetProcedure("SP_ModifyCharacter");

                if (modValue == 0 && string.IsNullOrWhiteSpace(modName) == true)
                {
                    //llama a SP validando primero el nombre
                    SetParameter("@modValue", modValue);
                    SetParameter("@characterID", characterID);
                    SetParameter("@propValue", propValue);
                    SetParameter("@modGender", sexValue);
                    SetParameter("@modName", modName);  
                }
                else //MODIFICAR QUE SI SE LE MODIFICA LA CLASE, SE LE TIENE QUE CAMBIAR TAMBIEN LA VIDA MAXIMA Y LA ACTUAL.
                {
                    SetParameter("@modValue", modValue);
                    SetParameter("@characterID", characterID);
                    SetParameter("@propValue", propValue);
                    SetParameter("@modGender", sexValue);
                    SetParameter("@modName", modName);
                }

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
                    aux.resTypeID = dmgAux.id;
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

        public static List<Item> GetGenerics()
        {
            List<Item> generics = new List<Item>();

            try
            {
                SetProcedure("SP_GetGenerics");
                ExecuteRead();
                while (reader.Read())
                {
                    Item aux = new Item();
                    aux.id = reader.GetInt32(0);
                    aux.name = reader.GetString(1);
                    aux.desc = reader.GetString(2);
                    aux.price = reader.GetInt32(3);
                    aux.type = 0; //generic

                    generics.Add(aux);
                }

                return generics;
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
            List<Item> generics = GetGenerics();

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
            foreach (Item generic in generics)
            {
                items.Add(generic);
            }
            return items;
        }


        public static bool Login(User user)
        {
            try
            {
                SetQuery("select * from Users where Username = @user AND PasswordHash = @pass");
                SetParameter("@user", user.username);
                SetParameter("@pass", user.passwordHash);

                ExecuteRead();
                while (reader.Read())
                {
                    user.id = (int)reader["ID_User"];
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

        public static int Register(User user)
        {
            try
            {
                SetProcedure("SP_InsertNewUser");
                SetParameter("@UserName", user.username);
                SetParameter("@PasswordHash", user.passwordHash);
                return ExecuteActionScalar();
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
