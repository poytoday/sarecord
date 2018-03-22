<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Device_type.aspx.vb" Inherits="Device_type" %>

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
    <style type="text/css">
     
        .style5
        {
            width: 113px;
        }
     
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <poy:header ID="UCmenu1" runat="server" />
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
             <div class="header">  
            <div class="nav2">
                <h3 align="center">
                        เพิ่ม/แก้ไข ประเภทอุปกรณ์</h3>
            </div>  </div>
                <h3 align="center">
                    <table width="99%">
                        <tr>
                            <td align="right" bgcolor="White">
                                เลือกทีม :
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                    DataSourceID="SqlDataSource1" DataTextField="Team" DataValueField="ID" 
                                    Height="28px" RepeatDirection="Horizontal" Width="135px">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
                                    SelectCommand="SELECT * FROM sa.[Team] WHERE ([office] = @office)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                ประเภทอุปกรณ์:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="408px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="กรอกประเภทอุปกรณ์" ForeColor="Red" 
                                    ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <asp:LinkButton ID="Linkbutton10" runat="server" ValidationGroup="A" 
                                    Width="178px">เพิ่มประเภทอุปกรณ์</asp:LinkButton>
                                <td class="style8">
                                    &nbsp;
                                </td>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataKeyNames="ID" 
                        DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="None" 
                        HorizontalAlign="Center" PageSize="20" Width="58%">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <%--<asp:CommandField ShowEditButton="True" HeaderText="แก้ไขประเภทอุปกรณ์" />--%>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ลำดับ" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="Team" HeaderText="Team" 
                SortExpression="Team" />--%>
                            <asp:BoundField DataField="type_frtu" HeaderText="ประเภทอุปกรณ์" 
                                SortExpression="type_frtu">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                            HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
                        DeleteCommand="DELETE FROM sa.[Type_Frtu] WHERE [type_frtu] = @type_frtu" 
                        InsertCommand="INSERT INTO sa.[Type_Frtu] ([type_frtu], [Team]) VALUES (@type_frtu, @Team)" 
                        SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure" 
                        UpdateCommand="UPDATE sa.Type_Frtu SET type_frtu = @type_frtu WHERE (ID = @ID)">
                        <DeleteParameters>
                            <asp:Parameter Name="type_frtu" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="type_frtu" Type="String" />
                            <asp:Parameter Name="Team" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="1" 
                                Name="ID_Team" PropertyName="SelectedValue" Type="Int32" />
                            <asp:SessionParameter DefaultValue="ผอค.น.3" Name="office" 
                                SessionField="UserOffice" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="type_frtu" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </h3>
              </ContentTemplate>
        </asp:UpdatePanel>
            <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
