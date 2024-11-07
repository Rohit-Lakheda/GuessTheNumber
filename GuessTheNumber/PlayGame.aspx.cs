using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuessTheNumber
{
    public partial class PlayGame : System.Web.UI.Page
    {
        int min = 1;
        int max;
        int randomnumber;
        int count = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                difficultyPanel.Visible = true;
                gamePanel.Visible = false;
            }
            else
            {
                if (Session["randomnumber"] != null)
                {
                    randomnumber = (int)Session["randomnumber"];
                    count = (int)Session["count"];
                    max = (int)Session["max"];
                }
            }
        }

        protected void Difficulty_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            string difficulty = button.CommandArgument;
            switch (difficulty)
            {
                case "easy":
                    max = 100;
                    break;
                case "medium":
                    max = 200;
                    break;
                case "hard":
                    max = 300;
                    break;
            }
            Random rand = new Random();
            randomnumber = rand.Next(min, max + 1);
            Session["randomnumber"] = randomnumber;
            Session["count"] = count;
            Session["max"] = max;

            lbl1.Text = $"Guess The Number between 1 and {max}.";
            difficultyPanel.Visible = false; // Hide difficulty selection
            gamePanel.Visible = true; // Show game panel
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
           if (string.IsNullOrWhiteSpace(txt1.Text.Trim()))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "showAlert();", true);
                return;
            }
            int userGuess = Convert.ToInt32(txt1.Text);
            if (userGuess > max || userGuess < min)
            {
                lblresult.Text = "Number Must be between 1 and " + max + ".";
                return;
            }

            count = (int)Session["count"] + 1;

            if (userGuess == randomnumber)
            {
                lblresult.Text = "Hurray! You Got it in " + count + " attempts";
            }
            else if (userGuess < randomnumber)
            {
                lblresult.Text = "Ops! Your Guess is less than the number. Try again!";
            }
            else if (userGuess > randomnumber)
            {
                lblresult.Text = "Ops! Your Guess is more than the number. Try again!";
            }

            Session["count"] = count;
        }

        protected void btnChangeDifficulty_Click(object sender, EventArgs e)
        {
            difficultyPanel.Visible = true; // Show difficulty selection
            txt1.Text = "";
            lblresult.Text = "";
            gamePanel.Visible = false; // Hide game panel
            Session.Abandon(); // Reset session to clear previous game data
        }
    }
}