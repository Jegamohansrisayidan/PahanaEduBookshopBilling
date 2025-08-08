<%-- 
    Document   : help
    Created on : 17 Jul 2025, 23:44:59
    Author     : Jegamohan Srisayidan
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Help - Pahana Edu Bookshop Billing</title>
     <link rel="icon" type="image/png" href="images/logo.png">

    <!-- Reuse dashboard styles -->
    <link rel="stylesheet" href="styles/dashboard.css" />

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        body {
            background: #273F4F;
        }
        .help-container {
            background: white;
            color: #273F4F;
            border-radius: 1.25rem;
            max-width: 700px;
            margin: 3rem auto 2rem auto;
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.08), 0 4px 6px -2px rgba(0,0,0,0.04);
            padding: 2.5rem 2rem;
            font-family: 'Inter', sans-serif;
            animation: fadeInUp 0.8s cubic-bezier(0.165, 0.84, 0.44, 1);
        }
        .image-wrapper {
            display: flex;
            justify-content: center;
            margin-bottom: 1.2rem;
        }
        .help-icon {
            width: 100px;
            height: 100px;
            object-fit: contain;
            border-radius: 1rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .help-container h1 {
            font-size: 2.2rem;
            font-weight: 800;
            background: linear-gradient(90deg, #273F4F, #1a2b36, #273F4F);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-fill-color: transparent;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 0.7rem;
            letter-spacing: -1px;
            justify-content: center;
        }
        .help-container h1 i {
            color: #273F4F;
        }
        .help-container h2 {
            font-size: 1.3rem;
            font-weight: 700;
            color: #273F4F;
            margin-top: 2rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .help-container section {
            margin-bottom: 1.2rem;
        }
        .help-container ul {
            padding-left: 1.1rem;
            margin-bottom: 1rem;
        }
        .help-container li {
            margin-bottom: 0.6rem;
            font-size: 1rem;
            display: flex;
            align-items: baseline;
            gap: 0.5rem;
        }
        .help-container a {
            color: #273F4F;
            text-decoration: underline;
            transition: color 0.2s;
        }
        .help-container a:hover {
            color: #1a2b36;
            text-decoration: none;
        }
        .btn-back {
            margin-top: 2.2rem;
            font-weight: 600;
            padding: 0.8rem 1.7rem;
            border-radius: 0.75rem;
            font-size: 1rem;
            background: #273F4F;
            border: none;
            color: #fff !important;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.07);
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.7rem;
            text-decoration: none;
        }
        .btn-back:hover {
            background: #1a2b36;
            color: #fff !important;
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0,0,0,0.12);
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @media (max-width: 576px) {
            .help-container {
                padding: 1.1rem 0.7rem;
            }
            .help-container h1 {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
    <div class="help-container">

        <!-- Small Image (e.g., logo or icon) -->
        <div class="image-wrapper">
            <img src="images/logo.png" alt="Help Icon" class="help-icon" />
        </div>

        <h1><i class="fas fa-life-ring"></i> Help & Support</h1>

        <section>
            <h2><i class="fas fa-rocket"></i> Getting Started</h2>
            <p>Welcome to the Pahana Edu Bookshop Billing system ! This platform helps you manage customers, items, and billing efficiently.</p>
        </section>

        <section>
            <h2><i class="fas fa-tasks"></i> Common Functionalities</h2>
            <ul>
                <li><i class="fas fa-sign-in-alt text-primary"></i> <strong>Login:</strong> Use your username and password to access the system.</li>
                <li><i class="fas fa-users-cog text-success"></i> <strong>Manage Users:</strong> Admin only can add, edit, or delete system users.</li>
                <li><i class="fas fa-user-friends text-info"></i> <strong>Manage Customers:</strong> Add new customers or update existing customer info.</li>
                <li><i class="fas fa-boxes text-warning"></i> <strong>Manage Items:</strong> Keep your inventory up-to-date by managing Books.</li>
                <li><i class="fas fa-file-invoice-dollar text-secondary"></i> <strong>Create Bills:</strong> Cashiers can create bills for customers and print receipts mail.</li>
                <li><i class="fas fa-chart-bar text-danger"></i> <strong>View Reports:</strong> Access sales reports and billing history.</li>
            </ul>
        </section>

        <section>
            <h2><i class="fas fa-headset"></i> Contact Support</h2>
            <ul>
                <li><i class="fas fa-envelope"></i> Email: <a href="mailto:support@pahanaedubookshop.com">support@pahanaedubookshop.com</a></li>
                <li><i class="fas fa-phone"></i> Phone: +94 74 058 0937</li>
            </ul>
        </section>

        <a href="login.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to Login</a>
    </div>
</body>
</html>
