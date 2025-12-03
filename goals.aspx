<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="goals.aspx.cs" Inherits="DDOOCP_fitness_assignment.goals" %>
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
    :root { --primary-gradient: linear-gradient(to right, #2ecc71, #00b7ff);
    --dark-bg: #1b1c1a; --light-text: #f0f0f0; --font-main: "Electrolize", sans-serif; }
    body { margin: 0; font-family: var(--font-main);
    background: url('Images/Simple_background.jpg') no-repeat center center fixed; background-size: cover; color: var(--light-text); }
    .acontainer { display: flex; flex-direction: column;
    min-height: 100vh; backdrop-filter: blur(6px); }
    .atopbar { display: flex; justify-content: space-between; align-items: center; padding: 1rem 2rem;
    background: var(--primary-gradient);
      border-radius: 0 0 12px 12px; box-shadow: 0 2px 15px rgba(0,0,0,0.3); }
    .logo { display: flex;
    align-items: center; gap: .8rem; }

    .brand { font-size: 1.5rem; font-weight: bold; color: white;
    }

    .navigation a { margin-left: 1.5rem; text-decoration: none; color: white; font-weight: bold; transition: .3s;
    }

    .navigation a:hover { color: #ffe082; }
    .logout { color: #ff4d4d;
    }
    .aright { flex-grow: 1; padding: 2rem; max-width: 900px; margin: 2rem auto; background-color: rgba(255,255,255,.15);
      border-radius: 15px;
    box-shadow: 0 4px 25px rgba(0,0,0,0.4); text-align: center; }
    .gradient-text { background: var(--primary-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;
    font-weight: bold; }
    .aright h1 { font-size: 2.2rem; margin-bottom: .5rem;
    }
    .aright p { font-size: 1.1rem; margin-bottom: 1.5rem; }
    .form-group { display: flex;
    gap: 1rem; margin-bottom: 2rem; }
    .form-group input[type="number"] { flex-grow: 1; padding: .8rem; border-radius: 8px; outline: none;
    font-size: 1rem; }
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

    table { width: 100%; border-collapse: collapse; margin-top: 1rem; background: rgba(0,0,0,.3);
    }
    table th, table td { padding: .8rem; border: 1px solid rgba(255,255,255,.2); text-align: center; color: var(--light-text);
    }
    table th { background: black; font-weight: bold;
    }
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

    <form id="form1" class="aright" runat="server">
      
    <h1 class="gradient-text">Set Your Daily Goal!</h1>
      <p class="gradient-text">No Pain.
    No Gain.</p>

      <div class="form-group">
        <input type="number" id="calorieGoal" placeholder="Enter calories to burn" min="1" runat="server" />
        <asp:Button ID="btnCalories" runat="server" CssClass="goal-btn" Text="Set Goal" OnClick="btnCalories_Click" />
      </div>

        <asp:HiddenField ID="HiddenFieldGoalAction" runat="server" />
<asp:Button ID="btnUpdateGoal" runat="server" Text="Update Goal" OnClick="btnUpdateGoal_Click" style="display:none;"
    />

      <table id="goalTable">
        <thead>
          <tr>
            <th>No</th>
            <th>Date</th>
            <th>Calories to Burn</th>
          </tr>
        </thead>
        <tbody>
          <% 
 
              List<Goal> ans = DBmanager.getGoals(Data.getUserId());
           for (int i = 0; i < ans.Count; i++) {
          %>
          <tr>
            <td><%= i + 1 %></td>
            <td><%= ans[i].getDate().ToString("yyyy-MM-dd") %></td>
            <td><%= ans[i].getCalories() %></td>
          </tr>
          <% } %>
     
        </tbody>
      </table>
    </form>
  </div>

</body>
</html>