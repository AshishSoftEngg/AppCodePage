using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DL_Designation
/// </summary>
public class DL_Designation
{
	public DL_Designation()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual int Insert(PL_Designation pl)
    {
        MyConnection con = new MyConnection();
        con.cmd.CommandText = "[Sp_Designation]";
        con.cmd.CommandType = CommandType.StoredProcedure;
        con.cmd.Parameters.Add("@HName", pl.HName);
        con.cmd.Parameters.Add("@SHName", pl.SHName);
        con.cmd.Parameters.Add("@Name", pl.Name);       
        con.cmd.Parameters.Add("@sptype", pl.sptype);       
        con.cmd.Parameters.Add("@ParentID", pl.ParentID);
        con.cmd.Parameters.Add("@TreeLevel", pl.TreeLevel);
        con.cmd.Parameters.Add("@ParentDesignationID", pl.MyList);
        con.cmd.Parameters.Add("@DesignationID", pl.TableID);
        SqlParameter p1 = new SqlParameter("@ID", SqlDbType.Int);
        p1.Value = pl.TableID;
        p1.Direction = ParameterDirection.InputOutput;
        con.cmd.Parameters.Add(p1);
        SqlParameter p2 = new SqlParameter("@msg", SqlDbType.VarChar, 200);
        p2.Direction = ParameterDirection.Output;
        con.cmd.Parameters.Add(p2);

        try
        {
            con.Open();
            int RetValue = con.cmd.ExecuteNonQuery();
            con.Close();
            pl.msg = con.cmd.Parameters["@msg"].Value.ToString();
            return RetValue;
        }
        catch (Exception ex)
        {
            pl.msg = ex.Message;
            return 0;
        }
        finally
        {
            if (con.Mycon.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.cmd.Dispose();
        }

    }
    public DataTable Bindgrid(PL_Designation pl)
    {
        MyConnection con = new MyConnection();
        DataTable dt = new DataTable();
        con.Open();
        con.cmd.CommandText = "Sp_Designation";
        con.cmd.CommandType = CommandType.StoredProcedure;
        con.cmd.Parameters.Add("@ParentID", pl.ParentID);      
        con.cmd.Parameters.Add("@sptype", pl.sptype);
        SqlParameter p2 = new SqlParameter("@msg", SqlDbType.VarChar, 2000);
        p2.Direction = ParameterDirection.Output;
        con.cmd.Parameters.Add(p2);
        SqlParameter p1 = new SqlParameter("@ID", SqlDbType.Int);
        p1.Direction = ParameterDirection.InputOutput;
        p1.Value = pl.TableID;    
        con.cmd.Parameters.Add(p1);
        SqlDataReader sdr;
        sdr = con.cmd.ExecuteReader();
        dt.Load(sdr);
        con.Close();
        return dt;
    }

    public DataTable bindDDL(string name)
    {
        MyConnection con = new MyConnection();
        con.Open();
        con.cmd.CommandText = "[Sp_Designation]";
        con.cmd.CommandType = CommandType.StoredProcedure;
        con.cmd.Parameters.Add("@Name", SqlDbType.VarChar, 100).Value = name;
       
        SqlParameter p2 = new SqlParameter("@msg", SqlDbType.VarChar, 2000);
        p2.Direction = ParameterDirection.Output;
        con.cmd.Parameters.Add(p2);
        con.cmd.Parameters.Add("@ID", SqlDbType.VarChar, 100).Value = 0;
        con.cmd.Parameters.Add("@Sptype", SqlDbType.Int ).Value = 4;
      

       
        DataTable dt = new DataTable();
        SqlDataReader sdr;
        sdr = con.cmd.ExecuteReader();
        dt.Load(sdr);
        con.Close();
        return dt;
    }
}