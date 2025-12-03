<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DDOOCP_fitness_assignment.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Fitness Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" />
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body {
            height: 100vh;
            background: url('Images/Simple_background.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex; justify-content: center; align-items: center;
        }
        .loginContainer { background-color: rgba(255, 255, 255, 0.2); backdrop-filter: blur(5px);
            border-radius: 15px; box-shadow: 0 8px 30px rgba(0,0,0,.3); padding: 40px 30px; max-width: 420px; width: 100%; text-align: center; }
        .icon { font-size: 4rem; color: #2ecc71; margin-bottom: 20px; }
        .login-form .row { display: flex; align-items: center; background: linear-gradient(to right, #2ecc71, #3498db);
            border-radius: 8px; padding: 10px 15px; margin-bottom: 20px; }
        .login-form label { font-size: 1.4rem; color: white; margin-right: 10px; }
        .login-form input { flex: 1; padding: 10px; font-size: 1rem; border: none; border-radius: 5px; outline: none; }
        .login-btn { width: 100%; padding: 12px; background: linear-gradient(to right, #2ecc71, #3498db); color: white;
            border: none; border-radius: 8px; font-size: 1rem; font-weight: bold; cursor: pointer; transition: transform .2s, box-shadow .3s; }
        .login-btn:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(0,0,0,.3); }
        p { margin-top: 15px; font-size: .95rem; color: #333; }
        a { color: #3498db; text-decoration: none; font-weight: bold; }
        a:hover { text-decoration: underline; }
        @media (max-width: 480px) {
            .loginContainer { padding: 30px 20px; }
            .login-form input { font-size: .9rem; }
            .login-btn { font-size: .95rem; }
            .btnLogin input { width: 100%; padding: 12px; background: linear-gradient(to right, #2ecc71, #3498db); color: white;
                border: none; border-radius: 8px; font-size: 1rem; font-weight: 700; cursor: pointer; transition: transform .2s, box-shadow .3s; }
            .btnLogin input:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(0,0,0,.3); }
            .msg { font-size:1rem; color:red; }
        }

       
        .login-title {
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
                <h2 class="login-title">Login</h2>
                <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                <div class="icon"><i class="bi bi-person-circle"></i></div>
                <div class="row">
                    <label for="username"><i class="bi bi-person-fill"></i></label>
                    <input type="text" id="username" placeholder="Enter your username" required runat="server" />
                </div>
                <div class="row">
                    <label for="upassword"><i class="bi bi-lock-fill"></i></label>
                    <input type="password" id="upassword" placeholder="Enter your password" required runat="server" />
                </div>
                <div class="btrow">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-btn" OnClick="btnLogin_Click" />
                </div>
                <p>New user? <a href="Sign_up.aspx">Register here</a></p>
            </div>
        </div>
    </form>
</body>
</html>