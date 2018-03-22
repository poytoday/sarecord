<%@ Page Language="VB" AutoEventWireup="false" CodeFile="add_detail_property.aspx.vb"
    Inherits="add_detail_property" %>
    
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
        .style3
        {
            height: 41px;
        }
        .style4
        {
            height: 19px;
        }
        .style5
        {
            height: 26px;
            width: 217px;
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
        <h2 style="color: #0000FF" align="center">
            เพิ่ม/แก้ไข รายละเอียดคุณสมบัติ
        </h2>
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
                    <tr>
                        <td>
                            พื้นที่
                        </td>
                        <td>
                            <asp:DropDownList ID="DD_Area" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                DataTextField="office" DataValueField="office" Width="310px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DD_Area"
                                ErrorMessage="เลือกพื้นที่" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            รหัสอุปกรณ์
                        </td>
                        <td>
                            <asp:DropDownList ID="DD_Device" runat="server" DataSourceID="DS_Device" DataTextField="op_id"
                                DataValueField="dbname" Width="310px" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DD_Device"
                                ErrorMessage="เลือกรหัสอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            คุณสมบัติ
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4"
                                DataTextField="property" DataValueField="property" Width="310px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1"
                                ErrorMessage="เลือกคุณสมบัติ" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            รายละเอียด
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="307px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="เพิ่มรายละเอียด" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A">เพิ่มรายละเอียดคุณสมบัติ</asp:LinkButton>
                        </td>
                        <td class="style1">
                            &nbsp;
                        </td>
                    </tr>
            </table>
            <asp:SqlDataSource ID="DS_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_select_op_id" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_Area" Name="P_area" PropertyName="SelectedValue"
                        Type="String" />
                    <asp:ControlParameter ControlID="DD_type" Name="P_id_type" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                
                SelectCommand="SELECT property, id_type_frtu FROM sa.type_frtu_property WHERE (id_type_frtu = @id_type_frtu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_type" Name="id_type_frtu"
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_select_area" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_type" Name="P_id_type" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None"
                Width="99%" PageSize="20" EmptyDataText="No records found">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    <%--<asp:BoundField DataField="id" HeaderText="ลำดับ" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" >
                    <ItemStyle Width="15%" />
                    </asp:BoundField>--%>
                    <asp:BoundField DataField="property" HeaderText="คุณสมบัติ" SortExpression="property"
                        ReadOnly="True" />
                    <asp:BoundField DataField="detail" HeaderText="รายละเอียด" SortExpression="detail" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataRowStyle BorderStyle="Dotted" HorizontalAlign="Center" />
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
                SelectCommand="SELECT id, dbname, property, detail, id_type_frtu FROM sa.Setting_Property WHERE (dbname = @dbname) ORDER BY property DESC"
                DeleteCommand="DELETE FROM sa.[Setting_Property] WHERE [id] = @id" InsertCommand="INSERT INTO sa.[Setting_Property] ([dbname], [property], [detail]) VALUES (@dbname, @property, @detail)"
                
                UpdateCommand="UPDATE sa.[Setting_Property] SET  [detail] = @detail WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <%--<asp:Parameter Name="dbname" Type="Int32" />--%>
                    <asp:Parameter Name="dbname" Type="String" />
                    <asp:Parameter Name="property" Type="String" />
                    <asp:Parameter Name="detail" Type="String" />
               
                </InsertParameters>
                <%--<SelectParameters>
                    <asp:ControlParameter ControlID="DD_Device" DefaultValue="-1" Name="dbname" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>--%>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_Device" DefaultValue="-1" Name="dbname" PropertyName="SelectedValue"
                        Type="String" />
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
