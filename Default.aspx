<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trabalho C#</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByFetch" TypeName="DataSetTableAdapters.TbNoticiaTableAdapter">
        </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="not_id" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:BoundField DataField="not_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="not_id" Visible="False" />
                <asp:BoundField DataField="not_titulo" HeaderText="Título" SortExpression="not_titulo" />
                <asp:BoundField DataField="not_texto" HeaderText="Notícia" SortExpression="not_texto" />
                <asp:BoundField DataField="not_data" HeaderText="Data/Hora" SortExpression="not_data" />
                <asp:BoundField DataField="not_imagem" HeaderText="URL Imagem" SortExpression="not_imagem" />
                <asp:BoundField DataField="cat_id" HeaderText="ID Categoria" SortExpression="cat_id" Visible="False" />
                <asp:BoundField DataField="cat_nome" HeaderText="Categoria" ReadOnly="True" SortExpression="cat_nome" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
