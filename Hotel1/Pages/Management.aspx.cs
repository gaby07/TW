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

        if (!IsPostBack)
        {
            Calendar1.SelectedDate = DateTime.Now;
            Calendar2.SelectedDate = DateTime.Now;
        }
        txtData1.Text = Calendar1.SelectedDate.ToShortDateString();
        txtData2.Text = Calendar2.SelectedDate.ToShortDateString();

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //Camera camera = new Camera(txtTip.Text, (int)Convert.ToInt32(txtPret.Text), txtAC.Text, txtVedere.Text, txtImagine.Text);
       // Conexiune.AdaugaCamera(camera);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Conexiune.AcceptaCerere(GridView3.SelectedRow.Cells[1].Text, GridView3.SelectedRow.Cells[10].Text);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Conexiune.RespingeCerere(GridView3.SelectedRow.Cells[1].Text, GridView3.SelectedRow.Cells[10].Text);
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
    protected void ddlRez_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Raport_Click(object sender, EventArgs e)
    {
        if (ddlRez.SelectedValue != "toate")
        {
            lblRez.Text = "Numar rezervari: " + Conexiune.NrRezervari(Convert.ToInt32(ddlCam.SelectedValue), ddlRez.SelectedValue, Calendar1.SelectedDate, Calendar2.SelectedDate).ToString();
            LblNopti.Text = "Numar nopti: " + Conexiune.NrNopti(Convert.ToInt32(ddlCam.SelectedValue), ddlRez.SelectedValue, Calendar1.SelectedDate, Calendar2.SelectedDate).ToString();
        }
        else
        {
            lblRez.Text = "Numar rezervari: " + "<table><tr><td>anulate: </td><td>" + Conexiune.NrRezervari(Convert.ToInt32(ddlCam.SelectedValue), "anulata", Calendar1.SelectedDate, Calendar2.SelectedDate).ToString() + "</td></tr>"
                                                     + "<tr><td>onorate: </td><td>" + Conexiune.NrRezervari(Convert.ToInt32(ddlCam.SelectedValue), "onorata", Calendar1.SelectedDate, Calendar2.SelectedDate).ToString() + "</td></tr>"
                                                     + "<tr><td>receptie: </td><td>" + Conexiune.NrRezervari(Convert.ToInt32(ddlCam.SelectedValue), "receptie", Calendar1.SelectedDate, Calendar2.SelectedDate).ToString() + "</td></tr>"
                                                     + "<tr><td>rezervari: </td><td>" + Conexiune.NrRezervari(Convert.ToInt32(ddlCam.SelectedValue), "rezervare", Calendar1.SelectedDate, Calendar2.SelectedDate).ToString() + "</td></tr></table>";

            LblNopti.Text = "Numar nopti: " + "<table><tr><td>anulate: </td><td>" + Conexiune.NrNopti(Convert.ToInt32(ddlCam.SelectedValue), "anulata", Calendar1.SelectedDate, Calendar2.SelectedDate).ToString() + "</td></tr>"
                                                   + "<tr><td>onorate: </td><td>" + Conexiune.NrNopti(Convert.ToInt32(ddlCam.SelectedValue), "onorata", Calendar1.SelectedDate, Calendar2.SelectedDate).ToString() + "</td></tr>"
                                                   + "<tr><td>receptie: </td><td>" + Conexiune.NrNopti(Convert.ToInt32(ddlCam.SelectedValue), "receptie", Calendar1.SelectedDate, Calendar2.SelectedDate).ToString() + "</td></tr>"
                                                   + "<tr><td>rezervari: </td><td>" + Conexiune.NrNopti(Convert.ToInt32(ddlCam.SelectedValue), "rezervare", Calendar1.SelectedDate, Calendar2.SelectedDate).ToString() + "</td></tr></table>";
        }
    }
    
}