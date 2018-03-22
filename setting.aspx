<%@ Page Language="VB" AutoEventWireup="false" CodeFile="setting.aspx.vb" Inherits="setting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="type_frtu" 
            DataValueField="type_frtu">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
            SelectCommand="SELECT * FROM sa.[Type_Frtu]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="type_frtu" HeaderText="type_frtu" 
                    SortExpression="type_frtu" />
                <asp:BoundField DataField="property" HeaderText="property" 
                    SortExpression="property" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="type_frtu" HeaderText="type_frtu" 
                    SortExpression="type_frtu" />
                <asp:BoundField DataField="property" HeaderText="property" 
                    SortExpression="property" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
            DeleteCommand="DELETE FROM sa.[type_frtu_property] WHERE [id] = @id" 
            InsertCommand="INSERT INTO sa.[type_frtu_property] ([type_frtu], [property]) VALUES (@type_frtu, @property)" 
            SelectCommand="SELECT * FROM sa.[type_frtu_property]" 
            UpdateCommand="UPDATE [type_frtu_property] SET [type_frtu] = @type_frtu, [property] = @property WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="type_frtu" Type="String" />
                <asp:Parameter Name="property" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="type_frtu" Type="String" />
                <asp:Parameter Name="property" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
            DeleteCommand="DELETE FROM sa.[type_frtu_property] WHERE [id] = @id" 
            InsertCommand="INSERT INTO sa.[type_frtu_property] ([type_frtu], [property]) VALUES (@type_frtu, @property)" 
            SelectCommand="SELECT * FROM sa.[type_frtu_property] WHERE ([type_frtu] = @type_frtu)" 
            UpdateCommand="UPDATE sa.[type_frtu_property] SET [type_frtu] = @type_frtu, [property] = @property WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="type_frtu" Type="String" />
                <asp:Parameter Name="property" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="-1" 
                    Name="type_frtu" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="type_frtu" Type="String" />
                <asp:Parameter Name="property" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
