<%@ Page Language = "VB" %>
<%@ Import Namespace = "System.Data.OleDb" %>
<!DOCTYPE html>
<html xmlns = "http://www.w3.org/1999/xhtml">
<head id = "Head1" runat = "server">
<title>Connection</title>
<script runat = "server">

    Sub Search_Click(Src As Object, E As EventArgs)
        Try
            'Connect to the Database
            Dim cnAccess As New OleDbConnection(
            "Provider = Microsoft.Jet.OLEDB.4.0;" &
            "Data Source = K:\STUDIES\ITM_523_ADM\Access\CiceroCoffeeCorner.mdb")

            cnAccess.Open()

            Dim sTransID As String
            sTransID = TransID.Text.Trim

            'Construct the SELECT statement

            Dim sSelectSQL As String
            'Create the SQL Select Statement

            sSelectSQL = "SELECT * FROM SalesTransaction WHERE ([TransID] LIKE '%" & sTransID & "%')"

            'Create the OleDbCommand object
            Dim cmdSelect As New OleDbCommand(sSelectSQL, cnAccess)
            Dim drEmp As OleDbDataReader, sbResults As New StringBuilder()
            drEmp = cmdSelect.ExecuteReader()
            sbResults.Append("<table>")

            Do While drEmp.Read()
                sbResults.Append("<tr><td>")
                sbResults.Append(drEmp.GetValue(0).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetString(1))
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetString(2).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetValue(3).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetValue(4).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetValue(5).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetValue(6).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetValue(7).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetString(8).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetString(9).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetString(10).ToString)
                sbResults.Append("</td><td>")
                sbResults.Append(drEmp.GetString(11).ToString)
                sbResults.Append("</td></tr>")


            Loop
            sbResults.Append("</table>")
            msg.Text = sbResults.ToString()

            If drEmp.HasRows Then
                Response.Write("<span style= 'color:red'>Data matches in records<span>")
            Else
                Response.Write("<span style= 'color:red'>Invalid Data<span>")


            End If

        Catch ex As Exception
            Response.Write(ex.Message)
            Response.Write("<span style= 'color:red'>Connection Failed<span>")
        End Try
    End Sub


</script>
    <style>
        table, td {
          border: 1px solid black;
          /*border-color:azure;*/

        }
        body {
    background-image: url("c1.jpg");
    background-size: 1600px 800px;
    background-repeat: no-repeat;
}
       

    </style>
</head>
<body style = "background-image:url(c1.jpg);">
<h3 style="color:cadetblue">Enter Transaction details to retrieve</h3>
     
<form runat = "server" id = "form1">
<table>
<tr>
<td style="color:greenyellow">Transaction ID: </td>
<td ><asp:Textbox id = "TransID" runat = "server" /></td>
</tr>
</table>
<br />
<asp:Button Text = "Search" OnClick = "Search_Click"
runat = "server" ID = "Button1" />

<p>
<asp:Label id = "msg" runat = "server" />
</p>
        
</form>
<div></div>
</body>
</html>

           


