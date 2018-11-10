<%@ Page Language="VB" AutoEventWireup="false" CodeFile="person.aspx.vb" Inherits="person" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>หน้าหลัก</title>
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
            width: 449px;
        }
        .style3
        {
            width: 273px;
            height: 38px;
        }
        .style4
        {
            height: 38px;
        }
        .style5
        {
            height: 29px;
        }
        .style6
        {
            width: 273px;
            height: 29px;
        }
        .style9
        {
            height: 31px;
        }
        .style10
        {
            width: 273px;
            height: 31px;
        }
        .style11
        {
            height: 33px;
        }
        .style12
        {
            width: 273px;
            height: 33px;
        }
        .style13
        {
            height: 37px;
        }
        .style14
        {
            width: 273px;
            height: 37px;
        }
        .style15
        {
            height: 33px;
            width: 268px;
        }
        .style16
        {
            width: 268px;
        }
        .style17
        {
            width: 320px;
        }
        .style18
        {
            width: 272px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <!-- For alternative headers END PASTE here -->
        <!-- B. MAIN -->
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
        <h3>
            <table width="99%">
                <tr>
                    <td>
                        <div class="header">
                            <div class="nav2">
                                <h3 align="center">
                                    <asp:Label ID="Label3" runat="server" ForeColor="#FF66FF" Text="รายละเอียดผู้ใช้งาน"></asp:Label>
                                </h3>
                            </div>
                        </div>
                        <table>
                            <tr>
                                <td align="right" class="style13">
                                    รหัสประจำตัว(USER NAME) :
                                </td>
                                <td class="style14">
                                    <asp:Label ID="Label5" runat="server" ForeColor="Blue"></asp:Label>
                                </td>
                                <td class="style13">
                                    Update
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="right" class="style4">
                                    ชื่อ-นามสกุล:&nbsp;
                                </td>
                                <td align="left" class="style3">
                                    &nbsp;<asp:TextBox ID="firstname" runat="server" Width="201px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="ใส่ชื่อ"
                                        ForeColor="Red" ControlToValidate="firstname" ValidationGroup="A1"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style4">
                                    <asp:Button ID="Button4" runat="server" Text="OK" ValidationGroup="A1" />
                                    <asp:Label ID="Label9" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                            </tr>
                            <%--<tr>
                                <td valign="top" align="right" class="style17">
                                    นามสกุล :
                                </td>
                                <td align="left" class="style2">
                                    &nbsp;<asp:TextBox ID="lastname" runat="server" Width="125px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="ใส่นามสกุล"
                                        ForeColor="Red" ControlToValidate="lastname" ValidationGroup="A1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>
                            <tr>
                                <td valign="top" align="right" class="style5">
                                    ตำแหน่ง :
                                </td>
                                <td align="left" class="style6">
                                    &nbsp;<asp:TextBox ID="position" runat="server" Width="198px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="ตำแหน่ง"
                                        ForeColor="Red" ControlToValidate="position" ValidationGroup="A2"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style5">
                                    <asp:Button ID="Button5" runat="server" Text="OK" ValidationGroup="A2" />
                                    <asp:Label ID="Label10" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6" align="right">
                                    องค์กร :
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" Height="16px" Width="189px" AutoPostBack="True">
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
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="SELECT DISTINCT region FROM sa.office_name"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:Button ID="Button6" runat="server" Text="OK" />
                                    <asp:Label ID="Label11" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    หน่วยงาน :
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="195px" DataSourceID="SqlDataSource1"
                                        DataTextField="office" DataValueField="office" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        
                                        SelectCommand="SELECT office, region FROM sa.office_name WHERE (region = @P_region)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList3" Name="P_region" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Label ID="Label12" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="Button3" runat="server" Text="OK" />
                                    <asp:Label ID="Label6" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style9">
                                    ทีมงาน :
                                </td>
                                <td class="style10">
                                    <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" Width="195px" DataSourceID="SqlDataSource2"
                                        DataTextField="Team" DataValueField="ID">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        
                                        SelectCommand="SELECT Team, ID, office FROM sa.Team WHERE (office = @P_office)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" Name="P_office" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Label ID="Label13" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                                <td class="style9">
                                    <asp:Button ID="Button1" runat="server" Text="OK" />
                                    <asp:Label ID="Label7" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                            </tr>
                          <%--  <tr>
                                <td align="right" class="style11">
                                    New Password :
                                </td>
                                <td class="style12">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="196px"></asp:TextBox>
                                </td>
                                <td class="style11">
                                    <asp:Button ID="Button2" runat="server" Text="Change" />
                                    <asp:Label ID="Label8" runat="server" ForeColor="#0066FF"></asp:Label>
                                </td>
                            </tr>--%>
                        </table>
                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                            <h3>
                                <table width="100%">
                                    <tr>
                                        <td class="style15" align="right">
                                            หน่วยงานที่ต้องการตรวจสอบ :
                                        </td>
                                        <td class="style17">
                                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4"
                                                DataTextField="office" DataValueField="office" Height="18px" Width="241px">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                                SelectCommand="sa_order_select_office" SelectCommandType="StoredProcedure" 
                                                InsertCommand="INSERT INTO sa.order_region(emp_id, section_list) VALUES (@P_empid, @P_office)">
                                                <InsertParameters>
                                                    <asp:SessionParameter Name="P_empid" SessionField="UserName" Type="Int32" />
                                                    <asp:ControlParameter ControlID="DropDownList4" Name="P_office" PropertyName="SelectedValue"
                                                        Type="string" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="P_empid" SessionField="UserName" Type="Int32" />
                                                    <asp:SessionParameter Name="P_region" SessionField="UserRegion" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:Button ID="Button7" runat="server" Text="เพิ่มแผนก" />
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td align="right" class="style18">
                                            หน่วยงานที่อยู่ในความดูแล :
                                        </td>
                                        <td class="style16">
                                            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                                                DataSourceID="SqlDataSource5" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
                                                BorderWidth="1px" CellPadding="3" DataKeyNames="section_list"
                                                EmptyDataText="ยังไม่ได้เพิ่มแผนกที่ต้องการตรวจสอบย" CellSpacing="2">
                                                <Columns>
                                                    <asp:CommandField ShowDeleteButton="True" />
                                                    <asp:BoundField DataField="section_list" HeaderText="หน่วยงาน" SortExpression="section_list" />
                                                </Columns>
                                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                                SelectCommand="SELECT section_list, emp_id FROM sa.order_region WHERE (emp_id = @P_emp_id)"
                                                DeleteCommand="DELETE FROM  sa.order_region WHERE [section_list] = @section_list and [emp_id] =@P_emp_id">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="P_emp_id" SessionField="UserName" />
                                                </SelectParameters>
                                                <DeleteParameters>
                                                    <asp:Parameter Name="section_list" Type="string" />
                                                    <asp:SessionParameter Name="P_emp_id" SessionField="UserName" />
                                                </DeleteParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </h3>
                        </asp:Panel>
                        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
