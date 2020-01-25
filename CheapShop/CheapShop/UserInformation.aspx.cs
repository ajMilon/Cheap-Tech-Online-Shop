using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CheapShop
{
    public partial class UserInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            Response.Write("<script>alert('Login Successful');</script>");

            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
                conn.Open();

                SqlDataAdapter ab = new SqlDataAdapter("select * from Registration where userName ='" + Session["userA"] + "'", conn);
                DataTable ss = new DataTable();
                ab.Fill(ss);

                name_text.Text =ss.Rows[0][1].ToString();
                age_text.Text = ss.Rows[0][2].ToString();

                contactNo_text.Text = ss.Rows[0][3].ToString();

                email_text.Text = ss.Rows[0][4].ToString();

                address_text.Text = ss.Rows[0][5].ToString();


                conn.Close();



            }

        }

        protected void logOutButton_Click(object sender, EventArgs e)
        {
            Session["loginCheck"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void address_text_TextChanged(object sender, EventArgs e)
        {

        }
    }
}