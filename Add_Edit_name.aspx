<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Add_Edit_name.aspx.vb" Inherits="Add_Edit_name" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>แก้ไขชื่อผู้ดำเนินการ</title>
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
        .style2
        {
            width: 707px;
        }
        .style3
        {
            width: 64px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <h3>
            <table width="99%">
            <tr>
            <td align="center">
            ผู้ดำเนินการ </td></tr>
                <tr>
                   
                    <td class="style2">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="name" DataValueField="userid" RepeatColumns="5" Width="99%">
                        </asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            
                            SelectCommand="SELECT userid, team, name FROM sa.[user] WHERE (office = @office) AND (userid NOT IN (SELECT sa.Name_List.Emp_id FROM sa.Name_List INNER JOIN sa.pmcm_record ON sa.Name_List.pmcm_id = sa.pmcm_record.pmcm_id WHERE (sa.pmcm_record.pmcm_id = @pmcm_id))) ORDER BY name">
                            <SelectParameters>
                                <asp:SessionParameter Name="office" SessionField="UserOffice" DefaultValue="ผอค.น.3" />
                                <asp:QueryStringParameter DefaultValue="-1" Name="pmcm_id" QueryStringField="pmcm_id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A">เพิ่มผู้ดำเนินการ</asp:LinkButton>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
