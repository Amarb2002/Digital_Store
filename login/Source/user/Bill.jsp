<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f5f5;
        }

        .invoice-container {
            background: #fff;
            padding: 20px;
            margin: 50px auto;
            max-width: 800px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .invoice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #000;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .invoice-header h1 {
            margin: 0;
            font-size: 24px;
        }

        .invoice-header img {
            max-width: 100px;
        }

        .invoice-details,
        .payment-details {
            margin-bottom: 20px;
        }

        .invoice-details h3,
        .payment-details h3 {
            margin: 0 0 10px 0;
            font-size: 18px;
        }

        .invoice-details p,
        .payment-details p {
            margin: 0;
            font-size: 16px;
        }

        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .invoice-table th,
        .invoice-table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .invoice-table th {
            background: #f4f4f4;
        }

        .total {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 20px;
            font-size: 18px;
        }

        .total .label {
            margin-right: 20px;
        }

        .download-btn {
            display: block;
            width: 100%;
            background: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            text-align: center;
            margin-top: 20px;
        }

        .download-btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="invoice-container" id="invoice">
        <div class="invoice-header">
            <h1>Invoice</h1>
            <img src="https://via.placeholder.com/100" alt="Company Logo">
        </div>

        <div class="company-details">
            <h3>Company Name: ABC Pvt Ltd.</h3>
        </div>

        <div class="invoice-details">
            <h3>Billing Details:</h3>
            <p>Name: John Doe</p>
            <p>Address: 123 Street, City, Country</p>
            <p>Email: john.doe@example.com</p>
            <p>Phone: (123) 456-7890</p>
            <p>Date: July 16, 2024</p>
        </div>

        <div class="payment-details">
            <h3>Payment Details:</h3>
            <p>Payment Method: Credit/Debit Card</p>
            <p>Transaction ID: 1346541530</p>
            <p>Payment Status: Completed</p>
        </div>

        <table class="invoice-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Product 1</td>
                    <td>2</td>
                    <td>$50</td>
                    <td>$100</td>
                </tr>
                <tr>
                    <td>Product 2</td>
                    <td>1</td>
                    <td>$75</td>
                    <td>$75</td>
                </tr>
                <tr>
                    <td>Product 3</td>
                    <td>3</td>
                    <td>$30</td>
                    <td>$90</td>
                </tr>
            </tbody>
        </table>

        <div class="total">
            <div class="label">Total Amount:</div>
            <div>$265</div>
        </div>
    </div>

    <a href="home.jsp" class="download-btn" >Done</a>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

</body>
</html>
       