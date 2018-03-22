<%@ Page Language="VB" AutoEventWireup="false" CodeFile="add_property.aspx.vb" Inherits="add_property" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 549px;
        }
        .style3
        {
            height: 23px;
            width: 549px;
        }
        .style4
        {
            height: 23px;
            width: 204px;
        }
        .style7
        {
            width: 762px;
        }
        .style8
        {
            height: 30px;
            width: 204px;
        }
        .style9
        {
            width: 217px;
            height: 30px;
        }
    </style>
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
                            เพิ่ม/แก้ไข หัวข้อคุณสมบัตติ
                        </h3>
                    </div>
                </div>
        <h3>
        <table height="100%" width="100%" border="0">
            <table class="style7" width="99%">
                <tr>
                    <td>
                        เลือกประเภทอุปกรณ์ :
                    </td>
                    <td>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                SelectCommand="sa_type_frtu" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="P_Team" SessionField="UserTeam" Type="String" />
                                    <asp:SessionParameter Name="P_office" SessionField="UserOffice" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="DD_type" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                DataTextField="type_frtu" DataValueField="ID" Width="310px">
                            </asp:DropDownList>
                    </td>
                </tr>
                <%--<tr>
                    <td class="style3">
                        DBNAME :
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox1" runat="server" Width="319px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </td>
                </tr>--%>
                <tr>
                    <td>
                        คุณสมบัติ :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="319px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="กรุณาใส่คุณสมบัติ" ControlToValidate="TextBox1" 
                            ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--<tr>
                    <td class="style4">
                        สถานที่ :
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox3" runat="server" Width="319px" Height="26px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox3" 
                            ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        ผลิตภัณฑ์ :
                    </td>
                    <td class="style6">
                        <asp:TextBox ID="TextBox4" runat="server" Width="319px" Height="26px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox4" 
                            ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        รุ่น :
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox5" runat="server" Width="319px" Height="26px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox5" 
                            ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="style4">
                        รุ่น :
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox1" runat="server" Width="319px" Height="26px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1" 
                            ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:LinkButton ID="Linkbutton10" runat="server" Width="99px" 
                            ValidationGroup="A">เพิ่มอุปกรณ์</asp:LinkButton>
                    </td>
                    <td class="style3">
                    </td>
                </tr>--%>
                <tr>
                <td>
                
                        <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A">เพิ่มหัวข้อคุณสมบัติ</asp:LinkButton>
                
                </td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2"
                PageSize="20" Width="99%" CellPadding="4" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <%--<asp:BoundField DataField="id" HeaderText="ลำดับ" ReadOnly="True" 
                        SortExpression="id" InsertVisible="False" >
                    <ItemStyle Width="25%" />
                    </asp:BoundField>--%>
                    <asp:BoundField DataField="property" HeaderText="คุณสมบัติ" 
                        SortExpression="property" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <%--<asp:BoundField DataField="master" HeaderText="master" SortExpression="master" />--%>
                    <%--<asp:BoundField DataField="dnp_address" HeaderText="dnp_address" SortExpression="dnp_address" />--%>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            </h3>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                DeleteCommand="DELETE FROM sa.[type_frtu_property] WHERE [id] = @id" InsertCommand="INSERT INTO sa.[type_frtu_property] ([type_frtu], [property]) VALUES (@type_frtu, @property)"
                SelectCommand="SELECT id, property, id_type_frtu FROM sa.type_frtu_property WHERE (id_type_frtu = @id_type_frtu)"
                
            
            
            UpdateCommand="UPDATE sa.[type_frtu_property] SET [property] = @property WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="type_frtu" Type="String" />
                    <asp:Parameter Name="property" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_type" Name="id_type_frtu" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="property" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
