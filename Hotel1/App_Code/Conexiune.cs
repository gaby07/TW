﻿using System;
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
        string query = string.Format("select c.id, c.tip, c.vedere, c.ac, c.imagine, c.pret from camera c where  c.tip = '{0}' and not exists ( select * from rez r where r.idcam = c.id and (('{1}' >= r.data1 and '{1}' <= r.data2) or ('{2}' >= r.data1 and '{2}' <= r.data2) ));", tipCam, data1, data2);

        try
        {
            con.Open();
            comanda.CommandText = query;
            SqlDataReader reader = comanda.ExecuteReader();

            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string tip = reader.GetString(1);
                string vedere = reader.GetString(2);
                string ac = reader.GetString(3);
                string imagine = reader.GetString(4);
                int pret = reader.GetInt32(5);

                Camera camera = new Camera(id, tip, pret, ac, vedere,imagine);
                list.Add(camera);
            }
        }
        finally
        {
            con.Close();
        }
        return list;
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
            query = string.Format("INSERT INTO rez VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}')",  rez.IdCam, rez.Data1, rez.Data2, rez.CNP, rez.Buletin, rez.Adresa, rez.Telefon, rez.Mail);
            comanda.CommandText = query;
            comanda.ExecuteNonQuery();            
        }
        finally
        {
            con.Close();
        }
        return "Camera a fost rezervata";
    }
 
}