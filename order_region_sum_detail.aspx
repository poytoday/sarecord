<%@ Page Language="VB" AutoEventWireup="false" CodeFile="order_region_sum_detail.aspx.vb" Inherits="order_region_sum_detail" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
    <style type="text/css">
        .style3
        {
            width: 709px;
        }
        .style5
        {
            width: 705px;
        }
        .style10
        {
            width: 260px;
        }
        .style11
        {
            width: 290px; height: 36PX;
        }
        .style14
        {
            height: 172px;
        }
        .style15
        {
            width: 180px;
            height: 140px;
        }
        .style16
        {
            width: 173px;
            height: 36PX;
        }
        .style17
        {
            width: 173px;
        }
        </style>
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
                <!-- For alternative headers END PASTE here -->
                <!-- B. MAIN -->
                <h3>
                    <table width="99%">
                        <tr>
                            <td class="style11">
                                รหัสอุปกรณ์ :
                            </td>
                            <td class="style24">
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                เลขใบสั่งงาน :
                            </td>
                            <td class="style22">
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                การปฎิบัติงาน :
                            </td>
                            <td class="style10">
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                วันที่ดำเนินการ
                                <br />
                                วัน/เดือน/ปี:
                            </td>
                            <td class="style3">
                                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                จำนวนวันในการปฏิบัติงาน :
                            </td>
                            <td class="style5">
                                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                <asp:Label ID="Label1" runat="server" Text="สถานะอุปกรณ์"></asp:Label>
                                &nbsp;:
                            </td>
                            <td class="style10">
                                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                หมายเหตุ :
                            </td>
                            <td class="style20">
                                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table width="99%">
                        <tr>
                            <td class="style15">
                                ผู้ดำเนินการ :
                            </td>
                            <td class="style14">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT * FROM sa.[View_name_name_list_pmcmid]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                    Width="99%" EmptyDataText="No records found" DataKeyNames="id,Emp_id,pmcm_id"
                                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="3">
                                    <Columns>
                                        <asp:BoundField DataField="Emp_id" HeaderText="รหัสประจำตัว" SortExpression="Emp_id">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="name" HeaderText="ชื่อ-สกุล" SortExpression="name">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="position" HeaderText="ตำแหน่ง" SortExpression="position">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--  <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                        <asp:ButtonField CommandName="cmdDelet" HeaderImageUrl="~/images/icon_view.gif" Text="Delete" />
                                        <asp:ButtonField CommandName="cmdAdd" HeaderImageUrl="~/images/icon_view.gif" Text="Add" />--%>
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                อาการชำรุด :
                            </td>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT id, pmcm_id, damage_id, Cause, Correction, damage_name, id_type_frtu FROM sa.View_damage_list WHERE (pmcm_id = @pmcm_id)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="pmcm_id" QueryStringField="pmcm_id" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                                    Width="99%" EmptyDataText="No records found" DataKeyNames="pmcm_id,damage_id,id,id_type_frtu"
                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Cause" HeaderText="สาเหตุ" SortExpression="Cause">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Correction" HeaderText="การแก้ไข" SortExpression="Correction">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%-- <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                        <asp:ButtonField CommandName="cmdDelet" HeaderImageUrl="~/images/icon_view.gif" Text="Delete" />
                                        <asp:ButtonField CommandName="cmdAdd" HeaderImageUrl="~/images/icon_view.gif" Text="Add" />--%>
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle ForeColor="#333333" BackColor="#FFFBD6" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                รูปภาพและเอกสาร :
                            </td>
                            <td style="width: 726px">
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                                    CssClass="Grid" DataSourceID="SqlDataSource5" EmptyDataText="No records found"
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
                                                <a href='<%#"getfile.aspx?filename=upload/"+Server.UrlPathEncode(Convert.ToString(Eval("PATH_PIC")))+"&table=[dbo].[upload]"%>'>
                                                    <asp:Image ID="imgpath" runat="server" AlternateText='<%#Convert.ToString(Eval("PATH_PIC"))%>'
                                                        ImageUrl="images/file.gif" Visible='<%# Not Convert.IsDBNull(Eval("PATH_PIC"))%>'>
                                                    </asp:Image>
                                                </a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <%--<asp:ButtonField CommandName="cmdDelete" HeaderImageUrl="~/images/icon_delete.gif"
                                        Text="Delete">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>--%>
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
                                    SelectCommand="SELECT * FROM sa.[Damage_PIC] WHERE ([pmcm_id] = @pmcm_id )">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="-1" Name="pmcm_id" QueryStringField="pmcm_id"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                         <tr>
                            <td class="style17">
                                ข้อแนะนำ ผู้บริหารหน่วยงาน. :
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Label" ForeColor="Blue"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table width="99%">
                       
                        <tr>
                            <td class="style16">
                                สถานะงาน :
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                                    DataTextField="order_type" DataValueField="order_type_id" Height="16px" Width="370px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT order_type, order_type_id FROM sa.order_type WHERE (view_list = @P_section) AND (office = @P_office)  GROUP BY order_type, order_type_id">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="P_section" SessionField="User_access" />
                                        <asp:SessionParameter Name="P_office" SessionField="UserOffice" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                            
                                <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A">Update</asp:LinkButton>
                                <asp:Label ID="Label10" runat="server" ForeColor="#FF3300"></asp:Label>
                            
                            </td>
                        </tr>
                        <tr>
                            <td class="style17">
                                ข้อแนะนำ ผู้บริหารองค์กร:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Height="129px" TextMode="MultiLine" 
                                    Width="464px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton3" runat="server" ValidationGroup="A">Update</asp:LinkButton>
                                <asp:Label ID="Label11" runat="server" ForeColor="#FF3300"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style17">
                                &nbsp;<td>
                                    &nbsp;
                                </td>
                            </td>
                            <td>
                            
                            </td>
                        </tr>
                    </table>
                    <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
