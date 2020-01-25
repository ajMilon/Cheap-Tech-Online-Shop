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
    public partial class Admin : System.Web.UI.Page
    {
       
        string a, b;

      
      
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void backToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

        protected void upload_Click(object sender, EventArgs e)
        {
            a = Class1.GetRandomPassword(10).ToString();

            f1.SaveAs(Request.PhysicalApplicationPath + "Images/" + a + f1.FileName.ToString());
            b = "Images/" + a + f1.FileName.ToString();


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into Product(product_name,product_desc,product_price,poduct_cat,product_qty,product_image) values (@name,@des,@price,@cat,@qty,@image)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
            com.Parameters.AddWithValue("@name", t1.Text);
            com.Parameters.AddWithValue("@des", t2.Text);
            com.Parameters.AddWithValue("@price", Convert.ToInt32(t3.Text));
            com.Parameters.AddWithValue("@cat", t4.Text);
            com.Parameters.AddWithValue("@qty", Convert.ToInt32(t5.Text));
            com.Parameters.AddWithValue("@image",b.ToString());


            com.ExecuteNonQuery();
            Response.Write("Registration is successfull");

        


            conn.Close();




           
        }
    }
}