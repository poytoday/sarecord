<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mylink.aspx.vb" Inherits="mylink" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    </head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <poy:header ID="UCmenu1" runat="server" />
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    รวมหน้าโปรแกรมที่ใช้งานประจำ
                </h3>
            </div>
        </div>
        <h3>
            <table width="99%">
                <tr>
                    <td>
                       
                        &nbsp;<asp:GridView 
                            ID="dbGrid_upload" runat="server" 
                            AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" 
                            CssClass="Grid" DataKeyNames="name_aspx" DataSourceID="SqlDataSource1" 
                            EmptyDataText="No records found" Width="100%" BackColor="White" 
                            BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="3">
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle CssClass="shade" ForeColor="#000066" />
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" 
                                HorizontalAlign="Center" VerticalAlign="Middle" />
                            <Columns>
                                <asp:BoundField DataField="name_page" HeaderText="รายระเอียด" 
                                    SortExpression="name_page" />
                                <asp:HyperLinkField DataNavigateUrlFields="name_aspx" DataTextField="name_aspx" 
                                    HeaderText="Address" />
                                <%--<asp:BoundField DataField="Date_Insert" HeaderText="วันที่สร้าง" 
                                    ReadOnly="True" SortExpression="Date_Insert" />--%>
                                        <%--<asp:HyperLinkField DataNavigateUrlFields="name_aspx" 
                                    DataTextField="name_aspx" HeaderText="Address" Text="Link" />--%>
                            
                            </Columns>
                            <SelectedRowStyle CssClass="GridSelected" BackColor="#669999" Font-Bold="True" 
                                ForeColor="White" />
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" 
                                BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle CssClass="GridItemOdd" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                
                SelectCommand="SELECT name_page, name_aspx, user_name FROM sa.View_mylink WHERE (user_name = @username)">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="UserName" />
                </SelectParameters>
            </asp:SqlDataSource>
            <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
