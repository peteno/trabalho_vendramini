using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Noticia
/// </summary>
public class Noticia
{

    #region Atributos
    private int not_id;
    private string not_titulo;
    private string not_texto;
    private DateTime not_data;
    private string not_imagem;
    private Categoria categoria;
    private DataSetTableAdapters.TbNoticiaTableAdapter dsNoticia = new DataSetTableAdapters.TbNoticiaTableAdapter();

    public int Not_id
    {
        get { return not_id; }
    }
    public string Not_titulo
    {
        get { return not_titulo; }
        set { not_titulo = value; }
    }
    public string Not_texto
    {
        get { return not_texto; }
        set { not_texto = value; }
    }
    public DateTime Not_data
    {
        get { return not_data; }
        set { not_data = value; }
    }
    public string Not_imagem
    {
        get { return not_imagem; }
        set { not_imagem = value; }
    }
    public Categoria Categoria
    {
        get { return categoria; }
        set { categoria = value; }
    }

    #endregion

    public Noticia()
    {
    }

    #region Construtores

    public Noticia(int pNot_id)
    {
        DataSet.TbNoticiaDataTable tbNoticia = new DataSet.TbNoticiaDataTable();

        tbNoticia = this.dsNoticia.GetDataByID(pNot_id);


        if (tbNoticia.Rows.Count > 0)
        {
            DataSet.TbNoticiaRow regNoticia = (DataSet.TbNoticiaRow)tbNoticia.Rows[0];
            this.not_id = regNoticia.not_id;
            this.not_titulo = regNoticia.not_titulo;
            this.not_texto = regNoticia.not_texto;
            this.not_data = regNoticia.not_data;
            this.not_imagem = regNoticia.not_imagem;
            this.categoria = new Categoria(regNoticia.cat_id);
        }
    }

    #endregion

    #region Manipulação de Dados

    public string salvar(int pNot_id, string pNot_titulo, string pNot_texto, DateTime pData, string pNot_imagem, Categoria pCategoria)
    {
        if (string.IsNullOrEmpty(pNot_titulo))
        {
            return "O título da Noticia é obrigatório!";
        }
        if (string.IsNullOrEmpty(pNot_texto))
        {
            return "O texto da Noticia é obrigatório!";
        }
        if (string.IsNullOrEmpty(pNot_imagem))
        {
            return "O caminho da imagem é obrigatório!";
        }

        if (pCategoria == null)
        {
            return "A categoria é obrigatório!";
        }

        if (pData == null)
        {
            return "A data é obrigatório!";
        }

        try
        {
            if (pNot_id > 0)
            {
                this.dsNoticia.Update(pNot_titulo, pNot_texto, pData, pNot_imagem, pCategoria.Cat_id, pNot_id);
            }
            else
            {
                this.dsNoticia.Insert(pNot_titulo, pNot_texto, pData, pNot_imagem, pCategoria.Cat_id);
            }
        }
        catch (Exception e)
        {
            return "Erro ao inserir a Noticia: " + e.Message;
        }
        return "";
    }

    public string excluir(int pNot_id)
    {
        try
        {
            this.dsNoticia.Delete(pNot_id);
            return "";
        }
        catch (Exception e)
        {
            return "Erro ao excluir a Noticia: " + e.Message;
        }
    }
    #endregion

}