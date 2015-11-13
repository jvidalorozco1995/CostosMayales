using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebCostosPresupuestos
{
    public class Utilidades
    {

        private OdbcConnection Con1; // Obj Conexion
        private OdbcConnection Con2;
        private OdbcConnection Con3;
        private OdbcConnection Con4;
        private OdbcConnection Con5;
           public Utilidades()

             {
               
                    /* Para trabajar con el servidor SQLExpress de la maquina */
                   string sConnectionString1 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                   string sConnectionString2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                   string sConnectionString3 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                   string sConnectionString4 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                   string sConnectionString5 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                   //OdbcConnection conexSql = new OdbcConnection(sConnectionString);

                   //
                    /* Para trabajar con un servidor remoto Ya sea una Base de datos Remota o en Caso de WEB SITE cuando la pongamos en el Host */

                    /* Necesitamos la IP del Servidor de BD, el puerto generalmente es 1533, Usuario y Password lo proporciona el Hostring */

                    //DtsConection = “Data Source=72.17.135.40,1533; Database=NOMBRE_BD; User ID=USUARIO; Password=PASSWORD;”;

                   Con1 = new OdbcConnection(sConnectionString1);
                   Con2 = new OdbcConnection(sConnectionString2);
                   Con3 = new OdbcConnection(sConnectionString3);
                   Con4 = new OdbcConnection(sConnectionString4);
                   Con5 = new OdbcConnection(sConnectionString5);

             }

                    public void Abrir1() // Metodo para Abrir la Conexion

                    {

                        Con1.Open();
                    
                    }

                    public void Cerrar1() // Metodo para Cerrar la Conexion

                    {
                        Con1.Close();
                    }



                    public void Abrir2() // Metodo para Abrir la Conexion
                    {
                        Con2.Open();
                    }

                    public void Cerrar2() // Metodo para Cerrar la Conexion
                    {
                        Con2.Close();
                    }
                    public void Abrir3() // Metodo para Abrir la Conexion
                    {
                        Con3.Open();
                    }

                    public void Cerrar3() // Metodo para Cerrar la Conexion
                    {

                        Con3.Close();
                    }


                    public void Abrir4() // Metodo para Abrir la Conexion
                    {
                        Con4.Open();
                    }

                    public void Cerrar4() // Metodo para Cerrar la Conexion
                    {
                        Con4.Close();
                    }

        

                    public void Abrir5() // Metodo para Abrir la Conexion
                    {

                        Con5.Open();

                    }

                    public void Cerrar5() // Metodo para Cerrar la Conexion
                    {

                        Con5.Close();

                    }

                    public DataTable VerTabla1(string Comando, string Tabla) // Metodo para Ejecutar Comandos
                    {

                        OdbcDataAdapter CMD = new OdbcDataAdapter(Comando, Con1); // Creamos un DataAdapter con el Comando y la Conexion

                        DataTable DS = new DataTable(); // Creamos el DataSet que Devolvera el Metodo

                        CMD.Fill(DS); // Ejecutamos el Comando en la Tabla

                        return DS; // Regresamos el DataSet

                    }

                    public DataTable VerTabla2(string Comando, string Tabla) // Metodo para Ejecutar Comandos
                    {

                        OdbcDataAdapter CMD = new OdbcDataAdapter(Comando, Con2); // Creamos un DataAdapter con el Comando y la Conexion

                        DataTable DS = new DataTable(); // Creamos el DataSet que Devolvera el Metodo

                        CMD.Fill(DS); // Ejecutamos el Comando en la Tabla

                        return DS; // Regresamos el DataSet

                    }
                    public DataTable VerTabla3(string Comando, string Tabla) // Metodo para Ejecutar Comandos
                    {

                        OdbcDataAdapter CMD = new OdbcDataAdapter(Comando, Con3); // Creamos un DataAdapter con el Comando y la Conexion

                        DataTable DS = new DataTable(); // Creamos el DataSet que Devolvera el Metodo

                        CMD.Fill(DS); // Ejecutamos el Comando en la Tabla

                        return DS; // Regresamos el DataSet

                    }
                    public DataTable VerTabla4(string Comando, string Tabla) // Metodo para Ejecutar Comandos
                    {

                        OdbcDataAdapter CMD = new OdbcDataAdapter(Comando, Con4); // Creamos un DataAdapter con el Comando y la Conexion

                        DataTable DS = new DataTable(); // Creamos el DataSet que Devolvera el Metodo

                        CMD.Fill(DS); // Ejecutamos el Comando en la Tabla

                        return DS; // Regresamos el DataSet

                    }
                    public DataTable VerTabla5(string Comando, string Tabla) // Metodo para Ejecutar Comandos
                    {

                        OdbcDataAdapter CMD = new OdbcDataAdapter(Comando, Con5); // Creamos un DataAdapter con el Comando y la Conexion

                        DataTable DS = new DataTable(); // Creamos el DataSet que Devolvera el Metodo

                        CMD.Fill(DS); // Ejecutamos el Comando en la Tabla

                        return DS; // Regresamos el DataSet

                    }


                    public DataTable DatosCopiar(string Comando)
                    {
                        string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
                        SqlConnection conn = new SqlConnection(sConnectionString);
                        conn.Open();
                        
                        SqlCommand cmd = new SqlCommand(Comando, conn);

                        DataTable dt = new DataTable();
                        dt.Load(cmd.ExecuteReader());
                        return dt;
                    }

                    } // Fin de la Clase*/

                   // Ahora que Ya tenemos Nuestra Clase Conexion, lo unico que necesitamos para Conectarnos a una Base de Datos o Ejecuar un Comando, etc. es:

                   // Crear un Objeto del Tipo Conexion.

                   
     

    }

