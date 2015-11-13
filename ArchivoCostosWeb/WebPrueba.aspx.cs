using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.IO;

using Excel = Microsoft.Office.Interop.Excel;

using System.Configuration;
using System.Drawing;

namespace ArchivoCostosWeb
{
    public partial class WebPrueba : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        private void ExportDataSetToExcel(DataTable dt,DataTable dt2)
        {




            // Load Excel application
            Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();

            // Create empty workbook
            excel.Workbooks.Add();

            // Create Worksheet from active sheet
            Microsoft.Office.Interop.Excel._Worksheet workSheet = excel.ActiveSheet;
            Microsoft.Office.Interop.Excel.Worksheet workSheet2 = (Microsoft.Office.Interop.Excel.Worksheet)excel.Sheets.Add();

            // I created Application and Worksheet objects before try/catch,
            // so that i can close them in finnaly block.
            // It's IMPORTANT to release these COM objects!!
            try
            {
                // ------------------------------------------------
                // Creation of header cells
                // ------------------------------------------------
                  

                    workSheet.Cells[1, "A"]="origen";
                    workSheet.Cells[1, "B"]="column1";
                    workSheet.Cells[1, "C"]="referencia1";
                    workSheet.Cells[1, "D"]="referencia2";
                    workSheet.Cells[1, "E"]="referencia3";
                    workSheet.Cells[1, "F"]="presupuesto";
                    workSheet.Cells[1, "G"]="codcapi";
                    workSheet.Cells[1, "H"]="capitulo";
                    workSheet.Cells[1, "I"]="codunit";
                    workSheet.Cells[1, "J"]="unitario";
                    workSheet.Cells[1, "K"]="undunita";
                    workSheet.Cells[1, "L"]="cantxppto";
                    workSheet.Cells[1, "M"]="codinsu";
                    workSheet.Cells[1, "N"]="insutipo";
                    workSheet.Cells[1, "O"]="insumo";
                    workSheet.Cells[1, "P"]="unidinsu";
                    workSheet.Cells[1, "Q"]="ctrlinven";
                    workSheet.Cells[1, "R"]="validación";
                    workSheet.Cells[1, "S"]="precioppto";
                    workSheet.Cells[1, "T"]="consumounitario";
                    workSheet.Cells[1, "U"]="consumototal";
                    workSheet.Cells[1, "V"]="adic";
                    workSheet.Cells[1, "W"]="precioaut";
                    workSheet.Cells[1, "X"]="PrecioCompra";
                    workSheet.Cells[1, "Y"]="PrecioEntrado";
                    workSheet.Cells[1, "Z"]="Ped";
                    workSheet.Cells[1, "AA"]="aprob";
                    workSheet.Cells[1, "AB"]="comp";
                    workSheet.Cells[1, "AC"]="ent";
                    workSheet.Cells[1, "AD"]="sali";
                    workSheet.Cells[1, "AE"]="traslado";
                    workSheet.Cells[1, "AF"]="xcomp";
                    workSheet.Cells[1, "AG"]="xent";
                    workSheet.Cells[1, "AH"]="saldoxunit";
                    workSheet.Cells[1, "AI"]="saldoxppto";
                    workSheet.Cells[1, "AJ"]="vlrEnt";
                    workSheet.Cells[1, "AK"]="vlrEnttraslado";
                    workSheet.Cells[1, "AL"]="VlrCompradoxent";
                    workSheet.Cells[1, "AM"]="vlrxcomp";
                    workSheet.Cells[1, "AN"]="VlrTraslado";
                    workSheet.Cells[1, "AO"]="vlrproy";
                    workSheet.Cells[1, "AP"]="Vlrini";
                    workSheet.Cells[1, "AQ"]="vlrejec";

                    workSheet2.Cells[1, "A"] = "referencia1";
                
                // ------------------------------------------------
                // Populate sheet with some real data from "cars" list
                // ------------------------------------------------
                int row = 2; // start row (in row 1 are header cells)
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                   

                    workSheet.Cells[row, "A"] =  dt.Rows[i].Field<string>("origen");
                    workSheet.Cells[row, "B"] =  dt.Rows[i].Field<DateTime>("column1");
                    workSheet.Cells[row, "C"] =  dt.Rows[i].Field<string>("referencia1");
                    workSheet.Cells[row, "D"] =  dt.Rows[i].Field<string>("referencia2");
                    workSheet.Cells[row, "E"] =  dt.Rows[i].Field<string>("referencia3");
                   /* workSheet.Cells[row, "F"] =  dt.Rows[i].Field<string>("presupuesto");
                    workSheet.Cells[row, "G"] =  dt.Rows[i].Field<string>("codcapi");
                    workSheet.Cells[row, "H"] =  dt.Rows[i].Field<string>("capitulo");
                    workSheet.Cells[row, "I"] =  dt.Rows[i].Field<string>("codunit");
                    workSheet.Cells[row, "J"] =  dt.Rows[i].Field<string>("unitario");
                    workSheet.Cells[row, "K"] =  dt.Rows[i].Field<string>("undunita");
                    workSheet.Cells[row, "L"] =  dt.Rows[i].Field<decimal>("cantxppto");
                    workSheet.Cells[row, "M"] =  dt.Rows[i].Field<string>("codinsu");
                    workSheet.Cells[row, "N"] =  dt.Rows[i].Field<string>("insutipo");
                   // workSheet.Cells[row, "O"] = dt.Rows[i].Field<string>("Proyecto");
                    workSheet.Cells[row, "P"] =  dt.Rows[i].Field<string>("insumo");
                    workSheet.Cells[row, "Q"] =  dt.Rows[i].Field<string>("unidinsu");
                    workSheet.Cells[row, "R"] =  dt.Rows[i].Field<string>("ctrlinven");
                    workSheet.Cells[row, "S"] =  dt.Rows[i].Field<string>("validación");
                    workSheet.Cells[row, "T"] =  dt.Rows[i].Field<decimal>("precioppto");
                    workSheet.Cells[row, "U"] =  dt.Rows[i].Field<decimal>("consumounitario");
                    workSheet.Cells[row, "V"] =  dt.Rows[i].Field<decimal>("consumototal");
                    workSheet.Cells[row, "W"] =  dt.Rows[i].Field<decimal>("precioaut");
                    workSheet.Cells[row, "X"] =  dt.Rows[i].Field<decimal>("PrecioCompra");
                    workSheet.Cells[row, "Y"] =  dt.Rows[i].Field<decimal>("PrecioEntrado");
                    workSheet.Cells[row, "Z"] =  dt.Rows[i].Field<decimal>("Ped");
                    workSheet.Cells[row, "AA"] = dt.Rows[i].Field<decimal>("aprob");
                    workSheet.Cells[row, "AB"] = dt.Rows[i].Field<decimal>("comp");
                    workSheet.Cells[row, "AC"] = dt.Rows[i].Field<decimal>("traslado");
                    workSheet.Cells[row, "AD"] = dt.Rows[i].Field<decimal>("sali");
                    workSheet.Cells[row, "AE"] = dt.Rows[i].Field<decimal>("xcomp");
                    workSheet.Cells[row, "AF"] = dt.Rows[i].Field<decimal>("xent");
                    workSheet.Cells[row, "AG"] = dt.Rows[i].Field<decimal>("saldoxunit");
                    workSheet.Cells[row, "AH"] = dt.Rows[i].Field<decimal>("saldoxppto");
                    workSheet.Cells[row, "AI"] = dt.Rows[i].Field<decimal>("vlrEnt");
                    workSheet.Cells[row, "AJ"] = dt.Rows[i].Field<decimal>("vlrEnttraslado");
                    workSheet.Cells[row, "AK"] = dt.Rows[i].Field<decimal>("VlrCompradoxent");
                    workSheet.Cells[row, "AL"] = dt.Rows[i].Field<decimal>("vlrxcomp");
                    workSheet.Cells[row, "AM"] = dt.Rows[i].Field<decimal>("VlrTraslado");
                    workSheet.Cells[row, "AN"] = dt.Rows[i].Field<decimal>("vlrproy");
                    workSheet.Cells[row, "AO"] = dt.Rows[i].Field<decimal>("Vlrini");
                    //workSheet.Cells[row, "AP"] = dt.Rows[i].Field<decimal>("Fecha");
                    workSheet.Cells[row, "AQ"] = Convert.ToString(dt.Rows[i].Field<decimal>("vlrejec"));
                    workSheet.Cells[row].Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Gray);*/
                    //57
                    //124
                   
                    row++;
                }

