<%@ Page Language="VB" AutoEventWireup="false" CodeFile="recevice_person.aspx.vb" Inherits="recevice_person" %>


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
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
          <div class="nav2">
                                  
                <h3 align="center">
                   งานที่มอบหมายจากผู้บริหารหน่วยงาน
                </h3>  </div>
        <h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1" EmptyDataText="No records found" 
                Width="99%" AllowSorting="True" BackColor="White" BorderColor="#336666" BorderStyle="Double"
                BorderWidth="3px" CellPadding="4" GridLines="Horizontal" DataKeyNames="send_damage_id">
                <Columns>
                    <%--<asp:BoundField DataField="receive_damage_id" HeaderText="ลำดับ" InsertVisible="False"
                        ReadOnly="True" SortExpression="receive_damage_id" />--%>
                    <%--<asp:BoundField DataField="location" HeaderText="สถานที่" SortExpression="location"
                        ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>--%>
                    <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" 
                    SortExpression="pmcm_id" />--%>
                    <%--<asp:ButtonField CommandName="cmdAdd" HeaderImageUrl="~/images/icon_view.gif" Text="Add" />--%>
                    <%--<asp:BoundField DataField="receive_damage_id" HeaderText="receive_damage_id" 
                        SortExpression="receive_damage_id" >
                    </asp:BoundField>--%>
                      <%--<asp:BoundField DataField="emp_id" HeaderText="emp_id" SortExpression="emp_id">
                    </asp:BoundField>--%>
                    <%--<asp:BoundField DataField="send_damage_id" HeaderText="send_damage_id" 
                        SortExpression="send_damage_id" InsertVisible="False" ReadOnly="True">
                    </asp:BoundField>--%>
<%--<asp:BoundField DataField="db_name" HeaderText="db_name" 
                        SortExpression="db_name">
</asp:BoundField>--%>
                    <asp:BoundField DataField="date_in" HeaderText="วันที่แจ้ง" SortExpression="date_in" DataFormatString="{0:dd/MMM/yyyy}"  HtmlEncode="False"/>
                   
                    
                    <asp:BoundField DataField="book_num" HeaderText="เลขที่หนังสือ" SortExpression="book_num" />
                    <%--<asp:CheckBoxField DataField="status" HeaderText="status" SortExpression="status" />--%>
                    <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" SortExpression="pmcm_id" />--%>
                    <%--<asp:BoundField DataField="office_name" HeaderText="office_name" SortExpression="office_name" />--%>
                    <%--<asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />--%>
                    <%--<asp:BoundField DataField="position" HeaderText="position" SortExpression="position" />--%>
                    <asp:BoundField DataField="damage" HeaderText="อาการชำรุด" SortExpression="damage" />
                     <asp:BoundField DataField="operation_order" HeaderText="หมายเหตุ" 
                        SortExpression="operation_order">
                    </asp:BoundField>
                    <asp:BoundField DataField="date_recive" HeaderText="วันที่รับแจ้ง" SortExpression="date_recive" />

                    <asp:BoundField DataField="operation_recive" HeaderText="ให้ดำเนินการ" SortExpression="operation_recive" />
                </Columns>
                <EmptyDataRowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_receive_damage_person" DeleteCommand="DELETE FROM sa.[Receive_damage] WHERE [receive_damage_id] = @receive_damage_id"
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
                    <asp:SessionParameter Name="P_Emp_id" SessionField="UserName" Type="Int32" DefaultValue="498934" />
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
