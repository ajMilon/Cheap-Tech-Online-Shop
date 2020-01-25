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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("Id");
                dt.Columns.Add("product_name");
                dt.Columns.Add("product_price");
                dt.Columns.Add("quantity");
                dt.Columns.Add("product_image");
                dt.Columns.Add("totalprice");
                //   dt.Columns.Add("cost");
                //  dt.Columns.Add("totalcost");

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
                        //["quantity"] = ds.Tables[0].Rows[0]["quantity"].ToString();

                       dr["quantity"] = Request.QueryString["quantity"];


                    int price = Convert.ToInt16(ds.Tables[0].Rows[0]["product_price"].ToString());

//int quantity = Convert.ToInt16(ds.Tables[0].Rows[0]["quantity"].ToString());

                           int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;


                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["buyitems"] = dt;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("Cart.aspx");
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

                        dr["quantity"] = Request.QueryString["quantity"];
                        
                        int price = Convert.ToInt16(ds.Tables[0].Rows[0]["product_price"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                       Response.Redirect("Cart.aspx");

                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

                    }

                }

            }


           


        }

       public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];


            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //Label1.Text = "Item Has Been Deleted From Shopping Cart";
                    break;

                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }

            Session["buyitems"] = dt;
            Response.Redirect("Cart.aspx");
        }

        protected void checkOut_Click(object sender, EventArgs e)
        {
            if (Session["loginCheck"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("PlaceOrder.aspx");
            }
        }
    }
}
