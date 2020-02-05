<%@ Page Title="Designation Master" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="M_Designation.aspx.cs" Inherits="Master_M_Designation" %>

<%@ Register Src="~/usercontrols/Messagebox.ascx" TagName="Messagebox" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../JS/JScript.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        function validate() {

           <%-- var atLeast = 1;
            var CHK = document.getElementById("<%=chkParent.ClientID%>");
            var checkbox = CHK.getElementsByTagName("input");
            var counter = 0;
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked) {
                    counter++;
                }
            }
            if (atLeast > counter) {

                alert("Please select atleast " + atLeast + " item(s) From parent.");
                return false;
            }
           
            if (document.getElementById("<%=ddlRole.ClientID%>").value == "0") {
       alert("Please Select Role");
       document.getElementById("<%=ddlRole.ClientID%>").focus();
                return false;
            }--%>


            <%--if (document.getElementById("<%=chkParent.ClientID%>").value == "-1") {
                alert("Please Select At least One Item");
                document.getElementById("<%=chkParent.ClientID%>").focus();
                return false;
            }--%>
            if (document.getElementById("<%=txtName.ClientID%>").value == "") {
                alert("Please Enter  Name");
                document.getElementById("<%=txtName.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FormHeading" runat="Server">
    Designation
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<legend>
                        <asp:Label ID="Label3" runat="server" Text="Designation"></asp:Label></legend>--%>
    <div>
        <table width="100%">
            <tr>
                <td align="center">
                    <fieldset>
                        <%-- <asp:TemplateField>
                        <ItemTemplate>
                         <asp:ImageButton ID="imgDelete" Width="20px" Height="20px" runat="server" ImageUrl="~/App_Themes/BasicTheme/Images/delete.jpg"
                                    OnClientClick="return confirm('Are You Sure To Delete?');" 
                                   onclick="imgDelete_Click" />
                                  
                            </ItemTemplate>
                        
                        </asp:TemplateField>  --%>
                        <table style="width: 80%">
                            <tr>
                                <td>Role:<span style="color: Red">*</span>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlRole">
                                        <asp:ListItem Value="0"><--Select--></asp:ListItem>
                                        <asp:ListItem Value="HO">Head Officer</asp:ListItem>
                                        <asp:ListItem Value="RO">Divisional Officer</asp:ListItem>
                                        <asp:ListItem Value="DO">District Officer</asp:ListItem>
                                        <asp:ListItem Value="AO">Auditor</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>Name:<span style="color: Red">*</span>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>

                                <td>
                                    <asp:Label ID="lblName" Text="नाम:" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHName" Width="152px" SkinID="txtHindi" MaxLength="64" runat="server">
                                    </asp:TextBox><asp:TextBox ID="txtTableID" runat="server" Width="2px" Visible="false"></asp:TextBox>
                                    <asp:HiddenField ID="hfNameCUnicode" runat="server" />
                                </td>
                                <%--<td >
                                Parent: &nbsp; &nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:CheckBoxList ID="ddlParent" runat="server" RepeatDirection="Horizontal"
                                    CellPadding="2" CellSpacing="6" Font-Size="9pt" RepeatColumns="7" BackColor="#CCCCCC">
                                </asp:CheckBoxList>
                                <asp:DropDownList runat="server" ID="ddlParent" CssClass="ddlCT" OnSelectedIndexChanged="ddlParent_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </td>--%>
                            </tr>
                            <tr>
                                <td valign="top">Parent : 
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="chkParent" runat="server" RepeatDirection="Vertical"
                                        CellPadding="2" CellSpacing="6" Font-Size="9pt" RepeatColumns="1">
                                    </asp:CheckBoxList>

                                </td>
                            </tr>

                            <tr>
                                <td colspan="4" align="center"></td>
                            </tr>
                            <tr>
                                <td colspan="4" align="center">
                                    <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" OnClientClick="return validate();" />
                                    <asp:Button runat="server" ID="btnReset" Text="Reset" OnClick="btnReset_Click" />
                                    <asp:Button runat="server" ID="btnDelete" Text="Delete" OnClientClick="return confirm('Are You Sure To Delete?');"
                                        OnClick="btnDelete_Click" />
                                    <uc1:Messagebox runat="Server" ID="Messagebox" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
    <fieldset>
        <table width="100%">
            <tr>
                <td colspan="3" class="heading_Emp">Search Designation</td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
            <tr>

                <td align="left" class="auto-style2">Designation Name:&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtSearchDesignationName" runat="server" />
                </td>
                <td align="center">
                    <asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </fieldset>
    <table width="100%">
        <tr>
            <td colspan="4" align="center">
                <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                    OnPageIndexChanging="grd_PageIndexChanging" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <asp:Label ID="lbl_sno" Text='<%#Container.DataItemIndex+1 %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label ID="lblSName" runat="server" Text='<%# Bind("SHName1") %>'></asp:Label>
                                <asp:Label ID="lblSnm" runat="server" Visible="false" Text='<%# Bind("SHName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lbltabid" Visible="false" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="नाम">
                            <ItemTemplate>
                                <asp:Label ID="lblHName" runat="server" Text='<%# Bind("HName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Parent" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblParent" runat="server" Text='<%# Bind("PName") %>'></asp:Label>
                                <asp:Label ID="lblParentID" runat="server" Visible="false" Text='<%# Bind("ParentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkSelect" Text="Select" runat="server" OnClick="lnkSelect_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- <asp:TemplateField>
                        <ItemTemplate>
                         <asp:ImageButton ID="imgDelete" Width="20px" Height="20px" runat="server" ImageUrl="~/App_Themes/BasicTheme/Images/delete.jpg"
                                    OnClientClick="return confirm('Are You Sure To Delete?');" 
                                   onclick="imgDelete_Click" />
                                  
                            </ItemTemplate>
                        
                        </asp:TemplateField>  --%>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
