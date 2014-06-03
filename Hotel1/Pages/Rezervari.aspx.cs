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

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtData1.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Calendar2.Visible = true;
    }

    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        txtData2.Text = Calendar2.SelectedDate.ToShortDateString();
        Calendar2.Visible = false;
    }
    protected void btnCauta_Click(object sender, EventArgs e)
    {
        ArrayList camere = Conexiune.CautaCamera(ddlCam.SelectedValue, Calendar1.SelectedDate, Calendar2.SelectedDate);
        //StringBuilder sb = new StringBuilder();
        List<Button> butoane = new List<Button>();
        int nr = 0;

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
                ID = Convert.ToString(nr),
                Text = "Rezerva",
                CssClass = "CBtn"
            };
           /* Rezerva.Click += new System.EventHandler(this.Rezerva_Click);
            EventArgs ee = new EventArgs();
            Rezerva.OnClientClick = "Rezerva_Click(Rezerva, null)";*/

           /* Rezerva.Click += delegate(object ss, EventArgs ee)
            { 
                Session["idcam"] = camera.Id;
                Session["data1"] = txtData1.Text;
                Session["data2"] = txtData2.Text;

                Response.Redirect("~/Pages/Formular.aspx"); }; */


            //Rezerva.Click += (s, ee) => { Response.Redirect("~/Pages/Home.aspx"); };

           //Rezerva.Click += new EventHandler(Rezerva_Click);
            Rezerva_Click(sender, e);
            butoane.Add(Rezerva);

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


    protected void Rezerva_Click(object sender, EventArgs e)
    {
       // Session["idcam"] = ;
        Session["data1"] = txtData1.Text;
        Session["data2"] = txtData2.Text;

        Response.Redirect("~/Pages/Formular.aspx");
    }
}