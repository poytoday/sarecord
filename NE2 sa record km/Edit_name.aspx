<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Edit_name.aspx.vb" Inherits="Edit_name" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="3600" />
    <meta name="revisit-after" content="2 days" />
    <meta name="robots" content="index,follow" />
    <meta name="publisher" content="Your publisher infos here ..." />
    <meta name="copyright" content="Your copyright infos here ..." />
    <meta name="author" content="Design: Wolfgang (www.1-2-3-4.info) / Modified: Your Name" />
    <meta name="distribution" content="global" />
    <meta name="description" content="Your page description here ..." />
    <meta name="keywords" content="Your keywords, keywords, keywords, here ..." />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_text.css" />
    <style type="text/css">
        .style1
        {
            width: 81px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <table width="99%">
            <tr>
                <td class="style1">
                    
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        
                        
                        SelectCommand="SELECT Emp_id, Names FROM sa.View_Names WHERE (office = @office)">
                        <SelectParameters>
                            <asp:SessionParameter Name="office" SessionField="UserOffice" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>





      
        <h3>
           ผู้ดำเนินการ :  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="Names" DataValueField="Emp_ID" Width="50%">
                    </asp:DropDownList>
                    <br />
            <asp:LinkButton ID="LinkButton2" runat="server">Update</asp:LinkButton>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
 
                
            
                 
        
    </form>
</body>
</html>
