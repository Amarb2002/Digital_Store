<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
    <%@page import="java.sql.*"%>
    <%@page import="Digi.DoorStep_DB"%>
    <jsp:useBean id="s" class="Digi.DoorStep_DB"/>
    <jsp:getProperty name="s" property="conn"/>

    <%@page import="java.sql.*"%>
    <%@page import="Digi.DoorStep_DB"%>
    <jsp:useBean id="s1" class="Digi.DoorStep_DB"/>
    <jsp:getProperty name="s1" property="conn"/> --%>
   <jsp:include page="header.jsp"></jsp:include> 



  <%
    int totle=0;
     int pending=0;
    String email=session.getAttribute("uname").toString();
    ResultSet rs=s.stm.executeQuery("select * from agents where email_id='"+email+"'");
    if(rs.next()){
        int a_id=rs.getInt("a_id");
         ResultSet rs1=s.stm.executeQuery("select * from booking where a_id='"+a_id+"' and status='Delivered'");
         while(rs1.next()){
            int s_id=rs1.getInt("s_id");
            ResultSet rs2=s1.stm.executeQuery("select * from services where s_id='"+s_id+"'");
             if(rs2.next()){
             int s_cost=rs2.getInt("s_cost");
             totle=s_cost+totle;  
             }
             rs2.close();

         }
         rs1.close();
         ResultSet rs3=s.stm.executeQuery("select * from booking where a_id='"+a_id+"' and status!='Delivered'");
         while(rs3.next()){
            int s_id=rs3.getInt("s_id");
            ResultSet rs4=s1.stm.executeQuery("select * from services where s_id='"+s_id+"'");
             if(rs4.next()){
             int s_cost=rs4.getInt("s_cost");
             pending=s_cost+pending;  
             }
             
         }
%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent Wallet</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .body {

    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {

    width: 80%;
    margin: auto;

}

.header {
    margin-top: 20px;
    background-color: #007bff;
    color: #fff;
    padding: 20px;
    text-align: center;
    border-radius: 8px 8px 0 0;
}

.main-content {
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 0 0 8px 8px;
    padding: 20px;
}

.balance-card {
    text-align: center;
    margin-bottom: 20px;
}

.balance-card h2 {
    margin: 0;
    color: #333;
}

.balance-card .balance {
    font-size: 2.5em;
    color: #28a745;
    margin: 10px 0;
}

.stats-cards {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.card {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
    border-radius: 8px;
    flex: 1;
    margin: 0 10px;
}

.card h3 {
    margin: 0;
    color: #333;
    margin-bottom: 10px;
}

.transactions-section {
    margin-bottom: 20px;
}

.transactions-section h2 {
    margin: 0;
    color: #333;
    margin-bottom: 10px;
}

.transactions-list {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.transactions-list li {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid #ddd;
}

.transaction-date {
    color: #666;
}

.transaction-description {
    color: #333;
    flex-grow: 1;
    margin-left: 10px;
}

.transaction-amount {
    color: #28a745;
}

.actions-section {
    text-align: center;
}

.actions-section h2 {
    margin: 0;
    color: #333;
    margin-bottom: 10px;
}

.actions-section .btn {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 5px;
}

.btn:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <div class="body">

    <div class="container">
           </br>
    </br>
    
        <header class="header">
            <h1>Agent Wallet Dashboard</h1>
        </header>
        <div class="main-content">
            <div class="balance-card">
                <h2>Wallet Balance</h2>
                <p class="balance"><%=totle%>.00</p>
            </div>
            <div class="stats-cards">
                <div class="card">
                    <h3>Total Earnings</h3>
                    <p><%=totle%>.00</p>
                </div>
                <div class="card">
                    <h3>Total Withdrawn</h3>
                    <p>00.00</p>
                </div>
                <div class="card">
                    <h3>Pending Payments</h3>
                    <p><%=pending%>.00</p>
                </div>
            </div>
            <div class="transactions-section">
                <h2>Recent Transactions</h2>
                <ul class="transactions-list"><%
                    ResultSet rs5=s.stm.executeQuery("SELECT * FROM booking WHERE a_id='"+a_id+"' ORDER BY b_id DESC");
         while(rs5.next()){
            int s_id=rs5.getInt("s_id");
            ResultSet rs6=s1.stm.executeQuery("select * from services where s_id='"+s_id+"'");
             if(rs6.next()){
             int s_cost=rs6.getInt("s_cost");
               
            %>
                    <li>
                        <span class="transaction-date"><%=rs5.getString("b_date")%></span>
                        &nbsp&nbsp&nbsp&nbsp
                        &nbsp
                        &nbsp
                        &nbsp
                        <span class="transaction-description"><%=rs6.getString("s_name")%></span>
                        <span class="transaction-amount">
                            <%if(rs5.getString("status").equals("Delivered")){%>
                        + <%=s_cost%>.00<%}else{%>
                        Pending
                        <%}%></span>
                    </li>
                  
                <%}}%>
                </ul>
            </div>
            <div class="actions-section">
                
                <button class="btn">Withdraw Funds</button>
               
                <button class="btn">View Statements</button>
            </div>
        </div>
    </div>
    </div>
</body>
</html>




    <%-- wallet code End --%>
    <jsp:include page="footer.jsp"></jsp:include>
    <jsp:include page="sidebar.jsp"></jsp:include>
<%
 }
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
