<%@ Page Language = "VB" %>
<!DOCTYPE html>
<html xmlns = "http://www.w3.org/1999/xhtml">
<head id = "Head1" runat = "server"><title>Menu</title>
<script runat = "server">

    Sub page1(Src As Object, E As EventArgs)
        Response.Redirect("GiftCard.aspx")
    End Sub
    Sub page2(Src As Object, E As EventArgs)
        Response.Redirect("Product.aspx")
    End Sub
    Sub page3(Src As Object, E As EventArgs)
        Response.Redirect("ListofProducts.aspx")
    End Sub
    Sub page4(Src As Object, E As EventArgs)
        Response.Redirect("Transaction.aspx")
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
<form runat = "server" id = "form1"><br />
<p><asp:Label id = "Label1" runat = "server" ForeColor="Yellow" Text = "Gift Card table" /></p>
<asp:Button Text = "Proceed to: page 1" OnClick = "page1"
runat = "server" ID = "Button1" /><br /> 
<p><asp:Label id = "Label2" runat = "server" ForeColor="Yellow" Text = "New product details" /></p>
<asp:Button Text = "Proceed to: page 2" OnClick = "page2"
runat = "server" ID = "Button2" /><br /> 
<p><asp:Label id = "Label3" runat = "server" ForeColor="Yellow" Text = "List of products" /></p>
<asp:Button Text = "Proceed to: page 3" OnClick = "page3"
runat = "server" ID = "Button3" /><br />
<p><asp:Label id = "Label4" runat = "server" ForeColor="Yellow" Text = "Transaction details" /></p>
<asp:Button Text = "Proceed to: page 4" OnClick = "page4"
runat = "server" ID = "Button4" /><br />
    

  
</form>
</body>
</html>

