<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Add_Edit_damage.aspx.vb"
    Inherits="Add_Edit_damage" %>

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
        .style1
        {
            width: 144px;
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
            <table width="99%">
                <tr>
                    <td class="style1">
                        อาการชำรุด :
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="ds_damage"
                            DataTextField="damage_name" DataValueField="id_damage" RepeatColumns="3" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1"
                            ErrorMessage="เลือกอาการชำรุด" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="ds_damage" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT id_damage, damage_name, id_type_frtu FROM sa.Damage_Type WHERE (id_type_frtu = @id_type_frtu)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id_type_frtu" QueryStringField="id_type_frtu" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        สาเหตุ :
                    </td>
                    <td>
                        <asp:Panel ID="Panel1" runat="server" Visible="True">
                            <asp:TextBox ID="TextBox1" runat="server" Height="31px" Width="99%"></asp:TextBox>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        การแก้ไข :
                    </td>
                    <td>
                        <asp:Panel ID="Panel2" runat="server" Visible="True">
                            <asp:TextBox ID="TextBox3" runat="server" Height="154px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="ใช้วัสดูสิ้นเปลือง" />
            <asp:Panel ID="pnlForm2" runat="server" Visible="False">
                <table width="99%">
                    <tr>
                        <td>
                            วัสดุที่ใช้
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                DataTextField="material_type" DataValueField="material_type" Height="16px" Width="146px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                SelectCommand="SELECT material_type, office FROM sa.Material WHERE (office = @office)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            จำนวน(ชิ้น)
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Width="124px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1"
                                ErrorMessage="กรอกจำนวนชิ้น" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Text="เพิ่มรูปภาพ" /><br />
            <asp:Panel ID="pnlForm3" runat="server" Visible="False">
                <table>
                    <tr>
                        <td>
                            รูปภาพและเอกสาร :
                        </td>
                        <td style="width: 726px">
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                                CssClass="Grid" DataSourceID="SqlDataSource5" EmptyDataText="No records found"
                                OnRowCommand="GridView5_RowCommand" Width="100%" DataKeyNames="RUN_ID" BackColor="White"
                                BorderColor="#DEDFDE" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
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
                                            <a href='<%#"getfile.aspx?filename=upload/"+Server.UrlPathEncode(Convert.ToString(Eval("PATH_PIC")))+"&table=[dbo].[upload]"%>'>
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
                                SelectCommand="SELECT * FROM sa.[Damage_PIC] WHERE ([pmcm_id] = @pmcm_id and damage_id = @id_damage)"
                                DeleteCommand="DELETE FROM sa.Device_PIC WHERE (pmcm_id = @pmcm_id)">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="-1" Name="pmcm_id" QueryStringField="pmcm_id"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="RadioButtonList1" Name="id_damage" PropertyName="SelectedValue"
                                        Type="String" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="dbname" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 145px">
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" Height="56px" RepeatDirection="Horizontal"
                                Width="120px">
                                <asp:ListItem>Picture</asp:ListItem>
                                <asp:ListItem>File</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList2"
                                ErrorMessage="เลือกปรพเภท" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:FileUpload ID="Uploadfldpath" runat="server" onchange="var path=document.forms.form1.Uploadfldpath.value; var wpos=path.lastIndexOf('\\'); var upos=path.lastIndexOf('/'); var pos=wpos; if(upos&gt;wpos) pos=upos; document.forms.form1.fldpath.value=path.substr(pos+1);"
                                size="50" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 23px; width: 145px;">
                            <asp:Label ID="lblStorepath" runat="server" class="visible">Store as</asp:Label>
                        </td>
                        <td style="height: 23px">
                            <asp:TextBox ID="fldpath" runat="server" Text='<%# Bind("path") %>' Width="320px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 145px">
                            <asp:Label ID="Label1" runat="server" Text="คำอธิบายรูปภาพ"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" Width="320px"></asp:TextBox>
                        </td>
                    </tr>
                    <caption>
                        &nbsp; เพิ่มรูปภาพ/เอกสารประกอบ :
                    </caption>
                    <tr>
                        <td style="width: 145px">
                            <asp:Button ID="Button1" runat="server" Text="เพิ่มรูปภาพ" ValidationGroup="B" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A">เพิ่มอาการชำรุด</asp:LinkButton>
        </h3>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
            DataTextField="Max_damage" DataValueField="Max_damage" Visible="False">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT MAX(id) AS Max_damage FROM sa.Damage_List"></asp:SqlDataSource>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