                int row2=2;
                for (int i = 0; i <= dt2.Rows.Count - 1; i++)
                {


                    workSheet2.Cells[row2, "A"] = dt2.Rows[i].Field<string>("referencia1");
                    workSheet2.Cells[row2, "D"] = dt2.Rows[i].Field<string>("referencia2");
                    workSheet2.Cells[row2, "E"] = dt2.Rows[i].Field<string>("referencia3");
                    workSheet2.Cells[row2, "F"] = dt2.Rows[i].Field<string>("presupuesto");
                    workSheet2.Cells[row2, "G"] = dt2.Rows[i].Field<string>("codcapi");
                   /* workSheet2.Cells[row2, "H"] = dt2.Rows[i].Field<string>("capitulo");
                    workSheet2.Cells[row2, "I"] = dt2.Rows[i].Field<string>("codunit");
                    workSheet2.Cells[row2, "K"] = dt2.Rows[i].Field<string>("undunita");
                    workSheet2.Cells[row2, "L"] = dt2.Rows[i].Field<decimal>("cantxppto");
                    workSheet2.Cells[row2, "M"] = dt2.Rows[i].Field<string>("codinsu");
                    workSheet2.Cells[row2, "N"] = dt2.Rows[i].Field<string>("insutipo");
                    // workSheet.Cells[row, "O"] = dt.Rows[i].Field<string>("Proyecto");
                    workSheet2.Cells[row2, "P"] = dt2.Rows[i].Field<string>("insumo");
                    workSheet2.Cells[row2, "Q"] = dt2.Rows[i].Field<string>("unidinsu");
                    workSheet2.Cells[row2, "R"] = dt2.Rows[i].Field<string>("ctrlinven");
                    workSheet2.Cells[row2, "S"] = dt2.Rows[i].Field<string>("validación");
                    workSheet2.Cells[row2, "T"] = dt2.Rows[i].Field<decimal>("precioppto");
                    workSheet2.Cells[row2, "U"] = dt2.Rows[i].Field<decimal>("consumounitario");
                    workSheet2.Cells[row2, "V"] = dt2.Rows[i].Field<decimal>("consumototal");
                    workSheet2.Cells[row2, "W"] = dt2.Rows[i].Field<decimal>("precioaut");
                    workSheet2.Cells[row2, "X"] = dt2.Rows[i].Field<decimal>("PrecioCompra");
                    workSheet2.Cells[row2, "Y"] = dt2.Rows[i].Field<decimal>("PrecioEntrado");
                    workSheet2.Cells[row2, "Z"] = dt2.Rows[i].Field<decimal>("Ped");
                    workSheet2.Cells[row2, "AA"] = dt2.Rows[i].Field<decimal>("aprob");
                    workSheet2.Cells[row2, "AB"] = dt2.Rows[i].Field<decimal>("comp");
                    workSheet2.Cells[row2, "AC"] = dt2.Rows[i].Field<decimal>("traslado");
                    workSheet2.Cells[row2, "AD"] = dt2.Rows[i].Field<decimal>("sali");
                    workSheet2.Cells[row2, "AE"] = dt2.Rows[i].Field<decimal>("xcomp");
                    workSheet2.Cells[row2, "AF"] = dt2.Rows[i].Field<decimal>("xent");
                    workSheet2.Cells[row2, "AG"] = dt2.Rows[i].Field<decimal>("saldoxunit");
                    workSheet2.Cells[row2, "AH"] = dt2.Rows[i].Field<decimal>("saldoxppto");
                    workSheet2.Cells[row2, "AI"] = dt2.Rows[i].Field<decimal>("vlrEnt");
                    workSheet2.Cells[row2, "AJ"] = dt2.Rows[i].Field<decimal>("vlrEnttraslado");
                    workSheet2.Cells[row2, "AK"] = dt2.Rows[i].Field<decimal>("VlrCompradoxent");
                    workSheet2.Cells[row2, "AL"] = dt2.Rows[i].Field<decimal>("vlrxcomp");
                    workSheet2.Cells[row2, "AM"] = dt2.Rows[i].Field<decimal>("VlrTraslado");
                    workSheet2.Cells[row2, "AN"] = dt2.Rows[i].Field<decimal>("vlrproy");
                    workSheet2.Cells[row2, "AO"] = dt2.Rows[i].Field<decimal>("Vlrini");
                    workSheet2.Cells[row2, "AP"] = dt2.Rows[i].Field<int>("IdFecha");
                    workSheet2.Cells[row2, "AQ"] = Convert.ToString(dt2.Rows[i].Field<decimal>("vlrejec"));*/

                    
                    //57
                    //124

                    row2++;
                }

             

