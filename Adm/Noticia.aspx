<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="Noticia.aspx.cs" Inherits="Adm_Noticia" %>


<%@ Register Src="~/Adm/BarraEdicao.ascx" TagPrefix="uc1" TagName="BarraEdicao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <asp:Button ID="btnLista" runat="server" Text="Listagem" OnClick="btnLista_Click" />
            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click" />

            <asp:MultiView ID="MultiViewNoticia" runat="server">
                <asp:View ID="tabListagem" runat="server">
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByFetch" TypeName="DataSetTableAdapters.TbNoticiaTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="not_id" 
                        DataSourceID="ObjectDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                        Width="100%" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="not_id" HeaderText="ID" ReadOnly="True" SortExpression="not_id"  InsertVisible="false" Visible="False"/>
                            <asp:BoundField DataField="not_titulo" HeaderText="Título" SortExpression="not_titulo" />
                            <asp:BoundField DataField="not_texto" HeaderText="Notícia" SortExpression="not_texto" />
                            <asp:BoundField DataField="not_data" HeaderText="Data/Hora" SortExpression="not_data" />
                            <asp:BoundField DataField="not_imagem" HeaderText="URL Imagem" SortExpression="not_imagem" />
                            <asp:BoundField DataField="cat_id" HeaderText="ID Categoria" SortExpression="cat_id" Visible="False" />
                            <asp:BoundField DataField="cat_nome" HeaderText="Categoria" ReadOnly="True" SortExpression="cat_nome" />
                            <asp:CommandField HeaderText="Selecionar" SelectText="Selecionar" ButtonType="Button" ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                </asp:View>
                <asp:View ID="tabCadastro" runat="server">
                    <uc1:BarraEdicao runat="server" id="BarraEdicao" /><br />
                    <asp:HiddenField ID="campoID" runat="server" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    Título<br />
                    <asp:TextBox ID="txtNotTitulo" runat="server"></asp:TextBox><br />
                    Texto<br />
                    <asp:TextBox id="txtNotTexto" TextMode="multiline" Columns="50" Rows="5" runat="server" /><br />
                    Data<br />
                    <asp:Calendar ID="txtNotData" runat="server"></asp:Calendar><br />
                    URL da Imagem<br />
                    <asp:TextBox ID="txtNotImagem" runat="server"></asp:TextBox><br />
                    Categoria<br />
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSetTableAdapters.TbCategoriaTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:DropDownList ID="txtCatId" DataSourceID="ObjectDataSource2" DataTextField="cat_nome" runat="server" DataValueField="cat_id" AutoPostBack="True"></asp:DropDownList>
                </asp:View>
            </asp:MultiView>

    
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
