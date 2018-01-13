<%@ Page Language = "VB" %>
<%@ Import Namespace = "System.Data.OleDb" %>
<!DOCTYPE html>
<html xmlns = "http://www.w3.org/1999/xhtml">
<head id="Head1" runat = "server">
<title>Connection</title>
<script runat = "server">
    Sub Insert_Click(Src As Object, E As EventArgs)
        Try
            'Connect to the Database
            Dim cnAccess As New OleDbConnection(
            "Provider = Microsoft.Jet.OLEDB.4.0;" &
            "Data Source = K:\STUDIES\ITM_523_ADM\Access\CiceroCoffeeCorner.mdb")

            cnAccess.Open()
            Dim sProdID, sProdName, sProdPrice, sProdStock, sStoreID, sInsertSQL As String
            sProdID = ProdID.Text
            sProdName = ProdName.Text
            sProdPrice = ProdPrice.Text
            sProdStock = ProdStock.Text
            sStoreID = StoreID.Text


            'Construct the insert statement
            sInsertSQL = "INSERT INTO Product(" &
"[ProdID], [ProdName], [ProdPrice], [ProdStock], [StoreID]) VALUES" &
"(" & sProdID & ",'" & sProdName & "','" & sProdPrice & "'," & sProdStock & ",'" & sStoreID & "');"

            'Construct the OleDbCommand object
            Dim cmdInsert As New OleDbCommand(sInsertSQL, cnAccess)

            'since this is not a query, we do not expect to return data 
            cmdInsert.ExecuteNonQuery()

            Response.Write("<span style= 'color:red'>Data recorded successfully in the database!<span>")
        Catch ex As Exception
            Response.Write(ex.Message)
            Response.Write("<span style= 'color:red'>Connection Failed<span>")
        End Try

    End Sub

    Sub GoTo_Click(Src As Object, E As EventArgs)
        Response.Redirect("ListofProducts.aspx")
    End Sub
</script>
</head>
     <style>
        body {
    background-image: url("c1.jpg");
    background-size: 1600px 800px;
    background-repeat: no-repeat;
}
    </style>
<body style = "font-family:Tahoma;">
<h3 style="color:cadetblue">Enter Product Details</h3>
<form runat = "server" id = "form1">

<table>
<tr>
<td style="color:greenyellow">Product ID:</td>
<td><asp:Textbox id = "ProdID" runat="server" /></td>
</tr>
<tr>
<td style="color:greenyellow">Product Name: </td>
<td><asp:Textbox id = "ProdName" runat = "server" /></td>
</tr>
<tr>
<td style="color:greenyellow">Product Price: </td>
<td><asp:Textbox id = "ProdPrice" runat = "server" /></td>
</tr>
<tr>
<td style="color:greenyellow">Product Stock: </td>
<td><asp:Textbox id = "ProdStock" runat = "server" /></td>
</tr>
<tr>
<td style="color:greenyellow">Store ID: </td>
<td><asp:Textbox id = "StoreID" runat = "server" /></td>
</tr>
   
</table>
<br />
<asp:Button Text = "Insert" OnClick = "Insert_Click"
runat = "server" ID = "Button1" />
<p>
<asp:Label id = "msg" runat = "server" />
</p>
<br />
<asp:Button Text = "Retrieve Records" OnClick = "GoTo_Click"
runat = "server" ID = "Button2" />
        
</form>

<div></div>
</body>
</html>
