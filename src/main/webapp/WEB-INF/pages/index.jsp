<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>Facebook Login JavaScript Example</title>
    <meta charset="UTF-8">
</head>
<body>
<script>

    var data={"token":"123"};
    $.ajax({
        type: "POST",
        url:"/User/fbtoken",
        data: JSON.stringify(data),
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        dataType: 'json',
        success: function(response) {

        },
        error:function(data){

        }
    });

    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        window.token=response.authResponse.accessToken;
        //  console.log(response.authResponse.accessToken);

        if (response.status === 'connected') {
            console.log(response.authResponse.accessToken);
            // Logged into your app and Facebook.
            testAPI();
        } else {
            // The person is not logged into your app or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
            // login();
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        console.log("inside login");
        testAPI();
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    // function login() {

    window.fbAsyncInit = function () {
        FB.init({
            appId: '2015383252115992',
            cookie: true,  // enable cookies to allow the server to access
                           // the session
            xfbml: true,  // parse social plugins on this page
            version: 'v2.8' // use graph api version 2.8
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };
    //}

    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me?fields=name,email ', function(response) {
            // console.log(response)
            console.log('Successful login for: ' + response.name+ " "+response.email+" "+response.id);
            var data={"token":window.token};
            $.ajax({
                type: "POST",
                url:"/User/fbtoken",
                data: JSON.stringify(data),
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                contentType: 'application/json',
                success: function(response) {

                },
                error:function(data){

                }
            });
            /*
                        $.postJSON = function(url, data, callback) {
                            return jQuery.ajax({
                                headers: {
                                    'Accept': 'application/json',
                                    'Content-Type': 'application/json'
                                },
                                'type': 'POST',
                                'url': url,
                                'data': JSON.stringify(data),
                                'dataType': 'json',
                                'success': callback
                            });
                        };
            */
            // window.location("/signup");
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
        });
    }
</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<fb:login-button scope="public_profile,email,user_posts" onlogin="checkLoginState();">
</fb:login-button>
<%--<button style="background: blue" onclick="checkLoginState()">Facebook</button>--%>
<p>j</p>
<div id="status">
</div>

</body>
</html>