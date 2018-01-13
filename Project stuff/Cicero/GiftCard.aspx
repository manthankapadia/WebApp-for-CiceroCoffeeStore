<%@ Page Language = "VB" %>
<%@ Import Namespace = "System.Data.OleDb" %>
<!DOCTYPE html>
<html xmlns = "http://www.w3.org/1999/xhtml">
<head id = "Head1" runat = "server">
<title>Connection</title>
<script runat = "server">
    Sub Create_Click(Src As Object, E As EventArgs)
        Try
            'Connect to the Database
            Dim cnAccess As New OleDbConnection(
            "Provider = Microsoft.Jet.OLEDB.4.0;" &
            "Data Source = K:\STUDIES\ITM_523_ADM\Access\CiceroCoffeeCorner.mdb")
            Dim sSelectSQL As String = "CREATE TABLE GiftCards"
            sSelectSQL &= "([GiftCardNo] Number, [Pin] Number, [AmtIssued] Number,"
            sSelectSQL &= "[CurrentBalance] Number,"
            sSelectSQL &= "[StaffID] Number)"


            Dim cmdSelect As New OleDbCommand(sSelectSQL, cnAccess)
            cnAccess.Open()
            cmdSelect.ExecuteNonQuery()
            cnAccess.Close()
            msg.Text = "<span style= 'color:red'>Table named as Gift Card is created!<span>"

        Catch ex As Exception
            msg.Text = ex.Message
            Response.Write("<span style= 'color:red'>Table Exists or Connection Failed<span>")
        End Try
    End Sub

    Sub GoTo_Click(Src As Object, E As EventArgs)
        Response.Redirect("Product.aspx")
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
<h3 style="color:cadetblue">Cicero Coffee Corner</h3>
<form runat = "server" id = "form1">
<asp:Button Text = "Create Table" OnClick = "Create_Click"
runat = "server" ID = "Button1" />
<p><asp:Label id = "msg" runat = "server" /></p>
<br />
<asp:Button Text = "Insert Records when new Products arrive" OnClick = "GoTo_Click"
runat = "server" ID = "Button2" />
        <body background="c1.jpg">
</form>
</body>
</html>

