using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for BL_Designation
/// </summary>
public class BL_Designation
{
	public BL_Designation()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual int Insert(PL_Designation pl)
    {
        DL_Designation obj = new DL_Designation();
        return obj.Insert(pl);
    }
    public DataTable BindGrid(PL_Designation pl)
    {
        DL_Designation obj = new DL_Designation();
        return obj.Bindgrid(pl);
    }
    public DataTable bindDDL(string name)
    {
        DL_Designation obj = new DL_Designation();
        return obj.bindDDL(name);
    }
   
}