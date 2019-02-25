<%@ Page Language="VB" AutoEventWireup="false" CodeFile="select_detail_proprety.aspx.vb"
    Inherits="select_detail_proprety" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 606px;
        }
        .style2
        {
            height: 34px;
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
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <h3 align="center" style="color: #0000FF">
            ค้นหารายละเอียดคุณสมบัติ
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/images/Excel2.jpg" ImageAlign="Right" />
        </h3>
        <!-- For alternative headers END PASTE here -->
        <!-- B. MAIN -->
        <h3>
            <table>
                    <tr>
                        <td>
                            ประเภทอุปกรณ์
                        </td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                SelectCommand="sa_type_frtu" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="P_Team" SessionField="UserTeam" Type="String" />
                                    <asp:SessionParameter Name="P_office" SessionField="UserOffice" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="DD_type" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                                DataTextField="type_frtu" DataValueField="ID" Width="310px">
                            </asp:DropDownList>
                        </td>
                       
                    </tr>
                    <%--<tr>
                        <td class="style4">
                            พื้นที่
                        </td>
                        <td class="style4">
                            <asp:DropDownList ID="DD_Area" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                DataTextField="office" DataValueField="office" Width="310px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DD_Area"
                                ErrorMessage="เลือกพื้นที่" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td class="style3">
                            รหัสอุปกรณ์
                        </td>
                        <td class="style3">
                            <asp:DropDownList ID="DD_Device" runat="server" DataSourceID="DS_Device" DataTextField="op_id"
                                DataValueField="dbname" Width="310px" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DD_Device"
                                ErrorMessage="เลือกรหัสอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                            คุณสมบัติ
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4"
                                DataTextField="property" DataValueField="property" Width="310px" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1"
                                ErrorMessage="เลือกคุณสมบัติ" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            รายละเอียด
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="TextBox1" runat="server" Width="307px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="เพิ่มรายละเอียด" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A">เพิ่มรายละเอียดคุณสมบัติ</asp:LinkButton>
                        </td>
                        <td class="style1">
                            &nbsp;
                        </td>
                    </tr>--%>
            </table>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="SELECT property, id_type_frtu FROM sa.type_frtu_property WHERE (id_type_frtu = @id_type_frtu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_type" Name="id_type_frtu" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="dbname"
                DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None"
                OnRowCommand="GridView1_RowCommand" Width="99%" PageSize="20" 
                EmptyDataText="No records found" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <%--<asp:BoundField DataField="id" HeaderText="ลำดับ" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" >
                    <ItemStyle Width="15%" />
                    </asp:BoundField>--%>
                   
                    <asp:BoundField DataField="detail" HeaderText="รายละเอียด" SortExpression="detail" />
                     <asp:BoundField DataField="dbname" HeaderText="ลำดับ" SortExpression="dbname" />
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id" />
                    <asp:BoundField DataField="location" HeaderText="สถานที่" SortExpression="location" />
                    <%--<asp:BoundField DataField="product" HeaderText="ผลิตภัณฑ์" 
                        SortExpression="product" />--%>
                    <%--<asp:BoundField DataField="substation" HeaderText="สถานที่" 
                        SortExpression="substation" />--%>
                  <%--  <asp:BoundField DataField="office" HeaderText="พื้นที่" SortExpression="office" />
                    <asp:ButtonField CommandName="cmd_edit" HeaderImageUrl="~/images/icon_edit.gif" Text="Location" />
                    <asp:ButtonField CommandName="cmd_pic" HeaderImageUrl="~/images/icon_view.gif" Text="Pic" />
                    <asp:ButtonField CommandName="cmd_detail" HeaderImageUrl="~/images/icon_view.gif"
                        Text="Detail" HeaderText="คุณสมบัติ" />
                    <asp:ButtonField CommandName="cmdView" HeaderImageUrl="~/images/icon_view.gif" Text="View" HeaderText="ประวัติ" />--%>
                       <asp:ButtonField CommandName="cmd_edit"  Text="Edit" 
                        HeaderText="สถานที่/รหัส" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:ButtonField>
                            <asp:ButtonField CommandName="cmd_pic"  Text="Pic" HeaderText="รูปภาพ" 
                        ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:ButtonField>
                            <asp:ButtonField CommandName="cmd_detail" 
                                Text="Detail" HeaderText="รายละเอียด" 
                        ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:ButtonField>
                                 <asp:ButtonField CommandName="cmdView"  Text="View" 
                        HeaderText="ประวัติ" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                    </asp:ButtonField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataRowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="dbname"
                DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None"
                OnRowCommand="GridView1_RowCommand" Width="99%" PageSize="20" 
                EmptyDataText="No records found" Visible="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                 
                    <%--<asp:BoundField DataField="dbname" HeaderText="DB Name" SortExpression="dbname" />--%>
                    <asp:BoundField DataField="detail" HeaderText="รายละเอียด" SortExpression="detail" />
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id" />
                    <asp:BoundField DataField="location" HeaderText="สถานที่" SortExpression="location" />
                  
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_filter_property" DeleteCommand="DELETE FROM sa.[Setting_Property] WHERE [id] = @id"
                InsertCommand="INSERT INTO sa.[Setting_Property] ([dbname], [property], [detail]) VALUES (@dbname, @property, @detail)"
                UpdateCommand="UPDATE sa.[Setting_Property] SET  [detail] = @detail WHERE [id] = @id"
                SelectCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <%--<asp:Parameter Name="dbname" Type="Int32" />--%>
                    <asp:Parameter Name="dbname" Type="String" />
                    <asp:Parameter Name="property" Type="String" />
                    <asp:Parameter Name="detail" Type="String" />
                    <asp:Parameter Name="type_frtu" Type="String" />
                </InsertParameters>
                <%--<SelectParameters>
                    <asp:ControlParameter ControlID="DD_Device" DefaultValue="-1" Name="dbname" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>--%>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="property" PropertyName="SelectedValue"
                        Type="String" />
                    <asp:ControlParameter ControlID="DD_type" Name="id_type_frtu" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="detail" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
