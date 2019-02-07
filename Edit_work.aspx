<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Edit_work.aspx.vb" Inherits="Edit_work" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
        .style2
        {
            width: 113px;
        }
        .style3
        {
            width: 632px;
            height: 24px;
        }
        .style6
        {
            width: 113px;
            height: 157px;
        }
        .style9
        {
            width: 71px;
        }
        .style10
        {
            width: 632px;
            height: 32px;
        }
        .style13
        {
            width: 632px;
            height: 53px;
        }
        .style14
        {
            width: 71px;
            height: 53px;
        }
        .style18
        {
            width: 632px;
            height: 46px;
        }
        .style19
        {
            width: 71px;
            height: 46px;
        }
        .style20
        {
            width: 632px;
        }
        .style22
        {
            width: 454px;
            height: 32px;
        }
        .style24
        {
            width: 454px;
            height: 40px;
        }
        .style25
        {
            width: 71px;
            height: 47px;
        }
        .style26
        {
            height: 47px;
        }
        .style27
        {
            height: 32px;
        }
        .style28
        {
            width: 71px;
            height: 32px;
        }
        .style29
        {
            height: 40px;
        }
        .style30
        {
            width: 71px;
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="page-container">
                <!-- For alternative headers START PASTE here -->
                <!-- A. HEADER -->
                <poy:header ID="UCmenu1" runat="server" />
                <!-- For alternative headers END PASTE here -->
                <!-- B. MAIN -->
                <div class="header">
                    <div class="nav2">
                        <h3 align="center">
                            แก้ไขประวัติการปฏิบัติงาน</h3>
                    </div>
                </div>
           
            <h3>
                <table width="99%">
                    <tr>
                        <td>
                            รหัสอุปกรณ์
                        </td>
                        <td class="style22">
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style29">
                            ใบสั่งงาน
                        </td>
                        <td class="style24">
                            <asp:TextBox ID="TextBox3" runat="server" Width="327px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3"
                                ErrorMessage="ใส่เลขใบสั่งงาน" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style29">
                            <asp:Label ID="Label3" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                        <td class="style30" width="99%">
                            <asp:LinkButton ID="LinkButton7" runat="server">Update</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            การปฎิบัติงาน
                        </td>
                        <td class="style10">
                            <asp:DropDownList ID="DD_operation" runat="server" AutoPostBack="True" DataSourceID="DS_pm_cm"
                                DataTextField="PM_CM" DataValueField="PM_CM" Height="31px" Width="310px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_pm_cm" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                SelectCommand="SELECT [PM_CM] FROM sa.[Operation_Device] WHERE ([id_team] = @id_team)">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="-" Name="id_team" QueryStringField="id_team"
                                        Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style27">
                            <asp:Label ID="Label4" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                        <td class="style28" width="99%">
                            <asp:LinkButton ID="LinkButton2" runat="server">Update</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            วันที่ดำเนินการ
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" Text="วันที่" />
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                ForeColor="#663399" Height="200px" ShowGridLines="True" Visible="False" Width="220px">
                                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                <OtherMonthDayStyle ForeColor="#CC9966" />
                                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                <SelectorStyle BackColor="#FFCC66" />
                                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                            </asp:Calendar>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                        <td class="style9" width="99%">
                            <asp:LinkButton ID="LinkButton3" runat="server">Update</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ชั่วโมงในการปฏิบัติงาน
                        </td>
                        <td class="style18">
                            <asp:DropDownList ID="DropDownList3" runat="server" Height="16px" Width="66px">
                               
                                        <asp:ListItem Value="1">1 ชม.</asp:ListItem>
                                        <asp:ListItem Value="2">2 ชม.</asp:ListItem>
                                        <asp:ListItem Value="3">3 ชม.</asp:ListItem>
                                        <asp:ListItem Value="4">4 ชม.</asp:ListItem>
                                        <asp:ListItem Value="5">5 ชม.</asp:ListItem>
                                         <asp:ListItem Value="6">6 ชม.</asp:ListItem>
                                        <asp:ListItem Value="7">7 ชม. (1 วัน) </asp:ListItem>
                                        <asp:ListItem Value="8">8 ชม.</asp:ListItem>
                                        <asp:ListItem Value="9">9 ชม.</asp:ListItem>
                                        <asp:ListItem Value="10">10 ชม.</asp:ListItem>
                                        <asp:ListItem Value="14" > 2 วัน</asp:ListItem>
                                
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                        <td class="style19" width="99%">
                            &nbsp;<asp:LinkButton ID="LinkButton4" runat="server">Update</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="สถานะอุปกรณ์"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                                Width="465px">
                                <asp:ListItem>ใช้งานได้</asp:ListItem>
                                <asp:ListItem>ใช้งานได้บางส่วน</asp:ListItem>
                                <asp:ListItem Value="ใช้งานไม่ได้">ใช้งานไม่ได้</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                        <td class="style14" width="99%">
                            &nbsp;<asp:LinkButton ID="LinkButton5" runat="server">Update</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            หมายเหตุ
                        </td>
                        <td class="style20">
                            <asp:TextBox ID="TextBox1" runat="server" Height="102px" TextMode="MultiLine" Width="432px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label8" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                        <td class="style9" width="99%">
                            &nbsp;<asp:LinkButton ID="LinkButton6" runat="server">Update</asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <table width="99%">
                    <tr>
                        <td class="style6">
                            ผู้ดำเนินการ
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                SelectCommand="SELECT * FROM sa.[View_name_name_list_pmcmid]" DeleteCommand="DELETE FROM sa.Name_List WHERE (id = @id)">
                                <DeleteParameters>
                                    <asp:Parameter DefaultValue="-1" Name="id" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                Width="99%" EmptyDataText="No records found" OnRowCommand="GridView1_RowCommand"
                                DataKeyNames="id,Emp_id,pmcm_id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                                BorderWidth="1px" CellPadding="3">
                                <Columns>
                                    <asp:BoundField DataField="Emp_id" HeaderText="รหัสประจำตัว" SortExpression="Emp_id">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="name" HeaderText="ชื่อ-สกุล" SortExpression="name">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="position" HeaderText="ตำแหน่ง" SortExpression="position">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                    <asp:ButtonField CommandName="cmdDelet" HeaderImageUrl="~/images/icon_view.gif" Text="Delete" />
                                    <asp:ButtonField CommandName="cmdAdd" HeaderImageUrl="~/images/icon_view.gif" Text="Add" />
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            อาการชำรุด
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                SelectCommand="SELECT id, pmcm_id, damage_id, Cause, Correction, damage_name, id_type_frtu FROM sa.View_damage_list WHERE (pmcm_id = @pmcm_id)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="pmcm_id" QueryStringField="pmcm_id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                                Width="99%" EmptyDataText="No records found" OnRowCommand="GridView2_RowCommand"
                                DataKeyNames="pmcm_id,damage_id,id,id_type_frtu" CellPadding="4" ForeColor="#333333"
                                GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Cause" HeaderText="สาเหตุ" SortExpression="Cause">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Correction" HeaderText="การแก้ไข" SortExpression="Correction">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                    <asp:ButtonField CommandName="cmdDelet" HeaderImageUrl="~/images/icon_view.gif" Text="Delete" />
                                    <asp:ButtonField CommandName="cmdAdd" HeaderImageUrl="~/images/icon_view.gif" Text="Add" />
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle ForeColor="#333333" BackColor="#FFFBD6" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="ลบข้อมูล" Width="112px" />
                    </tr>
                </table>
                <poy:tail ID="tail1" runat="server" />
                </div>
                <asp:SqlDataSource ID="DS_name" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    SelectCommand="SELECT Emp_ID AS Emp_id, Names, Team FROM sa.Names WHERE (Emp_ID &lt;&gt; @Emp_id)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="Emp_ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DS_Damage" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    SelectCommand="SELECT * FROM sa.[Damage_Type]"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
