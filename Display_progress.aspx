<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display_progress.aspx.cs" Inherits="DDOOCP_fitness_assignment.Display_progress" %>

<%@ Import Namespace="DDOOCP_fitness_assignment" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Fit Flow</title>
    <link href="https://fonts.googleapis.com/css2?family=Electrolize&display=swap" rel="stylesheet">
    <style>
        :root { --primary-gradient: linear-gradient(to right, #2ecc71, #00b7ff); --dark-bg: #1b1c1a; --light-text: #f0f0f0; --font-main: "Electrolize", sans-serif; }
        body { margin: 0; font-family: var(--font-main); background: url('Images/Simple_background.jpg') no-repeat center center fixed; background-size: cover; color: var(--light-text); }
        .acontainer { display: flex; flex-direction: column; min-height: 100vh; backdrop-filter: blur(6px); }
        .atopbar { display: flex; justify-content: space-between; align-items: center; padding: 1rem 2rem; background: var(--primary-gradient);
            border-radius: 0 0 12px 12px; box-shadow: 0 2px 15px rgba(0,0,0,0.3); }
        .logo { display: flex; align-items: center; gap: .8rem; }

        .brand { font-size: 1.5rem; font-weight: bold; color: white; }

        .navigation a { margin-left: 1.5rem; text-decoration: none; color: white; font-weight: bold; transition: .3s; }

        .navigation a:hover { color: #ffe082; }
        .logout { color: #ff4d4d; }
        .aright { flex-grow: 1; padding: 2rem; max-width: 900px; margin: 2rem auto; background-color: rgba(255,255,255,.15);
            border-radius: 15px; box-shadow: 0 4px 25px rgba(0,0,0,0.4); text-align: center; }
        .gradient-text { background: var(--primary-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: bold; }
        .aright h1 { font-size: 2.2rem; margin-bottom: .5rem; }
        .aright p { font-size: 1.1rem; margin-bottom: 1.5rem; }
        .form-group { display: flex; gap: 1rem; margin-bottom: 2rem; }
        .form-group input[type="number"] { flex-grow: 1; padding: .8rem; border-radius: 8px; outline: none; font-size: 1rem; }
        .form-group .goal-btn {
            padding: .8rem 1.5rem;
            background: var(--primary-gradient);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: transform .2s;
        }

        .form-group .goal-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,.3);
        }

        table { width: 100%; border-collapse: collapse; margin-top: 1rem; background: rgba(0,0,0,.3); }
        table th, table td { padding: .8rem; border: 1px solid rgba(255,255,255,.2); text-align: center; color: var(--light-text); }
        table th { background: black; font-weight: bold; }
    </style>
</head>
<body>
    <div class="acontainer">
        <header class="atopbar">
            <div class="logo">
                <span class="brand">Fit Flow</span>
            </div>
            <nav class="navigation">
                <a href="goals.aspx">Goal</a>
                <a href="activity.aspx">Activity</a>
                <a href="Display_progress.aspx">Progress</a>
                <a href="logout.aspx" class="logout">Logout</a>
            </nav>
        </header>

        <div class="aright">
          <h1 class="gradient-text">Your Progress</h1>
          <p class="gradient-text">Track your burned calories and compare them to your goals.</p>
          <table id="progressTable">
            <thead>
              <tr>
                <th>No</th>
                <th>Date</th>
                <th>Burned Calories</th>
                <th>Daily Goal</th>
                <th>Achieved?</th>
              </tr>
            </thead>
            <tbody>
              <%
                  List<Progress> arr = DBmanager.getProgress(Data.getUserId());
                  for (int i = 0; i < arr.Count; i++)
                  {
              %>
              <tr>
                <td><%= i + 1 %></td>
                <td><%= arr[i].getDate().ToString("yyyy-MM-dd") %></td>
                <td><%= arr[i].getCalories().ToString("0.00") %></td>
                <td><%= arr[i].getCalorieGoal() %></td>
                <td><%= arr[i].isGoalAchieved() ? "Yes" : "No" %></td>
              </tr>
              <%
                  }
              %>
            </tbody>
          </table>
        </div>
    </div>
</body>
</html>