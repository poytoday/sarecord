<%@ Page Language="VB" AutoEventWireup="false" CodeFile="delete_device.aspx.vb" Inherits="delete_device" %>

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

    

    <style type="text/css">
        .style5
        {
            height: 24px;
        }
        .style6
        {
            width: 569px;
        }
    </style>

    

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
        <ContentTemplate>
            <div class="page-container">
                <poy:header ID="UCmenu1" runat="server" />
                <div class="header">
                    <div class="nav2">
                        <h3 align="center" style="color: #0000FF">
                            อุปกรณ์ที่ต้องการลบ
                        </h3>
                    </div>
                </div>
                <h3>
                    <table width="99%">
                        <%--<tr>
                            <td>
                                ทีมงาน :
                            </td>
                            <td class="style1">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource3"
                                    DataTextField="Team" DataValueField="Team" AutoPostBack="True" RepeatDirection="Horizontal"
                                    RepeatColumns="6">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT Team FROM sa.Team WHERE (office = @office)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>--%>
                       <tr>
                            <td >
                                ประเภทอุปกรณ์
                            </td>
                            <td >
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                    DataSourceID="DS_Type_Device" DataTextField="type_frtu" DataValueField="ID" 
                                    RepeatDirection="Horizontal" RepeatColumns="3" Width="100%">
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList1"
                                    ErrorMessage="เลือกประเภทอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                        </tr>
                        <tr>
                            <td >
                                พื้นที่
                            </td>
                            <td>
                                <asp:DropDownList ID="DD_Area" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                    DataTextField="office" DataValueField="office" Width="310px" Height="31px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DD_Area"
                                    ErrorMessage="เลือกพื้นที่" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                รหัสอุปกรณ์
                            </td>
                            <td>
                                <asp:DropDownList ID="DD_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Device"
                                    DataTextField="op_id" DataValueField="dbname" Height="31px" Width="310px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DD_Device"
                                    ErrorMessage="เลือกรหัสอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="Label9" runat="server" ForeColor="#FF3300"></asp:Label>
                    <br />
                </h3>
               
               <asp:Panel ID="Panel1" runat="server" Visible="False">
                <h3>
                  <table width="99%">
                <tr>
                   
                <td>
                    DBName</td>
                <td>
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
                
                </td>
                <td>
                    รหัสอุปกรณ์</td>
                 <td>
                     <asp:Label ID="Label2" runat="server" ForeColor="#FF3300"></asp:Label>
                 </td>   
                </tr>
                 <tr>
                <td class="style5">
                    ผลิตภัณฑ์</td>
                <td class="style5">
                    <asp:Label ID="Label4" runat="server" ForeColor="#FF3300"></asp:Label>
                
                </td>
                <td class="style5">
                    สถานที่</td>
                 <td class="style5">
                     <asp:Label ID="Label3" runat="server" ForeColor="#FF3300"></asp:Label>
                 </td>  
                </tr>
                <tr>
                
                <td>
                
                    พื้นที่<td>
                
                        <asp:Label ID="Label5" runat="server" ForeColor="#FF3300"></asp:Label>
                
                </td></td>
                  <td>
                
                <td>
                
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                
                </td></td>
                  <tr>
                    <td>
                
                <td>
                
                    &nbsp;</td></td>
                
                <td>
                
                <td>
                
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                
                </td></td></tr>
                </table>
                 </h3>
                    </asp:Panel>
              
                <p>
                    <asp:Button ID="Button1" runat="server" Text="ลบอุปกรณ์" />
                </p>
                <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
        <asp:SqlDataSource ID="DS_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_select_op_id" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DD_Area" Name="P_area" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="RadioButtonList1" Name="P_id_type" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_Type_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="ID_Team" SessionField="User_id_team" Type="Int32" />
                <asp:SessionParameter Name="office" SessionField="UserOffice" />
            </SelectParameters>
        </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource1" 
        runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="sa_select_area" 
        SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RadioButtonList1" Name="P_id_type" 
                                            PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
    </form>
</body>
</html>
