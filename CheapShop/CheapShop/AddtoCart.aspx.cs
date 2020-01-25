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
    public partial class AddtoCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["loginCheck"] != null)
                {
                    DataTable dt = new DataTable();
                    DataRow dr;
                    dt.Columns.Add("sno");
                    dt.Columns.Add("Id");
                    dt.Columns.Add("product_name");
                    dt.Columns.Add("product_price");
                    dt.Columns.Add("product_image");
                    //   dt.Columns.Add("cost");
                    //    dt.Columns.Add("totalcost");

                    if (Request.QueryString["id"] != null)
                    {
                        if (Session["Buyitems"] == null)
                        {

                            dr = dt.NewRow();
                            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
                            scon.Open();
                            String myquery = "select * from Product where Id=" + Request.QueryString["id"];
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = myquery;
                            cmd.Connection = scon;
                            SqlDataAdapter da = new SqlDataAdapter();
                            da.SelectCommand = cmd;
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            dr["sno"] = 1;
                            dr["Id"] = ds.Tables[0].Rows[0]["Id"].ToString();
                            dr["product_name"] = ds.Tables[0].Rows[0]["product_name"].ToString();
                            dr["product_image"] = ds.Tables[0].Rows[0]["product_image"].ToString();
                            dr["product_price"] = ds.Tables[0].Rows[0]["product_price"].ToString();
                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["buyitems"] = dt;
                        }
                        else
                        {

                            dt = (DataTable)Session["buyitems"];
                            int sr;
                            sr = dt.Rows.Count;

                            dr = dt.NewRow();
                            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
                            scon.Open();

                            String myquery = "select * from Product where Id=" + Request.QueryString["id"];
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = myquery;
                            cmd.Connection = scon;
                            SqlDataAdapter da = new SqlDataAdapter();
                            da.SelectCommand = cmd;
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            dr["sno"] = sr + 1;
                            dr["Id"] = ds.Tables[0].Rows[0]["Id"].ToString();
                            dr["product_name"] = ds.Tables[0].Rows[0]["product_name"].ToString();
                            dr["product_image"] = ds.Tables[0].Rows[0]["product_image"].ToString();
                            dr["product_price"] = ds.Tables[0].Rows[0]["product_price"].ToString();
                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["buyitems"] = dt;

                        }
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                    }

                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}