using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace CheapShop
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void adminLoginButton_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*) from LoginAdmin where UserName='" + userNameLoginAdmin.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();
            if (temp == 1)
            {
                conn.Open();
                string passQuery = "select Password from LoginAdmin where UserName='" + userNameLoginAdmin.Text + "' ";
                SqlCommand passComm = new SqlCommand(passQuery, conn);
                string password1 = passComm.ExecuteScalar().ToString();
                if (password1 == passwordLoginAdmin.Text)
                {

                    


                    Response.Redirect("AdminHome.aspx");

                }
                else
                {
                    Response.Write("<script>alert('Password is Incorrect');</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('Username is Incorrect');</script>");


            }




        }
    }
}