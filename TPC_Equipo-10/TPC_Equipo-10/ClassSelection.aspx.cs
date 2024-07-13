﻿using DBAccess;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_10
{
    public partial class ClassSelection : Page
    {
        public List<Class> classList = new List<Class>();

        public Character character = new Character();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                character = (Character)Session["character"];

                classList = DataAccess.ListClasses();

                rptClass.DataSource = classList;
                rptClass.DataBind();
            }
        }

        protected void confirmClass_btn_Click(object sender, EventArgs e)
        {
            int classId = int.Parse(((LinkButton)sender).CommandArgument);
            foreach (Class clas in classList)
            {
                if (clas.id == classId)
                {
                    character.idClass = clas.id;
                    Session.Add("character", character);
                    Response.Redirect("backgroundSelection.aspx", false);
                }


            }
        }


    }
}