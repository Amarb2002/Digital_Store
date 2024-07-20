<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Payment Method</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }

        .payment-methods-container {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            margin: 50px auto;
            max-width: 600px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .payment-methods-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .payment-method {
            margin-bottom: 15px;
        }

        .payment-method label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .payment-method input[type="radio"] {
            margin-right: 10px;
        }

        .btn-pay {
            display: block;
            width: 100%;
            background: #28a745;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            text-align: center;
        }

        .btn-pay:hover {
            background: #218838;
        }

        .payment-icon {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        .payment-description {
            margin-left: 10px;
        }

        .offer-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .offer-section .offer {
            background: #e7f4ff;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .offer-section .offer img {
            margin-right: 10px;
        }

        .offer-section .offer button {
            margin-left: 10px;
            background: #007bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .offer-section .offer button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="payment-methods-container">
            <h1>Select Payment Method</h1>

            <div class="offer-section">
                <div class="offer">
                    <img src="https://img.icons8.com/ios-filled/50/000000/discount.png" alt="One Card Offer">
                    One Card Full Swipe Offer 40 Cashback
                    <button>APPLY</button>
                </div>
                <a href="#">VIEW MORE OFFERS & REWARDS</a>
            </div>

            <form action="payment.jsp" method="post">
                <div class="payment-method">
                    <label for="credit-card">
                        <input type="radio" id="credit-card" name="payment_method" value="credit_card" required>
                        <img src="assets/credit.png" alt="Credit Card" class="payment-icon">
                        <div class="payment-description">
                            Credit/Debit Card
                            <p>Pay using your credit or debit card.</p>
                        </div>
                    </label>
                </div>

                <div class="payment-method">
                    <label for="net-banking">
                        <input type="radio" id="net-banking" name="payment_method" value="net_banking" required>
                        <img src="https://img.icons8.com/ios-filled/50/000000/bank-building.png" alt="Net Banking" class="payment-icon">
                        <div class="payment-description">
                            Net Banking
                            <p>Pay using your net banking account.</p>
                        </div>
                    </label>
                </div>

                <div class="payment-method">
                    <label for="upi">
                        <input type="radio" id="upi" name="payment_method" value="upi" required>
                        <img src="https://img.icons8.com/ios-filled/50/000000/money-transfer.png" alt="UPI" class="payment-icon">
                        <div class="payment-description">
                            UPI
                            <p>Pay using your UPI ID.</p>
                        </div>
                    </label>
                </div>

                <button href="payment.jsp" type="submit" class="btn-pay">Proceed to Payment</button>
            </form>
        </div>
    </div>
</body>
</html>
