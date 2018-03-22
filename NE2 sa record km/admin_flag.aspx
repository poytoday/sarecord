<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_flag.aspx.vb" Inherits="admin_flag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>จำนวนงานที่รอดำเนินการของพนักงาน</title>
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
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
            <ContentTemplate>
                <poy:header ID="UCmenu1" runat="server" />
                <h3>
                    <table width="99%">
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            <asp:Label ID="Label1" runat="server" ForeColor="#FF66FF"></asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                    EmptyDataText="No records found" Width="99%" BackColor="LightGoldenrodYellow"
                                    OnRowCommand="GridView1_RowCommand" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                    ForeColor="Black" GridLines="None" DataKeyNames="userid">
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <Columns>
                                        <asp:ButtonField CommandName="cmd_access_en" HeaderImageUrl="~/images/icon_view.gif"
                                            Text="Enable" />
                                        <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" ReadOnly="True">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                                        <asp:BoundField DataField="position" HeaderText="position" SortExpression="position" />
                                        <asp:BoundField DataField="region" HeaderText="region" SortExpression="region" />
                                        <asp:BoundField DataField="user_access" HeaderText="user_access" SortExpression="user_access" />
                                        <asp:BoundField DataField="office" HeaderText="office" SortExpression="office" />
                                        <asp:BoundField DataField="create_date" HeaderText="create_date" SortExpression="create_date" />
                                        <asp:CheckBoxField DataField="active_flag" HeaderText="active_flag" SortExpression="active_flag" />
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="Tan" />
                                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            &nbsp;</h3>
                                    </div>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                                        OnRowCommand="GridView2_RowCommand" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                                        DataKeyNames="userid" DataSourceID="SqlDataSource2" EmptyDataText="No records found"
                                        ForeColor="Black" GridLines="None" Width="99%" AllowPaging="True">
                                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        <Columns>
                                            <asp:ButtonField CommandName="cmd_access_dis" HeaderImageUrl="~/images/icon_view.gif"
                                                Text="Disable" />
                                            <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                            <asp:BoundField DataField="position" HeaderText="position" SortExpression="position" />
                                            <asp:BoundField DataField="region" HeaderText="region" SortExpression="region" />
                                            <asp:BoundField DataField="user_access" HeaderText="user_access" SortExpression="user_access" />
                                            <asp:BoundField DataField="office" HeaderText="office" SortExpression="office" />
                                            <asp:BoundField DataField="create_date" HeaderText="create_date" SortExpression="create_date" />
                                            <asp:BoundField DataField="update_date" HeaderText="update_date" SortExpression="update_date" />
                                            <asp:CheckBoxField DataField="active_flag" HeaderText="active_flag" SortExpression="active_flag" />
                                        </Columns>
                                        <EmptyDataRowStyle HorizontalAlign="Center" />
                                        <FooterStyle BackColor="Tan" />
                                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                                    </asp:GridView>
                                </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="SELECT userid, name, position, region, user_access, office, create_date, active_flag FROM sa.[user] WHERE (active_flag = 0)">
                    </asp:SqlDataSource>
                </h3>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    SelectCommand="SELECT userid, name, position, region, user_access, office, active_flag, create_date, update_date FROM sa.[user] WHERE (active_flag &lt;&gt; 0) ORDER BY update_date DESC, create_date DESC">
                </asp:SqlDataSource>
                <poy:tail ID="tail1" runat="server" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
