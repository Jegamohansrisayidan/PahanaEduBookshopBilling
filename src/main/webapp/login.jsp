<%-- 
    Document   : login
    Created on : 16 Jul 2025, 15:08:10
    Author     : Jegamohan Srisayidan
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Check for logout parameter
    
    String logoutParam = request.getParameter("logout");
    boolean showLogoutMessage = "success".equals(logoutParam);
    
    // Error parameters
    
    String error = request.getParameter("error");
    boolean hasError = "invalid".equals(error) || "role".equals(error);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pahana Edu Bookshop Billing</title>
        <link rel="icon" type="image/png" href="images/logo.png">

        <!-- Bootstrap CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome Icons -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts -->

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        
        <style>
            :root {
                --primary-color: #273F4F;
                --primary-hover: #1a2b36;
                --light-color: #EFEEEA;
                --text-primary: #273F4F;
                --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            }

            body {
                background: linear-gradient(135deg, #273F4F 0%, #1a2b36 100%);
                font-family: 'Inter', sans-serif;
                min-height: 100vh;
            }

            .login-content {
                max-width: 450px;
                width: 100%;
            }

            .login-header .logo-icon {
                font-size: 4rem;
                color: var(--light-color);
                margin-bottom: 1rem;
            }

            .app-title {
                font-size: 2.5rem;
                font-weight: 800;
                color: var(--light-color);
                margin-bottom: 0.5rem;
            }

            .app-subtitle {
                color: rgba(239, 238, 234, 0.8);
                font-size: 1.1rem;
                margin-bottom: 2rem;
            }

            .login-form-container {
                background: var(--light-color);
                padding: 2.5rem;
                border-radius: 1.5rem;
                box-shadow: var(--shadow-md);
            }

            .welcome-text {
                font-size: 1.8rem;
                font-weight: 700;
                color: var(--text-primary);
                margin-bottom: 0.5rem;
            }

            .welcome-subtitle {
                color: #6b7280;
                font-size: 1rem;
            }

            .form-label {
                font-weight: 600;
                color: var(--text-primary);
                margin-bottom: 0.5rem;
            }

            .input-group-text {
                background: var(--primary-color);
                color: var(--light-color);
                border: 1px solid var(--primary-color);
            }

            .form-control {
                border: 1px solid var(--primary-color);
                border-radius: 0.5rem;
                padding: 0.75rem 1rem;
                font-size: 1rem;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
            }

            /* Updated Button Styles */

            .btn-primary {
                background: var(--primary-color);
                border-color: var(--primary-color);
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                background: var(--primary-hover);
                border-color: var(--primary-hover);
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(39, 63, 79, 0.4);
            }

            .btn-primary:active {
                transform: translateY(0);
            }

            .btn-outline-primary {
                color: var(--primary-color);
                border-color: var(--primary-color);
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
            }

            .btn-outline-primary:hover {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(39, 63, 79, 0.4);
            }

            .btn-outline-secondary {
                color: var(--primary-color);
                border-color: var(--primary-color);
            }

            .btn-outline-secondary:hover {
                background: var(--primary-color);
                border-color: var(--primary-color);
                color: var(--light-color);
            }

            .toggle-password {
                border-left: none;
            }

            .forgot-link {
                color: var(--primary-color);
                text-decoration: none;
                font-weight: 500;
            }

            .forgot-link:hover {
                color: var(--primary-hover);
                text-decoration: underline;
            }

            .form-check-input:checked {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }

            .form-check-input:focus {
                box-shadow: 0 0 0 0.2rem rgba(39, 63, 79, 0.25);
            }

            .copyright-text {
                color: #6b7280;
                font-size: 0.9rem;
            }

            /* Loading state */

            .btn-loading {
                pointer-events: none;
                opacity: 0.8;
            }

            /* Alert styles */

            .alert {
                border-radius: 0.75rem;
            }

            /* Animation */

            .login-form-container {
                animation: fadeInUp 0.6s ease-out;
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

            /* Responsive */

            @media (max-width: 576px) {
                .login-form-container {
                    padding: 2rem;
                    margin: 1rem;
                }

                .app-title {
                    font-size: 2rem;
                }

                .welcome-text {
                    font-size: 1.5rem;
                }
            }
            
            .image-wrapper {
                display: flex;
                justify-content: center;
            }

            .login-icon {
                width: 100px;
                height: 100px;
                object-fit: contain;
                border-radius: 1rem;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

        </style>
        
    </head>
    <body>
        <div class="container min-vh-100 d-flex justify-content-center align-items-center">
            <div class="login-content text-center">
                <% if (showLogoutMessage) { %>
                <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
                    <i class="fas fa-check-circle me-2"></i>
                    <strong>Success!</strong> You have been successfully logged out.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% } %>

                <% if ("invalid".equals(error)) { %>
                <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <strong>Error!</strong> Invalid username or password.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% } else if ("role".equals(error)) { %>
                <div class="alert alert-warning alert-dismissible fade show mb-4" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <strong>Warning!</strong> Unknown user role.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% } %>

                <div class="login-header mb-4">
                    <i class="fas fa-book-open logo-icon mb-3"></i>
                    <h1 class="app-title">Pahana Edu</h1>
                    <p class="app-subtitle">Bookshop Management System</p>
                </div>

                <div class="login-form-container">
                    <div class="image-wrapper">
                        <img src="images/logo.png" alt="Login Icon" class="login-icon mb-3" />
                    </div>
                    <h2 class="welcome-text">Welcome back </h2>
                    <p class="welcome-subtitle mb-4">Please enter your valid credentials here !</p>

                    <form method="post" action="login" novalidate class="login-form">
                        <div class="mb-4">
                            <label for="username" class="form-label text-start d-block">Username</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-user"></i>
                                </span>
                                <input
                                    type="text"
                                    id="username"
                                    name="username"
                                    class="form-control"
                                    placeholder="Enter your username"
                                    required
                                    autofocus
                                    />
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="password" class="form-label text-start d-block">Password</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-lock"></i>
                                </span>
                                <input
                                    type="password"
                                    id="password"
                                    name="password"
                                    class="form-control"
                                    placeholder="Enter your password"
                                    required
                                    />
                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="form-check text-start">
                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                <label class="form-check-label" for="rememberMe">
                                    Remember me
                                </label>
                            </div>
                            <a href="#" class="forgot-link">Forgot password?</a>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 login-btn">
                            <i class="fas fa-sign-in-alt me-2"></i>Login
                        </button>

                        <a href="help.jsp" class="btn btn-outline-primary mt-3 d-block text-center">
                            <i class="fas fa-arrow-left me-2"></i>Help
                        </a>
                    </form>

                    <div class="copyright-text mt-4">
                        © 2025 Pahana Edu Bookshop. All rights reserved.
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JavaScript -->

        <script>
            document.addEventListener('DOMContentLoaded', function () {

                // Password visibility toggle

                const togglePassword = document.querySelector('.toggle-password');
                const passwordInput = document.querySelector('#password');

                if (togglePassword && passwordInput) {
                    togglePassword.addEventListener('click', function () {
                        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                        passwordInput.setAttribute('type', type);

                        // Toggle icon

                        const icon = this.querySelector('i');
                        icon.classList.toggle('fa-eye');
                        icon.classList.toggle('fa-eye-slash');
                    });
                }

                // Animation for login button

                const loginBtn = document.querySelector('.login-btn');
                const loginForm = document.querySelector('.login-form');

                if (loginBtn && loginForm) {
                    loginForm.addEventListener('submit', function () {
                        loginBtn.classList.add('btn-loading');
                        loginBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Logging in...';
                    });
                }

                // Auto-dismiss alerts after 5 seconds

                const alerts = document.querySelectorAll('.alert');
                alerts.forEach(alert => {
                    setTimeout(() => {
                        const closeBtn = alert.querySelector('.btn-close');
                        if (closeBtn) {
                            closeBtn.click();
                        }
                    }, 5000);
                });

                // Focus username field on load

                const usernameField = document.getElementById('username');
                if (usernameField) {
                    usernameField.focus();
                }
            });
        </script>
    </body>
</html>