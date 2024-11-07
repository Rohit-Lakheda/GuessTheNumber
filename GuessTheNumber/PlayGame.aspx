<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlayGame.aspx.cs" Inherits="GuessTheNumber.PlayGame" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guess The Number!</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>
        body {
            background-color: #1f1d36;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #e0e0e0;
        }
        .container {
            background-color: #2d2b55;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.7);
            border-radius: 20px;
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .form-control {
            background-color: #3c3a6e;
            border: 1px solid #504b8b;
            color: #e0e0e0;
            margin-bottom: 15px;
            font-size: 1.1rem;
        }
        .btn-primary, .btn-difficulty, .btn-secondary {
            width: 100%;
            padding: 10px 0;
            margin: 10px 0;
            font-size: 1.1rem;
            border-radius: 5px;
            border: none;
        }
        .btn-primary {
            background-color: #6a0dad;
            color: #fff;
        }
        .btn-difficulty, .btn-secondary {
            background-color: #4b4b8b;
            color: #fff;
        }
        .btn-primary:hover, .btn-difficulty:hover, .btn-secondary:hover {
            opacity: 0.8;
        }
        .result {
            margin-top: 20px;
            font-size: 1.2rem;
            font-weight: bold;
            color: #b388eb;
        }
        .guess-label {
            font-weight: bold;
            font-size: 1.3rem;
            margin-bottom: 15px;
            display: block;
            color: #e0e0e0;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function showAlert() {
            Swal.fire({
                icon: 'warning',
                title: 'Oops...',
                text: 'Please enter a number!',
                background: '#2d2b55',
                color: '#e0e0e0',
                confirmButtonColor: '#6a0dad'
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Panel runat="server" ID="difficultyPanel" Visible="true">
                <asp:Label runat="server" CssClass="guess-label" Text="Select Difficulty"></asp:Label>
                <asp:Button runat="server" ID="Easy" CssClass="btn btn-primary btn-difficulty" Text="EASY" OnClick="Difficulty_Click" CommandArgument="easy" />
                <asp:Button runat="server" ID="Medium" CssClass="btn btn-primary btn-difficulty" Text="MEDIUM" OnClick="Difficulty_Click" CommandArgument="medium" />
                <asp:Button runat="server" ID="Hard" CssClass="btn btn-primary btn-difficulty" Text="HARD" OnClick="Difficulty_Click" CommandArgument="hard" />
            </asp:Panel>
            <asp:Panel runat="server" ID="gamePanel" Visible="false">
                <asp:Label runat="server" ID="lbl1" CssClass="guess-label"></asp:Label>
                <asp:TextBox runat="server" ID="txt1" CssClass="form-control" placeholder="Enter your guess"></asp:TextBox>
                <asp:Button runat="server" ID="btnsubmit" OnClick="btnsubmit_Click" CssClass="btn btn-primary" Text="Submit Guess" />
                <asp:Label runat="server" ID="lblresult" CssClass="result"></asp:Label>
                <asp:Button runat="server" ID="btnChangeDifficulty" OnClick="btnChangeDifficulty_Click" CssClass="btn btn-secondary btn-difficulty" Text="Change Difficulty" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
