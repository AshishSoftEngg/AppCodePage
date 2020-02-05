using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Master_M_Designation : System.Web.UI.Page
{
    CommonCode cc = new CommonCode();
    PL_Designation pl = new PL_Designation();
    DL_Designation dl = new DL_Designation();
    BL_Designation bl = new BL_Designation(); 


    protected void Page_Load(object sender, EventArgs e)
    {
        txtHName.Attributes.Add("Onblur", "convert_to_Unicode_and_Chanakya('" + txtHName.ClientID + "','" + hfNameCUnicode.ClientID + "');");
        if (!Page.IsPostBack)
        {
            bindParent();
            btnDelete.Visible = false;
            bindGrid();
            chkParent.Focus();
        }
    }


    public void bindGrid()
    {
        if (txtSearchDesignationName.Text != "")
        {
            SearchDesignation();
        }
        else
        {
            pl.TableID = "0";
            pl.sptype = "0";
            pl.Name = "0";

            if (chkParent.SelectedIndex == 0 || chkParent.SelectedIndex == -1)
            {
                pl.ParentID = "0";
            }
            else
            {
                pl.ParentID = chkParent.SelectedValue;
            }
            grd.DataSource = bl.BindGrid(pl);
            grd.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (btnSave.Text == "Save")
            {
                //Validat();
                pl.sptype = "1";
                pl.TableID = "0";

            }
            else
            {
                if (txtTableID.Text == chkParent.SelectedValue)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertBox", "alert('Record Cannot Be Updated ,Please Check The Parent');", true);
                    //Messagebox.Show("Record Cannot Be Updated ,Please Check The Parent");
                    return;
                }
                pl.TableID = txtTableID.Text;
                pl.sptype = "3";

            }

            pl.SHName = ddlRole.SelectedValue;
            pl.HName = hfNameCUnicode.Value.ToString();
            pl.Name = txtName.Text;           
            {

                pl.ParentID = chkParent.SelectedValue;
            }               
            string MyList = string.Empty;
            foreach (ListItem li in chkParent.Items)
            {
                if (li.Selected == true)
                {
                    if (MyList == null || MyList == "")
                        MyList += li.Value;
                    else MyList += "," + li.Value;                    
                }
            }
            pl.MyList = MyList;

            bl.Insert(pl);

            Reset();
            Messagebox.Show(pl.msg);
            
        }
        catch (Exception ex)
        {
            Messagebox.Show(ex.Message.ToString());
        }
    }    
   
    public void bindParent()
    {

        pl.sptype = "4";
        pl.TableID = "0";
        string name = "";

        DataTable dt = bl.bindDDL(name);
       
        chkParent.DataSource = dt;
        chkParent.DataTextField = "Name";
        chkParent.DataValueField = "ID";
        chkParent.DataBind();

    }
    //protected void lnkSelect_Click(object sender, ImageClickEventArgs e)
    //{
    //    LinkButton lnk = (LinkButton)sender;
    //    GridViewRow grdRow = (GridViewRow)lnk.Parent.Parent;
    //    int rowIndex = grdRow.RowIndex;
    //    txtName.Text = ((Label)grdRow.FindControl("lblName")).Text.Trim();
    //    txtSname.Text = ((Label)grdRow.FindControl("lblSName")).Text.Trim();
    //    txtTableID.Text = ((Label)grdRow.FindControl("lbltabid")).Text.Trim();
    //    ddlDept.SelectedValue = ((Label)grdRow.FindControl("lblDeptID")).Text.Trim();
    //  string s= ((Label)grdRow.FindControl("lblParentID")).Text.Trim();
    //  bindParent();

    //  if (s == "")
    //  {
    //     // chkParent.SelectedIndex = 0;
    //  }
    //  else
    //      chkParent.SelectedValue = s;
    //    btnSave.Text = "Update";
    //    btnDelete.Enabled = true ;

    //} 
    //protected void imgDelete_Click(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton lnk = (ImageButton)sender;
    //    GridViewRow grdRow = (GridViewRow)lnk.Parent.Parent;
    //    int rowIndex = grdRow.RowIndex;
    //    pl.TableID = ((Label)grdRow.FindControl("lbltabid")).Text.Trim();
    //    pl.sptype = "2";
    //    bl.Insert(pl);
    //    Reset();
    //    Messagebox.Show(pl.msg);


    //}
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.PageIndex = e.NewPageIndex;
        bindGrid();

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }
    public void Reset()
    {
        btnDelete.Visible = false;
        txtName.Text = "";
        hfNameCUnicode.Value = "";
        txtTableID.Text = "";
        chkParent.Items.Clear();
        txtHName.Text = "";
        btnSave.Text = "Save";
        btnDelete.Enabled = false;
        bindGrid();
        bindParent();
        ddlRole.SelectedIndex = 0;
    }

    protected void chkParent_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (chkParent.SelectedIndex != 0)
            {
                bindGrid();
            }
            else
            {
                chkParent.Items.Clear();
                bindGrid();
            }
            ddlRole.Focus();
        }
        catch (Exception ex)
        {
            chkParent.Focus();
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            if (btnSave.Text == "Update")
            {
                pl.sptype = "2";
                pl.TableID = txtTableID.Text;
                bl.Insert(pl);
                bindParent();
                Reset();
                Messagebox.Show(pl.msg);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertBox", "alert('" + pl.msg + "');", true);

            }
            else
            {
                Messagebox.Show("Please Select Record To Delete");
            }
        }
        catch (Exception ex)
        {
            Messagebox.Show(ex.Message.ToString());
        }
    }
    protected void lnkSelect_Click(object sender, EventArgs e)
    {

        LinkButton lnk = (LinkButton)sender;
        GridViewRow grdRow = (GridViewRow)lnk.Parent.Parent;
        int rowIndex = grdRow.RowIndex;
        txtName.Text = ((Label)grd.Rows[rowIndex].FindControl("lblName")).Text.Trim();

        Label ao = (Label)grd.Rows[rowIndex].FindControl("lblSNm");

        ddlRole.SelectedValue = ao.Text.ToString().Trim();
        txtTableID.Text = ((Label)grd.Rows[rowIndex].FindControl("lbltabid")).Text.Trim();

        txtHName.Text = ((Label)grd.Rows[rowIndex].FindControl("lblHName")).Text.Trim();
        hfNameCUnicode.Value = txtHName.Text;
        string s = ((Label)grd.Rows[rowIndex].FindControl("lblParentID")).Text.Trim();
        
        bindParent();

        if (s == "" || s == "0")
        {
            // chkParent.SelectedIndex = 0;
        }
        else
        chkParent.SelectedValue = s;
        btnSave.Text = "Update";
        btnDelete.Visible = true;
        btnDelete.Enabled = true;
        chkParent.Focus();
        pl.sptype = "5";
        pl.TableID = txtTableID.Text;
        string name = txtName.Text;

        DataTable dt = bl.bindDDL(name);
        for (int j = 0; j < chkParent.Items.Count; j++)
        { chkParent.Items[j].Selected = false; }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            for (int j = 0; j < chkParent.Items.Count; j++)
            {
                if (dt.Rows[i]["ParentDesignationID"].ToString() == chkParent.Items[j].Value.ToString())
                { chkParent.Items[j].Selected = true; }
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        grd.PageIndex = 0;
        try
        {
            if (txtSearchDesignationName.Text != "")
            {
                SearchDesignation();
            }
            else
            {

                Messagebox.Show("Please enter string in textbox to search State");

            }
        }
        catch (Exception m)
        {
            Messagebox.Show("There is exeption");

        }
    }
    public void SearchDesignation()
    {
        string strSearch = "";
        string MName = txtSearchDesignationName.Text.Trim();

        strSearch = @"SELECT Name,
		(CASE WHEN MDesignation.SHName='HO' THEN 'Head Officer' WHEN MDesignation.SHName='RO' THEN 'Divisional Officer' 
         WHEN MDesignation.SHName='DO' THEN 'District Officer' ELSE 'Auditor' END )SHName1,
		SHName,
		ID,HName,
		isnull(TreeLevel,0) as TreeLevel,
		isnull(MDesignation.ParentID,null)ParentID,
		(select Name from MDesignation mm where mm.ID=MDesignation.ParentID  )PName         
		 from MDesignation where Name like '" + MName + "%'";


        DataTable dt1 = cc.EQ(strSearch);
        if (dt1.Rows.Count > 0)
        {
            grd.DataSource = dt1;
            grd.DataBind();
        }
        else
        {
            grd.DataSource = null;
            grd.DataBind();
        }
    }
}
