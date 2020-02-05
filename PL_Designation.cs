using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PL_Designation
/// </summary>
public class PL_Designation
{
	public PL_Designation()
	{
		//
		// TODO: Add constructor logic here
		//
	}



//    TableID	
//Name	
//SHName	
    //DepartmentID	
//ParentID	
//TreeLevel	
//CreatedBy	
//CreatedDate	
//UpdatedBy	
//UpdatedDate	
    public string TableID { get; set; }
    public string Name { get; set; }
    public string SHName { get; set; }
    public string HName { get; set; }
    public string ParentID { get; set; }
    public Int32  TreeLevel { get; set; }
    public DataTable AccessList { get; set; }
    public string sptype { get; set; }
    public string msg { get; set; }
    public string MyList { get; set; }

}