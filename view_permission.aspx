<%@ Page Language="VB" AutoEventWireup="false" CodeFile="view_permission.aspx.vb"
    Inherits="view_permission" %>

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
    <style type="text/css">
        .style1
        {
            height: 24px;
        }
        .style3
        {
            height: 24px;
            width: 123px;
        }
        .style4
        {
            width: 390px;
        }
        .style6
        {
            width: 123px;
        }
        .style7
        {
            width: 350px;
        }
        .style8
        {
            width: 293px;
        }
        .style9
        {
            height: 24px;
            width: 293px;
        }
    </style>
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
                                            <asp:Label ID="Label1" runat="server" ForeColor="#FF66FF" Text="รายละเอียดผู้ใช้งาน"></asp:Label>
                                        </h3>
                                    </div>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="SELECT sa.[user].*, userid AS Expr1 FROM sa.[user] WHERE (userid = @P_user_id)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="P_user_id" QueryStringField="user_id" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
                                        DataKeyNames="userid,Expr1" DataSourceID="SqlDataSource2" ForeColor="#333333"
                                        GridLines="None" Height="50px" Width="99%">
                                        <AlternatingRowStyle BackColor="White" />
                                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                        <Fields>
                                            <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
                                            <asp:BoundField DataField="team" HeaderText="team" SortExpression="team" />
                                            <asp:BoundField DataField="id_team" HeaderText="id_team" SortExpression="id_team" />
                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                            <asp:BoundField DataField="position" HeaderText="position" SortExpression="position" />
                                            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                            <asp:BoundField DataField="region" HeaderText="region" SortExpression="region" />
                                            <asp:BoundField DataField="user_access" HeaderText="user_access" SortExpression="user_access" />
                                            <asp:BoundField DataField="office" HeaderText="office" SortExpression="office" />
                                            <asp:BoundField DataField="create_date" HeaderText="create_date" SortExpression="create_date" />
                                            <asp:BoundField DataField="create_user" HeaderText="create_user" SortExpression="create_user" />
                                            <asp:BoundField DataField="update_date" HeaderText="update_date" SortExpression="update_date" />
                                            <asp:BoundField DataField="update_user" HeaderText="update_user" SortExpression="update_user" />
                                        </Fields>
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    </asp:DetailsView>
                                </div>
                                <table style="background-color: #808080">
                                    <tr>
                                        <td class="style6">
                                            สิทธิ์:
                                        </td>
                                        <td class="style7">
                                            <asp:DropDownList ID="DropDownList1" runat="server" Width="202px">
                                                <asp:ListItem>owner</asp:ListItem>
                                                <asp:ListItem>section</asp:ListItem>
                                                <asp:ListItem>region</asp:ListItem>
                                                <asp:ListItem>front_office</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton13" runat="server" 
                                                Width="180px">Update สิทธิ์</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" ForeColor="#3366FF"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <table width="99%">
                                    <%--<tr>
                                            <td class="style5">
                                                เลือกประเภทอุปกรณ์ :
                                            </td>
                                            <td class="style2">
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                                    datasourceid="SqlDataSource3" DataTextField="Team" DataValueField="ID" 
                                                    RepeatDirection="Horizontal">
                                                </asp:RadioButtonList>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
                                                    SelectCommand="SELECT Team, ID FROM sa.Team WHERE (office = @office)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="" Name="office" SessionField="UserOffice" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>--%>
                                    <tr>
                                        <td>
                                            Table Name :</td>
                                        <td width="99%">
                                            <asp:TextBox ID="TextBox1" runat="server" Width="68%"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                                ErrorMessage="Insert Table Name" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Action :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server" Width="68%">S</asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                                ErrorMessage="Insert Action" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Permission :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" runat="server" Width="68%">S</asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                                                ErrorMessage="Insert Permission" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton10" runat="server" ValidationGroup="A" Width="180px">เพิ่มสิทธิ์การใช้งาน</asp:LinkButton>
                                        </td>
                                        <td class="style4">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton1" runat="server" Width="206px">เพิ่มสิทธิ์ Administrator</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton2" runat="server" ForeColor="#FF6666" Width="206px">ลดสิทธิ์ Administrator</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton11" runat="server" Width="226px">เพิ่มสิทธิ์การใช้งาน Owner</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton12" runat="server" ForeColor="#FF6666" Width="206px">ลดสิทธิ์ Owner</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton3" runat="server" Width="226px">เพิ่มสิทธิ์การใช้งาน Section</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton4" runat="server" ForeColor="#FF6666" Width="206px">ลดสิทธิ์ Section</asp:LinkButton>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton5" runat="server" Width="226px">เพิ่มสิทธิ์การใช้งาน Region</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="Linkbutton6" runat="server" ForeColor="#FF6666" Width="206px">ลดสิทธิ์ Region</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                    EmptyDataText="No records found" Width="99%" BackColor="LightGoldenrodYellow"
                                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                                    DataKeyNames="RUN_ID">
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <Columns>
                                        <asp:BoundField DataField="RUN_ID" HeaderText="RUN_ID" SortExpression="RUN_ID" InsertVisible="False"
                                            ReadOnly="True"></asp:BoundField>
                                        <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid"></asp:BoundField>
                                        <asp:BoundField DataField="tablename" HeaderText="tablename" SortExpression="tablename" />
                                        <asp:BoundField DataField="action" HeaderText="action" SortExpression="action" />
                                        <asp:BoundField DataField="permission" HeaderText="permission" SortExpression="permission" />
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
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="SELECT RUN_ID, userid, tablename, action, permission FROM sa.user_permissions WHERE (userid = @user_id) ORDER BY RUN_ID DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="user_id" QueryStringField="user_id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </h3>
                <poy:tail ID="tail1" runat="server" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
