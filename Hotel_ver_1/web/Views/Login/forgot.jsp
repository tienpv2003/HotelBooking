<!doctype html>
<html lang="en">

    <head>
        <title>Login 01</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Views/Login/css/style.css">
        <style>
            /* Style for both the submit button and the link */
            .styled-link {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                color: #007bff;
                text-decoration: none;
                border: 1px solid #007bff;
                border-radius: 4px;
                background-color: transparent;
                text-align: center;
                cursor: pointer;
            }

            /* Additional styling for the submit button to remove default appearance */
            .styled-link-submit {
                appearance: none; /* Remove default styling */
                -webkit-appearance: none;
                -moz-appearance: none;
                border: none; /* Remove default border */
                background: none; /* Remove default background */
                padding: 0; /* Remove default padding */
            }

        </style>
    </head>

    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Booking System</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="login-wrap p-4 p-md-5">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <span class="fa fa-user-o"></span>
                            </div>
                            <h3 class="text-center mb-4">Forgot Password</h3>
                            <form action="ForgotServlet" method="post" class="login-form">
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control rounded-left" placeholder="Email" required>
                                </div>

                                <div class="form-group">
                                    <input type="submit" value="Send" class="styled-link styled-link-submit">
                                </div>
                                <div class="form-group d-md-flex">


                                    <div class="w-60 text-md-left">
                                        <a href="signin">Back to log in</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>