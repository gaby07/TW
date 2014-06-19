using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;


public class Conexiune
{
    private static SqlConnection con;
    private static SqlCommand comanda;

	public Conexiune()
	{
	}

    public static ArrayList CautaCamera(string tipCam, DateTime data1, DateTime data2)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);

        ArrayList list = new ArrayList();
        string query = string.Format("select * from camere c where  c.tip = '{0}' and not exists ( select * from rezervari r where r.idcam = c.id and (('{1}' >= r.data1 and '{1}' <= r.data2) or ('{2}' >= r.data1 and '{2}' <= r.data2) ));", tipCam, data1, data2);

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

/*    public static Camera CautaOverbooking(string tipCam, DateTime data1, DateTime data2)
    {
        int id = 0;
        switch (tipCam)
        {
            case "single": id = 1;  break;
            case "dubla": id = 3;  break;
            case "apartament": id = 6; break;
        }


        string connectionString = ConfigurationManager.ConnectionStrings["Rezervari-Conexiune"].ConnectionString;
        con = new SqlConnection(connectionString);
        comanda = new SqlCommand("", con);

        ArrayList list = new ArrayList();
        string query = string.Format(" select count(id) from rez r where r.idcam = '{0}' and (('{1}' >= r.data1 and '{1}' <= r.data2) or ('{2}' >= r.data1 and '{2}' <= r.data2) );", id, data1, data2);
        int nr = 0;
        Camera cam = new Camera();
        try
        {
            con.Open();
            comanda.CommandText = query;
            SqlDataReader reader = comanda.ExecuteReader();
            while (reader.Read()) {
                nr = reader.GetInt32(0);
            }
            reader.Close();
            if (nr == 1)
            {
                query = string.Format(" select * from camere where id = '{0}'", id);
                comanda.CommandText = query;
                reader = comanda.ExecuteReader();

                while (reader.Read())
                {
                    id = reader.GetInt32(0);
                    string tip = reader.GetString(1);
                    int pret = reader.GetInt32(2);
                    string vedere = reader.GetString(3);
                    string ac = reader.GetString(4);
                    string imagine = reader.GetString(5);

                    cam = new Camera(id, tip, pret, ac, vedere, imagine);
                }
            }
        }
        finally
        {
            con.Close();
        }
        if (nr == 1) return cam;
        else return null;
    }
*/
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
            query = string.Format("INSERT INTO Rezervari VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', null)",  rez.IdCam, rez.Data1, rez.Data2, rez.Nume, rez.CNP, rez.Buletin, rez.Adresa, rez.Telefon, rez.Mail);
            comanda.CommandText = query;
            comanda.ExecuteNonQuery();            
        }
        finally
        {
            con.Close();
        }
        return "Veti primi un e-mail in care sunteti anuntati daca rezervarea a fost aprobata/respinsa.";
    }
 
}