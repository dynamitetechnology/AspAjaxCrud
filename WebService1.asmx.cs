using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace AjaxCurdApp
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string insertUser(string uname, string username, string uemail)
        {
            try
            {
                //Get connection string from web.config file  
                string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                //dbconnection

                SqlConnection conn = new SqlConnection(strcon);

                string sql = "insert into users(name, username, email ) values ('" + uname + "','" + username + "','" + uemail + "' )";

                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                int status = cmd.ExecuteNonQuery();

                if (status > 0)
                {
                    return "200";
                }
                else
                {
                    return "400";
                }


                // return "Insert Call" + uname + ""+ username+""+ uemail;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }


    }
}
