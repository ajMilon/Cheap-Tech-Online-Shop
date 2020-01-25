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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack){

                if (Session["loginCheck"] != null)
                {
                    Response.Redirect("UserInformation.aspx");

                }
                //Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from Registration where userName='" + userNameLogin.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
            if (temp == 1)
            {
                conn.Open();
                string passQuery = "select password from Registration where userName='" + userNameLogin.Text + "' ";
                SqlCommand passComm = new SqlCommand(passQuery, conn);
                string password1 = passComm.ExecuteScalar().ToString();
                if (password1 == passwordLogin.Text)
                {
                    Session["loginCheck"] = true;
                    Session["userA"] = userNameLogin.Text;
                   


                    Response.Redirect("UserInformation.aspx");

                }
                else
                {
                    Response.Write("<script>alert('PassWord is not Correct.');</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('UserName is Not Correct.');</script>");
            }


                


            

        }

       
    }
}