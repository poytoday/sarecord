<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Damage.aspx.vb" Inherits="Damage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>เพิ่ม/แก้ไข อาการชำรุด</title>
    <style type="text/css">
        .style1
        {
            height: 23px;
            width: 573px;
        }
        .style2
        {
            width: 573px;
        }
        .style3
        {
            width: 200px;
        }
        .style4
        {
            height: 50px;
        }
        .style7
        {
            width: 171px;
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
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="page-container">
                <!-- For alternative headers START PASTE here -->
                <!-- A. HEADER -->
                <poy:header ID="UCmenu1" runat="server" />
             
                    <div class="nav2">
                        <h3 align="center">
                            เพิ่ม/แก้ไข อาการชำรุด
                        </h3>
                    </div>
        
                <h3>
                    <table width="99%">
                        <tr>
                            <td>
                                ทีมงาน :
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource3"
                                    DataTextField="Team" DataValueField="Team" AutoPostBack="True" 
                                    RepeatDirection="Horizontal" RepeatColumns="4" Width="99%">
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1"
                                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="sa_office" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="P_office" SessionField="UserOffice" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<asp:Label ID="Label3" runat="server" Text="ประเภทอุปกรณ์ :" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="type_frtu" DataValueField="ID" AutoPostBack="True" RepeatDirection="Horizontal"
                                    RepeatColumns="4" Width="99%">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT type_frtu, ID FROM sa.Type_Frtu WHERE (Team = @Team) AND (office = @office)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RadioButtonList2" Name="Team" PropertyName="SelectedValue"
                                            Type="String" />
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1"
                                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                อาการชำรุด :
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Width="411px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">กรอกอาการชำรุด</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                <asp:LinkButton ID="LinkButton1" runat="server" Width="112%" ValidationGroup="A">เพิ่มอาการชำรุด</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource2" PageSize="20" DataKeyNames="id_damage" Width="99%"
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EmptyDataText="ยังไม่ได้เพิ่มอาการชำรุด">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" EditImageUrl="~/images/icon_edit.gif" HeaderText="แก้ไขอาการชำรุด">
                                <ItemStyle Width="25%" />
                            </asp:CommandField>
                            <%--<asp:BoundField DataField="product" HeaderText="product" 
                SortExpression="product" />--%>
                            <%--<asp:TemplateField HeaderText="ลำดับ" InsertVisible="False" SortExpression="id_damage"
                        Visible="True">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_damage") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_damage") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="15%" />
                    </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="อาการชำรุด" SortExpression="damage_name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Height="33px" Text='<%# Bind("damage_name") %>'
                                        Width="473px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("damage_name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </h3>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    DeleteCommand="DELETE FROM sa.[Damage_Type] WHERE [id_damage] = @id_damage" InsertCommand="INSERT INTO sa.[Damage_Type] ([product], [damage_name]) VALUES (@product, @damage_name)"
                    SelectCommand="SELECT id_damage, product, damage_name FROM sa.Damage_Type WHERE (id_type_frtu = @id_type_frtu) ORDER BY id_damage"
                    UpdateCommand="UPDATE sa.[Damage_Type] SET  [damage_name] = @damage_name WHERE [id_damage] = @id_damage">
                    <DeleteParameters>
                        <asp:Parameter Name="id_damage" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="product" Type="String" />
                        <asp:Parameter Name="damage_name" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="id_type_frtu" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="damage_name" Type="String" />
                        <asp:Parameter Name="id_damage" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
