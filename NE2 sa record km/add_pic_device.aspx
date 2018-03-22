<%@ Page Language="VB" AutoEventWireup="false" CodeFile="add_pic_device.aspx.vb"
    Inherits="add_pic_device" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>เพิ่มรูปภาพอุปกรณ์</title>
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
        .style1
        {
            width: 201px;
        }
        .style2
        {
            height: 23px;
            width: 201px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" DataKeyNames="dbname" DataSourceID="SqlDataSource1" 
                GridLines="Horizontal" Width="99%">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="dbname" HeaderText="dbname" ReadOnly="True" 
                        SortExpression="dbname" />
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" 
                        SortExpression="op_id" />
                    <asp:BoundField DataField="location" HeaderText="สถานที่" 
                        SortExpression="location" />
                    <asp:BoundField DataField="office" HeaderText="พื้นที่" 
                        SortExpression="office" />
                    <asp:BoundField DataField="type_frtu" HeaderText="ประเภทอุปกรณ์" 
                        SortExpression="type_frtu" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
                SelectCommand="SELECT op_id, location, office, type_frtu, dbname FROM sa.View_device_list WHERE (dbname = @P_dbname)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="P_dbname" QueryStringField="dbname" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table>
                <tr>
                    <td class="style1">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="56px" RepeatDirection="Horizontal"
                            Width="187px">
                            <asp:ListItem>ไฟล์</asp:ListItem>
                            <asp:ListItem>รูปภาพ</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td width="99%">
                        <asp:FileUpload ID="Uploadfldpath" runat="server" onchange="var path=document.forms.form1.Uploadfldpath.value; var wpos=path.lastIndexOf('\\'); var upos=path.lastIndexOf('/'); var pos=wpos; if(upos&gt;wpos) pos=upos; document.forms.form1.fldpath.value=path.substr(pos+1);"
                            size="50" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="กรุณาเลือกประเภท" ControlToValidate="RadioButtonList1" 
                            ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        เปลี่ยนชื่อ File</td>
                    <td style="height: 23px" width="99%">
                        <asp:TextBox ID="fldpath" runat="server" Text='<%# Bind("path") %>' Width="320px"></asp:TextBox>
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="กรุณาใส่ชื่อไฟล์ หรือ รูปภาพ" ControlToValidate="Uploadfldpath" 
                            ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label1" runat="server" Text="คำอธิบายรูปภาพ"></asp:Label>
                    </td>
                    <td width="99%">
                        <asp:TextBox ID="TextBox1" runat="server" Width="321px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="กรุณาคำอธิบายไฟล์ หรือ รูปภาพ" ControlToValidate="TextBox1" 
                            ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <caption>
                    เพิ่มรูปภาพ/เอกสารประกอบ :
                </caption>
                <tr>
                    <td class="style1">
                        <asp:Button ID="Button1" runat="server" Text="เพิ่มรูปภาพ" 
                            ValidationGroup="A" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                CssClass="Grid" DataSourceID="SqlDataSource5" EmptyDataText="No records found" OnRowCommand="GridView5_RowCommand"
                Width="100%" DataKeyNames="RUN_ID" BackColor="White" BorderColor="#DEDFDE" BorderWidth="1px"
                CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle CssClass="shade" BackColor="#F7F7DE" />
                <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                    VerticalAlign="Middle" />
                <Columns>
                    <asp:BoundField DataField="Type" HeaderText="ประเภท" SortExpression="Type">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Detail" HeaderText="&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;&#3649;&#3621;&#3632;&#3648;&#3629;&#3585;&#3626;&#3634;&#3619;"
                        SortExpression="Detail" />
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <a href='<%#"getfile.aspx?filename=upload/"+Server.UrlPathEncode(Convert.ToString(Eval("PATH_PIC")))+"&table=sa.Device_PIC"%>'>
                                <asp:Image ID="imgpath" runat="server" AlternateText='<%#Convert.ToString(Eval("PATH_PIC"))%>'
                                    ImageUrl="images/file.gif" Visible='<%# Not Convert.IsDBNull(Eval("PATH_PIC"))%>'>
                                </asp:Image>
                            </a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:ButtonField CommandName="cmdDelete" HeaderImageUrl="~/images/icon_delete.gif"
                        Text="Delete">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ButtonField>
                </Columns>
                <SelectedRowStyle CssClass="GridSelected" BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" BackColor="#6B696B"
                    Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle CssClass="GridItemOdd" BackColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="SELECT * FROM sa.[Device_PIC] WHERE ([db_name] = @dbname)" DeleteCommand="DELETE FROM sa.Device_PIC WHERE (RUN_ID = @RUN_ID)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="-1" Name="dbname" QueryStringField="dbname"
                        Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="RUN_ID" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
