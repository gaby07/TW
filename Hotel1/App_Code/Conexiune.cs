using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using System.Net.Mail;
using System.Net;


public class Conexiune
{
    private static SqlConnection con;
    private static SqlCommand comanda;

	public Conexiune()
	{
	}

    public static ArrayList CautaCamera(string tipCam, DateTime data1, DateTime data2, string prt)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);

        ArrayList list = new ArrayList();
        string query;
        if (prt == "orice")
            query = string.Format("select * from camere c where  c.tip = '{0}' and (c.Nr+c.NrOv) >  ( select count(r.id) from rezervari r where r.idcam = c.id and (('{1}' >= r.data1 and '{1}' <= r.data2) or ('{2}' >= r.data1 and '{2}' <= r.data2)) and Stare <> 'anulata' and Stare <> 'cerere');", tipCam, data1, data2);
        else
        {
            string[] p = prt.Split('|');
            query = string.Format("select * from camere c where  c.tip = '{0}' and pret >= '{1}' and pret <= '{2}' and (c.Nr+c.NrOv) >  ( select count(r.id) from rezervari r where r.idcam = c.id and (('{3}' >= r.data1 and '{3}' <= r.data2) or ('{4}' >= r.data1 and '{4}' <= r.data2)) and Stare <> 'anulata' and Stare <> 'cerere');", tipCam, Convert.ToInt32(p[0]), Convert.ToInt32(p[1]), data1, data2);
        }
        try
        {
            con.Open();
            comanda.CommandText = query;
            SqlDataReader reader = comanda.ExecuteReader();

            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string tip = reader.GetString(1);
                string detalii = reader.GetString(2);
                string facilitati = reader.GetString(3);
                string vedere = reader.GetString(4);
                string imagini = reader.GetString(5);
                int pret = reader.GetInt32(6);
                int nr = reader.GetInt32(7);
                int nrO = reader.GetInt32(8);

                Camera camera = new Camera(id, tip, detalii, facilitati, vedere, imagini, pret, nr, nrO);
                list.Add(camera);
            }
        }
        finally
        {
            con.Close();
        }
        return list;
    }

    public static void AdaugaCamera (Camera camera) {
        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);
        try
        {
            con.Open();
            string query = string.Format("INSERT INTO camere VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}')",camera.Tip, camera.Detalii, camera.Facilitati, camera.Vedere, camera.Imagini, camera.Pret, camera.Nr, camera.NrO);
            comanda.CommandText = query;
            comanda.ExecuteNonQuery();
            
        }
        finally
        {
            con.Close();
        }
    }

    public static Utilizator Logare(string nume, string parola)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);

        string query = string.Format("SELECT COUNT(*) FROM utilizatori WHERE nume = '{0}'", nume);
        comanda.CommandText = query;
        try
        {
            con.Open();
            int amountOfUsers = (int)comanda.ExecuteScalar();
            if (amountOfUsers > 0)
            {
                query = string.Format("SELECT parola FROM utilizatori WHERE nume = '{0}'", nume);
                comanda.CommandText = query;
                string dbPassword = comanda.ExecuteScalar().ToString();

                if (dbPassword == parola)
                {
                    query = string.Format("SELECT email, tip FROM utilizatori WHERE nume = '{0}'", nume);
                    comanda.CommandText = query;
                    SqlDataReader reader = comanda.ExecuteReader();
                    Utilizator utliz = null;

                    while (reader.Read())
                    {
                        string email = reader.GetString(0);
                        string type = reader.GetString(1);

                        utliz = new Utilizator(nume, parola, email, type);
                    }

                    return utliz;
                }
                else
                {
                    //pass do not match
                    return null;
                }
            }
            else
            {
                //user exists
                return null;
            }

        }
        finally
        {
            con.Close();
        }

    }

    public static string Inregistrare(Utilizator utiliz)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);

        string query = string.Format("SELECT COUNT(*) FROM utilizatori WHERE nume = '{0}'", utiliz.Nume);
        comanda.CommandText = query;

        try
        {
            con.Open();
            int amountOfUsers = (int)comanda.ExecuteScalar();
            if (amountOfUsers < 1)
            {
                query = string.Format("INSERT INTO utilizatori VALUES ('{0}', '{1}', '{2}', '{3}')", utiliz.Nume, utiliz.Parola, utiliz.Email, utiliz.Tip);
                comanda.CommandText = query;
                comanda.ExecuteNonQuery();
                return "Inregistrare reusita";
            }
            else
            {
                return "Exista un utilizator cu acest nume";
            }
        }
        finally
        {
            con.Close();
        }
    }

    public static string Rezerva(Rezervare rez) 
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);
        string query;

        try
        {
            con.Open();
            query = string.Format("INSERT INTO Rezervari VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', 'cerere')",  rez.IdCam, rez.Data1, rez.Data2, rez.Nume, rez.CNP, rez.Buletin, rez.Adresa, rez.Telefon, rez.Mail);
            comanda.CommandText = query;
            comanda.ExecuteNonQuery();            
        }
        finally
        {
            con.Close();
        }
        return "Veti primi un e-mail in care sunteti anuntati daca rezervarea a fost aprobata/respinsa.";
    }

    public static void AcceptaCerere(string id, string mail)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);
        string query;

        try
        {
            con.Open();
            query = string.Format("UPDATE rezervari SET stare = 'rezervare' WHERE id = '{0}'", Convert.ToInt32(id));
            comanda.CommandText = query;
            comanda.ExecuteNonQuery();

            TrimiteMail("Cererea dumneavoastra de rezervare a fost acceptata.", mail);
 
        }
        finally
        {
            con.Close();
        }
    }

    public static void RespingeCerere(string id, string mail)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);
        string query;

        try
        {
            con.Open();
            query = string.Format("DELETE FROM rezervari WHERE id = '{0}'", Convert.ToInt32(id));
            comanda.CommandText = query;
            comanda.ExecuteNonQuery();

            TrimiteMail("Cererea dumneavoastra de rezervare a fost respinsa.", mail);

        }
        finally
        {
            con.Close();
        }
    }

    public static void TrimiteMail(string msgg, string to)
    {
        System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage("maria.gaby1991@gmail.com", to, "Rezervari", msgg);

        System.Net.NetworkCredential cred = new System.Net.NetworkCredential("maria.gaby1991@gmail.com", "Pasion07");
        System.Net.Mail.SmtpClient mailClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
        mailClient.EnableSsl = true;
        mailClient.UseDefaultCredentials = false;
        mailClient.Credentials = cred;
        mailClient.Send(msg); 
    }

    public static int NrRezervari(int id, string stare, DateTime data1, DateTime data2)
    {
        int nr = 0;

        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);

        ArrayList list = new ArrayList();
        string query = string.Format("select COUNT(id) from [Rezervari].[dbo].[Rezervari] where IdCam = '{0}' and Stare = '{3}' and (Data1 > '{1}' and Data1 < '{2}') and (Data2 > '{1}' and Data2 < '{2}')", id, data1, data2, stare);

        try
        {
            con.Open();
            comanda.CommandText = query;
            SqlDataReader reader = comanda.ExecuteReader();

            while (reader.Read())
            {
                nr = reader.GetInt32(0);
            }
        }
        finally
        {
            con.Close();
        }
        return nr;
    }

    public static int NrNopti(int id, string stare, DateTime data1, DateTime data2)
    {
        int nr = 0;

        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);

        ArrayList list = new ArrayList();
        string query = string.Format("select Data1, Data2 from [Rezervari].[dbo].[Rezervari] where IdCam = '{0}' and Stare = '{3}' and (Data1 > '{1}' and Data1 < '{2}') and (Data2 > '{1}' and Data2 < '{2}')", id, data1, data2, stare);

        try
        {
            con.Open();
            comanda.CommandText = query;
            SqlDataReader reader = comanda.ExecuteReader();

            while (reader.Read())
            {
                DateTime d1 = reader.GetDateTime(0);
                DateTime d2 = reader.GetDateTime(1);
                nr += (int)(d2 - d1).TotalDays;
            }
        }
        finally
        {
            con.Close();
        }
        return nr;
    }

    public static int NrZi(int id, string stare, DateTime data)
    {
        int nr = 0;

        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);

        ArrayList list = new ArrayList();
        string query = string.Format("select count(id) from [Rezervari].[dbo].[Rezervari] where IdCam = '{0}' and Stare = '{2}' and (Data1 >= '{1}' and Data2 <= '{1}')", id, data, stare);

        try
        {
            con.Open();
            comanda.CommandText = query;
            SqlDataReader reader = comanda.ExecuteReader();

            while (reader.Read())
            {
                nr = reader.GetInt32(0);
            }
        }
        finally
        {
            con.Close();
        }
        return nr;
    }
}