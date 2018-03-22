<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Detail_device.aspx.vb" Inherits="Detail_device" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>รายละเอียดคุณสมบัติของอุปกรณ์</title>
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
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <h2 style="color: #0000FF" align="center">
            แก้ไข รายละเอียดคุณสมบัติ
        </h2>
        <h3>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="dbname"
                DataSourceID="SqlDataSource2" GridLines="Horizontal" Width="99%">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="dbname" HeaderText="dbname" ReadOnly="True" SortExpression="dbname" />
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" 
                        SortExpression="op_id" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="location" HeaderText="สถานที่" SortExpression="location" />
                    <asp:BoundField DataField="office" HeaderText="พื้นที่" SortExpression="office" />
                    <asp:BoundField DataField="type_frtu" HeaderText="ประเภทอุปกรณ์" 
                        SortExpression="type_frtu" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </h3>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT op_id, location, office, type_frtu, dbname FROM sa.View_device_list WHERE (dbname = @P_dbname)">
            <SelectParameters>
                <asp:QueryStringParameter Name="P_dbname" QueryStringField="dbname" />
            </SelectParameters>
        </asp:SqlDataSource>
        </br>
        <h3 align="center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                DataSourceID="SqlDataSource1" EmptyDataText="No records found" BackColor="White"
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                GridLines="Vertical" HorizontalAlign="Center" Width="99%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <%--<asp:BoundField DataField="id" HeaderText="ลำดับ" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>--%>
                
                    <%--<asp:BoundField DataField="dbname" HeaderText="dbname" 
                    SortExpression="dbname" />--%>
                    <asp:BoundField DataField="property" HeaderText="คุณสมบัติ" SortExpression="property"
                        ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="detail" HeaderText="รายละเอียด" SortExpression="detail">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataRowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                DeleteCommand="DELETE FROM sa.[Setting_Property] WHERE [id] = @id" InsertCommand="INSERT INTO sa.[Setting_Property] ([dbname], [property], [detail], [type_frtu]) VALUES (@dbname, @property, @detail, @type_frtu)"
                SelectCommand="SELECT id, dbname, property, detail, id_type_frtu FROM sa.Setting_Property WHERE (dbname = @dbname) ORDER BY property DESC"
                
                UpdateCommand="UPDATE sa.[Setting_Property] SET [detail] = @detail WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="dbname" Type="String" />
                    <asp:Parameter Name="property" Type="String" />
                    <asp:Parameter Name="detail" Type="String" />
                    <asp:Parameter Name="type_frtu" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="-1" Name="dbname" QueryStringField="dbname"
                        Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <%--<asp:Parameter Name="dbname" Type="String" />--%>
                    <asp:Parameter Name="detail" Type="String" />
                    <%--<asp:Parameter Name="type_frtu" Type="String" />--%>
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
