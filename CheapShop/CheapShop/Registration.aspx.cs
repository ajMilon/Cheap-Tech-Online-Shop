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
    public partial class Registration : System.Web.UI.Page
    {
        int temp;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
           if (IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from Registration where userName='" + userName_text.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                 temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Username Alreade Exists')</script>");

                }


                conn.Close();


            }
            



        }

        protected void submit_button_Click(object sender, EventArgs e)
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
            conn.Open();
            if (temp != 1)
            {
                string insertQuery = "insert into Registration(name,age,contactNo,email,address,userName,password) values (@name,@age,@contactNo,@email,@address,@userName,@password)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@name", name_text.Text);
                com.Parameters.AddWithValue("@age", Convert.ToInt32(age_text.Text));
                com.Parameters.AddWithValue("@contactNo", contactNo_text.Text);
                com.Parameters.AddWithValue("@email", email_text.Text);
                com.Parameters.AddWithValue("@address", address_text.Text);
                com.Parameters.AddWithValue("@userName", userName_text.Text);
                com.Parameters.AddWithValue("@password", password_text.Text);


                com.ExecuteNonQuery();
                Response.Write("Registration is successfull");





                // conn.Close();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Login Successful')</script>");
                Response.Redirect("Login.aspx");
            }
            conn.Close();
        }
    }
}