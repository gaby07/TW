using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["type"] != "admin")
        {
            Response.Redirect("~/Pages/Logare.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Camera camera = new Camera(txtTip.Text, (int)Convert.ToInt32(txtPret.Text), txtAC.Text, txtVedere.Text, txtImagine.Text);
        Conexiune.AdaugaCamera(camera);
    }
}