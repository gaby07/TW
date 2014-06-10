using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Camere : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DayPilotScheduler1.StartDate = DateTime.Now;
    }
}