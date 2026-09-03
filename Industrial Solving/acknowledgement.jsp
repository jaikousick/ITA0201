<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.company.it.model.ServiceRequest" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Request Acknowledgement</title>
    <style>
        :root {
            --primary-color: #16a34a;
            --card-bg: #ffffff;
            --bg-color: #f8fafc;
            --text-color: #1e293b;
            --border-color: #e2e8f0;
            --badge-low: #dcfce7;
            --badge-low-text: #15803d;
            --badge-med: #fef9c3;
            --badge-med-text: #a16207;
            --badge-high: #fee2e2;
            --badge-high-text: #b91c1c;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background: var(--card-bg);
            width: 100%;
            max-width: 700px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border: 1px solid var(--border-color);
        }

        .success-banner {
            text-align: center;
            background-color: #f0fdf4;
            border: 1px solid #bbf7d0;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .success-banner .icon {
            font-size: 40px;
            color: var(--primary-color);
            margin-bottom: 8px;
        }

        .success-banner h2 {
            color: #14532d;
            font-size: 22px;
            margin-bottom: 4px;
        }

        .success-banner p {
            color: #166534;
            font-size: 14px;
        }

        .details-section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 16px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 12px;
            padding-bottom: 6px;
            border-bottom: 2px solid #f1f5f9;
        }

        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .detail-item {
            background-color: #f8fafc;
            padding: 12px 16px;
            border-radius: 8px;
            border: 1px solid #edf2f7;
        }

        .detail-label {
            font-size: 12px;
            font-weight: 600;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 4px;
        }

        .detail-value {
            font-size: 15px;
            font-weight: 600;
            color: #0f172a;
        }

        .detail-item.full-width {
            grid-column: span 2;
        }

        .badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .badge-low { background-color: var(--badge-low); color: var(--badge-low-text); }
        .badge-medium { background-color: var(--badge-med); color: var(--badge-med-text); }
        .badge-high { background-color: var(--badge-high); color: var(--badge-high-text); }

        /* Question 4.c & 4.d: MVC Architecture Explanation Section */
        .mvc-explanation {
            background-color: #f1f5f9;
            padding: 20px;
            border-radius: 10px;
            border-left: 4px solid #2563eb;
            margin-top: 25px;
        }

        .mvc-explanation h3 {
            font-size: 16px;
            color: #1e3a8a;
            margin-bottom: 10px;
        }

        .mvc-list {
            list-style: none;
            margin-bottom: 12px;
        }

        .mvc-list li {
            font-size: 13px;
            margin-bottom: 6px;
            color: #334155;
        }

        .mvc-flow {
            font-size: 13px;
            color: #475569;
            line-height: 1.5;
            background: #ffffff;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #cbd5e1;
        }

        .actions {
            text-align: center;
            margin-top: 25px;
        }

        .btn-back {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            transition: background-color 0.2s;
        }

        .btn-back:hover {
            background-color: #1d4ed8;
        }

        @media (max-width: 550px) {
            .details-grid {
                grid-template-columns: 1fr;
            }
            .detail-item.full-width {
                grid-column: span 1;
            }
        }
    </style>
</head>
<body>

<div class="container">

    <%
        // Retrieve the ServiceRequest model object passed from ServiceRequestServlet
        ServiceRequest req = (ServiceRequest) request.getAttribute("serviceRequest");
        
        if (req != null) {
            String priorityClass = "badge-medium";
            if ("Low".equalsIgnoreCase(req.getPriority())) priorityClass = "badge-low";
            else if ("High".equalsIgnoreCase(req.getPriority())) priorityClass = "badge-high";
    %>

    <!-- Question 4.b: Clear Confirmation Message -->
    <div class="success-banner">
        <div class="icon">✓</div>
        <h2>Service Request Submitted Successfully!</h2>
        <p>Your technical complaint has been logged and assigned to the IT Support Team.</p>
    </div>

    <!-- Question 4.a: Display Service Request Details -->
    <div class="details-section">
        <div class="section-title">Request Summary</div>
        
        <div class="details-grid">
            <div class="detail-item">
                <div class="detail-label">Service Request Number</div>
                <div class="detail-value" style="color: #2563eb;"><%= req.getRequestNumber() %></div>
            </div>

            <div class="detail-item">
                <div class="detail-label">Employee ID</div>
                <div class="detail-value"><%= req.getEmployeeId() %></div>
            </div>

            <div class="detail-item">
                <div class="detail-label">Employee Name</div>
                <div class="detail-value"><%= req.getEmployeeName() %></div>
            </div>

            <div class="detail-item">
                <div class="detail-label">Department</div>
                <div class="detail-value"><%= req.getDepartment() %></div>
            </div>

            <div class="detail-item">
                <div class="detail-label">Problem Category</div>
                <div class="detail-value"><%= req.getProblemCategory() %></div>
            </div>

            <div class="detail-item">
                <div class="detail-label">Priority</div>
                <div class="detail-value">
                    <span class="badge <%= priorityClass %>"><%= req.getPriority() %></span>
                </div>
            </div>

            <div class="detail-item full-width">
                <div class="detail-label">Problem Description</div>
                <div class="detail-value" style="font-weight: normal; font-size: 14px;"><%= req.getProblemDescription() %></div>
            </div>
        </div>
    </div>

    <% } else { %>
        <div class="success-banner" style="background-color: #fef2f2; border-color: #fca5a5;">
            <h2 style="color: #991b1b;">No Request Data Found</h2>
            <p style="color: #b91c1c;">Please submit the request via the IT Service Request form.</p>
        </div>
    <% } %>

    <!-- Question 4.c & 4.d: MVC Component Identification and Architecture Explanation -->
    <div class="mvc-explanation">
        <h3>📐 MVC Architecture Component Mapping & Flow</h3>
        
        <ul class="mvc-list">
            <li><strong>Model:</strong> <code>ServiceRequest.java</code> — Encapsulates request data attributes without UI dependencies.</li>
            <li><strong>View:</strong> <code>serviceRequest.jsp</code> (Input Form) & <code>acknowledgement.jsp</code> (Result View) — Handle user presentation.</li>
            <li><strong>Controller:</strong> <code>ServiceRequestServlet.java</code> — Handles request processing, input validation, object creation, and forwarding.</li>
        </ul>

        <div class="mvc-flow">
            <strong>Execution Flow:</strong><br>
            Employee → <code>serviceRequest.jsp</code> → POST Request → <code>ServiceRequestServlet</code> → Validate Input → Instantiate <code>ServiceRequest</code> Model → Set Request Attributes → Forward Request → <code>acknowledgement.jsp</code> → Employee Confirmation.
        </div>
    </div>

    <div class="actions">
        <a href="serviceRequest.jsp" class="btn-back">Submit Another Request</a>
    </div>

</div>

</body>
</html>
