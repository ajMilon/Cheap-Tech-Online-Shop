using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheapShop
{
    public partial class ShowOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {

            // GridView1.DataSource = SqlDataSource1;
            // GridView1.DataBind();
           

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "details")
            {




                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string v = GridView1.Rows[crow].Cells[1].Text;

                Session["value"] = v;
                


               // Label1.Text = "Name of Selected Student is " + v;

                  Response.Redirect("OrderDetails.aspx?id=" + e.CommandArgument.ToString() + "&orderid=" + v);





            }

        }
    }
}