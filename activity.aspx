<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activity.aspx.cs" Inherits="DDOOCP_fitness_assignment.activity" %>
<%@ Import Namespace="DDOOCP_fitness_assignment" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Fit Flow</title>
    <link href="https://fonts.googleapis.com/css2?family=Electrolize&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        :root {
            --primary-gradient: linear-gradient(to right, #2ecc71, #00b7ff);
            --dark-bg: #1b1c1a;
            --light-text: #f0f0f0;
            --font-main: "Electrolize", sans-serif;
        }
        body {
            margin: 0;
            font-family: var(--font-main);
            background: url('Images/Simple_background.jpg') no-repeat center center fixed;
            background-size: cover;
            color: var(--light-text);
        }
        
        .atopbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background: var(--primary-gradient);
            border-radius: 0 0 12px 12px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.3);
        }
        .logo {
            display: flex;
            align-items: center;
            gap: .8rem;
        }
        .brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
        }
        .navigation a {
            margin-left: 1.5rem;
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: .3s;
        }
        .navigation a:hover {
            color: #ffe082;
        }
        .logout {
            color: #ff4d4d;
        }

        .activity-section {
            margin: 2rem auto;
            text-align: center;
            max-width: 1200px; 
        }
        .activity-section h2 {
            font-size: 2rem;
            margin-bottom: 1rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .actdiv {
            display: flex;
            flex-wrap: nowrap; 
            justify-content: center;
            gap: 1.2rem;
        }
        .actdiv .activity-card {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            gap: .5rem;
            text-decoration: none;
            background: rgba(0,0,0,0.6);
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 12px;
            font-weight: bold;
            transition: all .3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            /* Make width flexible */
            width: 100%;
            max-width: 150px;
        }
        .actdiv .activity-card:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
            background: var(--primary-gradient);
        }
        .activity-card i {
            font-size: 1.8rem;
        }

        .metdiv {
            padding:1rem 4rem;
            display:grid;
            grid-template-columns:1fr 1fr 1fr 1fr;
            gap: 1rem;
            max-width: 900px;
            margin: 2rem auto;
            background: rgba(255,255,255,0.1);
            border-radius: 12px;
        }
        .metdiv div {
            text-align: center;
            color: black;
        }
        .metdiv input {
            margin-top: .5rem;
            padding: .5rem;
            border-radius: 8px;
            border: none;
            width: 100%;
        }
        .metdiv .btn {
            padding: .8rem 1.2rem;
            background: var(--primary-gradient);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: transform .2s;
        }
        .metdiv .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,.3);
        }

        .metric-column {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-end;
        }
    </style>
</head>
<body>
    <form runat="server">
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

        <div class="activity-section">
            <h2>Choose Your Activity</h2>
            <div class="actdiv">
                <%
                  
                    List<ActivityData> arr = DBmanager.getActivities();

                   
                    Dictionary<string,string> iconMap = new Dictionary<string,string>() {
                        {"Walking", "fa-person-walking"},
                        {"Swimming", "fa-person-swimming"},
                        {"Weightlifting", "fa-dumbbell"},
                        {"Running", "fa-person-running"},
                        {"Stretching", "fa-hand-sparkles"},
                        {"Dancing", "fa-music"}
                    };

                    
                    string[] preferredOrder = { "Walking", "Swimming", "Weightlifting", "Running", "Stretching", "Dancing"};

                    
                    List<ActivityData> ordered = new List<ActivityData>();
                    foreach (string name in preferredOrder)
                    {
                        var found = arr.Find(a => a.getName().Equals(name, StringComparison.OrdinalIgnoreCase));
                        if (found != null)
                        {
                            ordered.Add(found);
                           
                            arr.Remove(found);
                        }
                    }
                   
                    ordered.AddRange(arr);

                 
                    foreach (var act in ordered) {
                        string icon = iconMap.ContainsKey(act.getName()) ? iconMap[act.getName()] : "fa-dumbbell";
                %>
                    <a href="activity.aspx?actid=<%=act.getId() %>" class="activity-card">
                        <i class="fa-solid <%=icon %>"></i>
                        <span><%=act.getName() %></span>
                    </a>
                <%
                    }
                %>
            </div>
        </div>

        <div>
            <%
                int actid = 1;
                if (Request.QueryString["actid"]!= null) {
                    actid = Convert.ToInt16(Request.QueryString["actid"]);
                }
                List<ActivityMetric> amarr = DBmanager.getMetrics(actid);
                Data.setActivityMetrics(amarr);
                string metric1 = amarr.Count > 0 ? amarr[0].getMetName() : "Metric 1";
                string metric2 = amarr.Count > 1 ? amarr[1].getMetName() : "Metric 2";
                string metric3 = amarr.Count > 2 ? amarr[2].getMetName() : "Metric 3";
            %>
        </div>

        <div class="metdiv">
            <div>
                <%=metric1 %>
                <input type="number" id="m1" required min="0" runat="server" />
            </div>
            <div>
                <%=metric2 %>
                <input type="number" id="m2" required min="0" runat="server" />
            </div>
            <div class="metric-column">
                <div>
                    <%=metric3 %>
                    <input type="number" id="m3" required min="0" runat="server" />
                </div>
                <asp:Button ID="btnActivity" runat="server" Text="Set Activity" CssClass="btn" style="margin-top: 1rem;" OnClick="btnActivity_Click1" />
            </div>
        </div>
    </form>
</body>
</html>