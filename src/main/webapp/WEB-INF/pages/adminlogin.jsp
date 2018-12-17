<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<script type="text/javscript">
$.ajax({
     type: "POST",
     url: "/admin/login",
     data: JSON.stringify({"password":"1"}),
     contentType: 'application/json',
     success: function(response) {

     },
     error:function(data){

     }
});
</script>
</body>
</html>