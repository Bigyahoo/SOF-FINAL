<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>

<style>

body{
    font-family: Arial;
    background:#f5f5f5;
}

.container{
    width:350px;
    margin:100px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

input{
    width:100%;
    padding:10px;
    margin:10px 0;
}

button{
    width:100%;
    padding:10px;
    background:#ff6600;
    color:white;
    border:none;
}

.error{
    color:red;
}

</style>

</head>
<body>

<div class="container">

    <h2>Đăng nhập</h2>

    <p class="error">
        ${error}
    </p>

	<form action="login" method="post">
	
	    <input
	        type="email"
	        name="email"
	        placeholder="Email">
	
	    <input
	        type="password"
	        name="password"
	        placeholder="Password">
	
	    <button type="submit">
	        Đăng nhập
	    </button>
	
	</form>

</div>

</body>
</html>