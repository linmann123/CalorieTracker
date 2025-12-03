<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign_up.aspx.cs" Inherits="DDOOCP_fitness_assignment.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Fitness register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            height: 100vh;
            background: url('Images/Simple_background.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .loginContainer {
            background-color: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
            padding: 40px 30px;
            max-width: 420px;
            width: 100%;
            text-align: center;
        }

        .icon {
            font-size: 4rem;
            color: #2ecc71;
            margin-bottom: 20px;
        }

        .login-form .row {
            display: flex;
            align-items: center;
            background: linear-gradient(to right, #2ecc71, #3498db);
            border-radius: 8px;
            padding: 10px 15px;
            margin-bottom: 20px;
            position: relative;
        }

        .login-form label {
            font-size: 1.4rem;
            color: white;
            margin-right: 10px;
        }

        .login-form input {
            flex: 1;
            padding: 10px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            outline: none;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #2ecc71, #3498db);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        p {
            margin-top: 15px;
            font-size: 0.95rem;
            color: #333;
        }

        a {
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .loginContainer {
                padding: 30px 20px;
            }

            .login-form input {
                font-size: 0.9rem;
            }

            .login-btn {
                font-size: 0.95rem;
            }
            
            .btnLogin input {
                width: 100%;
                padding: 12px;
                background: linear-gradient(to right, #2ecc71, #3498db);
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 1rem;
                font-weight: 700;
                cursor: pointer;
                transition: transform .2s, box-shadow .3s;
            }
            .btnLogin input:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(0,0,0,.3); }
        }

       
        .register-title {
            background: linear-gradient(to right, #2ecc71, #3498db);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="loginContainer">
            <div class="login-form">

                <h2 class="register-title">Register</h2>
                
                <div class="icon">
                    <i class="bi bi-person-circle"></i>
                </div>
                <asp:Label ID="message" runat="server" Text=""></asp:Label>
                <div class="row">
                    <label for="username"><i class="bi bi-person-fill"></i></label>
                    <input type="text" id="username" placeholder="Create a username" required runat="server" ClientIDMode="Static"
                           pattern="^[a-zA-Z0-9]+$"
                           title="Username must contain only letters and numbers. No spaces or special characters." />
                </div>

                <div class="row">
                    <label for="useremail"><i class="bi bi-envelope-fill"></i></label>
                    <input type="email" id="useremail" placeholder="Enter your email" required runat="server" ClientIDMode="Static"
                           pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                           title="Enter a valid email address like example@domain.com." />
                </div>

                <div class="row">
                    <label for="password"><i class="bi bi-lock-fill"></i></label>
                    <input type="password" id="password" placeholder="Create a password" required runat="server" ClientIDMode="Static"
                           pattern="^(?=.*[a-z])(?=.*[A-Z]).{12}$"
                           title="Password must be exactly 12 characters long and include at least one uppercase and one lowercase letter." />
                </div>
                
                <div class="row">
                    <label for="confirmPassword"><i class="bi bi-lock-fill"></i></label>
                    <input type="password" id="confirmPassword" placeholder="Confirm password" required runat="server" ClientIDMode="Static"
                           title="Must match the password above." />
                </div>
                
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="login-btn" />
                
                <p>
                    Already have an account?<a href="Login.aspx">Log in</a>
                </p>
            </div>
        </div>
    </form>

 
</body>
</html>