                // Apply some predefined styles for data to look nicely :)
                workSheet.Range["A1"].AutoFormat(Microsoft.Office.Interop.Excel.XlRangeAutoFormat.xlRangeAutoFormatClassic1);
                workSheet2.Range["A1"].AutoFormat(Microsoft.Office.Interop.Excel.XlRangeAutoFormat.xlRangeAutoFormatClassic1);
                // Define filename
                string fileName = string.Format(@"{0}\ExcelData.xls", Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory));

                // Save this data as a file
                workSheet.SaveAs(fileName);
                workSheet2.SaveAs(fileName);
                // Display SUCCESS message

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                // Quit Excel application
                excel.Quit();

                // Release COM objects (very important!)
                if (excel != null)
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(excel);

                if (workSheet != null)
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(workSheet);

                // Empty variables
                excel = null;
                workSheet = null;

                // Force garbage collector cleaning
                GC.Collect();
            }
        }



        public DataTable DatosCopiar()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(sConnectionString);
            DataTable dt = new DataTable();
            string strMsg = "";
            try
            {
               
                conn.Open();
                SqlCommand cmdProc = new SqlCommand("ComparacionesModificacionesGRUPOS", conn);
                cmdProc.CommandType = CommandType.StoredProcedure;
                cmdProc.Parameters.AddWithValue("@Fecha1",CmbSemanaActual.SelectedValue );
                cmdProc.Parameters.AddWithValue("@Fecha2", CmbSemanaPasada.SelectedValue);
                cmdProc.Parameters.AddWithValue("@Grupo", "CTC");
                cmdProc.Parameters.AddWithValue("@Opcion", "0");
                cmdProc.ExecuteNonQuery();
                strMsg = "Saved successfully.";
                
                dt.Load(cmdProc.ExecuteReader());

                
            }
            catch (SqlException e)
            {
                //strMsg = "Data not saved successfully.";
                strMsg = e.Message.ToString();
            }
            finally
            {
                conn.Close();
            }
            return dt;
            
        }

        public DataTable ArchivoCostos()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT * FROM CostosPptoProg WHERE idfecha='"+CmbSemanaActual.SelectedValue+"'";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }

        protected void ExportToExcel(object sender, EventArgs e)
        {

            ExportDataSetToExcel(DatosCopiar(),ArchivoCostos());
            
        }



        

        }


    }
    
