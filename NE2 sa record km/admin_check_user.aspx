<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_check_user.aspx.vb" Inherits="admin_check_user" %>


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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <!-- For alternative headers START PASTE here -->
                <!-- A. HEADER -->
                <poy:header ID="UCmenu1" runat="server" />
                <h3>
                    <table width="99%">
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            <asp:Label ID="Label1" runat="server" ForeColor="#FF66FF" 
                                                Text="รายชื่อแผนกและผู้ใช้งานทั้งหมด"></asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                        
                        <td align="center">
                       องค์กร :
                         <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="156px" 
                                            AutoPostBack="True">
                                            <asp:ListItem>น.1</asp:ListItem>
                                            <asp:ListItem>น.2</asp:ListItem>
                                            <asp:ListItem>น.3</asp:ListItem>
                                            <asp:ListItem>ฉ.1</asp:ListItem>
                                            <asp:ListItem>ฉ.2</asp:ListItem>
                                            <asp:ListItem>ฉ.3</asp:ListItem>
                                            <asp:ListItem>ก.1</asp:ListItem>
                                            <asp:ListItem>ก.2</asp:ListItem>
                                            <asp:ListItem>ก.3</asp:ListItem>
                                            <asp:ListItem>ต.1</asp:ListItem>
                                            <asp:ListItem>ต.2</asp:ListItem>
                                            <asp:ListItem>ต.3</asp:ListItem>
                                            <asp:ListItem>PEA</asp:ListItem>
                                        </asp:DropDownList>
                        </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="SqlDataSource1" EmptyDataText="No records found" OnRowCommand="GridView1_RowCommand"
                                    Width="99%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px"
                                    CellPadding="2" ForeColor="Black" GridLines="None" DataKeyNames="office">
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <Columns>
                                        <asp:BoundField DataField="office" HeaderText="แผนก"
                                            SortExpression="office">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="count_user" HeaderText="จำนวนผู้ใช้งาน" 
                                            SortExpression="count_user" ReadOnly="True" >
                                             <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                             <asp:ButtonField CommandName="cmd_name" HeaderImageUrl="~/images/icon_view.gif" Text="View" />
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
                                            <asp:Label ID="Label2" runat="server" ForeColor="#FF66FF" 
                                                Text="รายชื่อผู้ใช้งาน" Visible="False"></asp:Label>
                                        </h3>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                                    CellPadding="3" DataSourceID="SqlDataSource2" 
                                                    EmptyDataText="No records found" GridLines="Vertical" OnRowCommand="GridView2_RowCommand"
                                                    Visible="False" Width="99%" DataKeyNames="userid">
                                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                                    <Columns>
                                                        <asp:BoundField DataField="userid" HeaderText="User ID" 
                                                            SortExpression="userid" >
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="name" HeaderText="ชื่อ - สกุล" 
                                                            SortExpression="name">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                           <asp:BoundField DataField="user_access" HeaderText="สิทธิ์" 
                                                            SortExpression="user_access" >
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="team" HeaderText="ทีมงาน" 
                                                            SortExpression="team" >
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="password" 
                                                            HeaderText="password" SortExpression="password">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                      
                                             <asp:ButtonField CommandName="cmdView" HeaderImageUrl="~/images/icon_view.gif" 
                                                            Text="Permission" >
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:ButtonField>
                                                        <%--<asp:BoundField DataField="date_num" HeaderText="จำนวน(วัน)" SortExpression="date_num">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                                        <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="pmcm_id" />--%><%--<asp:BoundField DataField="Emp_id" HeaderText="รหัสพนักงาน" 
                    SortExpression="Emp_id" />--%>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="sa_admin_count_user" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="P_region" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </h3>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    
                    SelectCommand="sa_admin_user_list" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="P_office" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                <poy:tail ID="tail1" runat="server" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
