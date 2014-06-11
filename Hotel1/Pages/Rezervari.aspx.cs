using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Text;

public partial class Pages_Rezervari : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Calendar1.SelectedDate = DateTime.Now;
            Calendar2.SelectedDate = DateTime.Now;
        }
        txtData1.Text = Calendar1.SelectedDate.ToShortDateString();
        txtData2.Text = Calendar2.SelectedDate.ToShortDateString();

        ArrayList camere = Conexiune.CautaCamera(ddlCam.SelectedValue, Calendar1.SelectedDate, Calendar1.SelectedDate);
        int nr = -1;
            Camera cam = Conexiune.CautaOverbooking(ddlCam.SelectedValue, Calendar1.SelectedDate, Calendar1.SelectedDate);
            camere.Add(cam);
        
        foreach (Camera camera in camere)
        {
            nr++;
            Panel CamPanel = new Panel();
            Image image = new Image
            {
                ImageUrl = camera.Imagine,
                CssClass = "CImg"
            };

            Literal literal = new Literal() { Text = "<div>" };
            Literal literal1 = new Literal() { Text = "</div>" };
            Literal literal2 = new Literal() { Text = "<br />" };
            Literal literal3 = new Literal() { Text = "<br />" };
            Literal literal4 = new Literal() { Text = "<br />" };
            Literal literal5 = new Literal() { Text = "<br />" };
            Literal literal6 = new Literal() { Text = "<br />" };

            Label lblTip = new Label
            {
                Text = "Camera " + camera.Tip,
                CssClass = "CTip"
            };
            Label lblVedere = new Label
            {
                Text = "Vedere spre " + camera.Vedere,
                CssClass = "CDescr"
            };
            Label lblAc = new Label
            {
                Text = "Aer conditionat" + camera.AC,
                CssClass = "CDescr"
            };
            Label lblPret = new Label
            {
                Text = string.Format("{0:0.00}", camera.Pret + " RON <br />"),
                CssClass = "CPret"
            };
            Button Rezerva = new Button
            {
                ID = nr.ToString(),
                Text = "Rezerva",
                CssClass = "CBtn"

            };
            Rezerva.Click += delegate(object ss, EventArgs ee)
            {
                int x = Convert.ToInt32(Rezerva.ID);
                Session["Camera"] = (Camera)camere[x];
                Session["Data1"] = Calendar1.SelectedDate;
                Session["Data2"] = Calendar2.SelectedDate;
                if (Session["Camera"] != null) Response.Redirect("~/Pages/Formular.aspx");
            };
            //Rezerva.PostBackUrl = "~/Pages/Formular.aspx";
            CamPanel.Controls.Add(literal);
            CamPanel.Controls.Add(literal5);
            CamPanel.Controls.Add(image);
            CamPanel.Controls.Add(lblTip);
            CamPanel.Controls.Add(literal2);
            CamPanel.Controls.Add(lblVedere);
            CamPanel.Controls.Add(literal3);
            CamPanel.Controls.Add(lblAc);
            CamPanel.Controls.Add(literal4);
            CamPanel.Controls.Add(lblPret);
            CamPanel.Controls.Add(literal5);
            CamPanel.Controls.Add(Rezerva);
            CamPanel.Controls.Add(literal1);

            Panel1.Controls.Add(CamPanel);
        }
       
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtData1.Text = Calendar1.SelectedDate.ToShortDateString();
        Session["Data1"] = Calendar1.SelectedDate;
        Calendar1.Visible = false;
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Calendar2.Visible = true;
    }

    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        txtData2.Text = Calendar2.SelectedDate.ToShortDateString();
        Session["Data2"] = Calendar2.SelectedDate;
        Calendar2.Visible = false;
    }
    protected void txtData1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtData2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddlCam_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}