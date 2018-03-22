<%@ Page Language="VB" AutoEventWireup="false" CodeFile="list_receive_damage.aspx.vb"
    Inherits="list_receive_damage" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="receive_damage_id"
                DataSourceID="SqlDataSource1" EmptyDataText="No records found" OnRowCommand="GridView1_RowCommand"
                Width="99%" AllowSorting="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None"
                BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <%--<asp:BoundField DataField="receive_damage_id" HeaderText="ลำดับ" InsertVisible="False"
                        ReadOnly="True" SortExpression="receive_damage_id" />--%>
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id"
                        ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <%--<asp:BoundField DataField="location" HeaderText="สถานที่" SortExpression="location"
                        ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>--%>
                    <asp:BoundField DataField="damage" HeaderText="อาการชำรุด" SortExpression="damage"
                        ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="date_in" HeaderText="วันที่รับงาน" SortExpression="date_in"
                        ReadOnly="True" DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="book_num" HeaderText="เลขที่หนังสือ" SortExpression="book_num"
                        ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="operation_order" HeaderText="การดำเนินการ" SortExpression="operation_order"
                        ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="status" HeaderText="สถานะ" SortExpression="status">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:CheckBoxField>
                    <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" 
                    SortExpression="pmcm_id" />--%>
                    <%--<asp:ButtonField CommandName="cmdAdd" HeaderImageUrl="~/images/icon_view.gif" Text="Add" />--%>
                </Columns>
                <EmptyDataRowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_recive_work_list" 
                DeleteCommand="DELETE FROM sa.[Receive_damage] WHERE [receive_damage_id] = @receive_damage_id"
                InsertCommand="INSERT INTO sa.[Receive_damage] ([db_name], [damage], [date_in], [book_num], [status], [pmcm_id]) VALUES (@db_name, @damage, @date_in, @book_num, @status, @pmcm_id)"
                UpdateCommand="UPDATE sa.[Receive_damage] SET  [status] = @status WHERE [receive_damage_id] = @receive_damage_id"
                SelectCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="receive_damage_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="db_name" Type="String" />
                    <asp:Parameter Name="damage" Type="String" />
                    <asp:Parameter Name="date_in" Type="DateTime" />
                    <asp:Parameter Name="book_num" Type="String" />
                    <asp:Parameter Name="status" Type="Boolean" />
                    <asp:Parameter Name="pmcm_id" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="office" SessionField="UserOffice" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="status" Type="Boolean" />
                    <asp:Parameter Name="receive_damage_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
