<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Registrasi</title>

<spring:url value="/resources/css/jquery-ui.css" var="jqueryUICss" />
<link rel="stylesheet" href="${jqueryUICss}">

<spring:url value="/resources/js/jquery-1.12.4.js" var="jquery" />
<script src="${jquery}"></script>

<spring:url value="/resources/js/jquery-ui.js" var="jqueryUIJs" />
<script src="${jqueryUIJs}"></script>

<spring:url value="/resources/js/jquery.validate.min.js" var="jqueryValidationJs" />
<script src="${jqueryValidationJs}"></script>

<script>
$(document).ready(
	function ($) {
    	$('#formRegistrasi').validate(
    		{ 
        		rules: {
            		namaPelanggan: {
                		required: true
            		},
            		email: {
                		required: true,
                		email: true
            		},
            		telp: {
                		required: true,
                		digits: true
            		},
            		userName: {
                		required: true,
                		maxlength: 10
            		},
            		password: {
                		required: true,
                		minlength: 7
            		}
        		}
    		}
    	);
	}
);
</script>

<script>
$( 
	function() {
		$("#hobbyIsRequired").hide();
	} 
);
function hurufDepanKapital(s,x) {
	s = x ? s.toLowerCase() : s;  
	return s.replace(
		/(\b)([a-zA-Z])/g,
	    function(hurufDepan) {
	    	return hurufDepan.toUpperCase();
	    }
	);
}
function cekHobi() {
	var hobi1 = document.getElementById('hobi1');
	var hobi2 = document.getElementById('hobi2');
	var hobi3 = document.getElementById('hobi3');
	var hobi4 = document.getElementById('hobi4');
	var hobi5 = document.getElementById('hobi5');
	var hobi = hobi1.checked+hobi2.checked+hobi3.checked+hobi4.checked+hobi5.checked;
	if (hobi=='0') {
		hobi1.checked = true;
		$( 
			 function() {
			    $("#hobbyIsRequired").dialog();
			 } 
		);
	}
}
</script>

<style>
.bodyText {font-family:arial;font-size:15px;color:steelblue}
.bgColor  {background-color:#eeeeee;border:1px solid #cccccc;color:green;font-weight:bold}
</style>

</head>

<body class="bodyText">

	<h2>Form Registrasi</h2>
	
	<div id="hobbyIsRequired" title="Hobby">
  		<p>At least 1 hobby must be chosen!</p>
	</div>
	
	<form:form id="formRegistrasi" modelAttribute="pelanggan" action="prosesRegistrasi" method="post">
	
    	<table align="left">
        	<tr>
            	<td><form:label path="namaPelanggan">Nama Pelanggan</form:label></td>
            	<td align="center">:&nbsp;</td>
                <td><form:input size="30" onchange="javascript:this.value = hurufDepanKapital(this.value,true);" 
                class="bgColor" path="namaPelanggan" name="namaPelanggan" id="namaPelanggan" /></td>
            </tr>
        	<tr>
            	<td><form:label path="jenisKelamin">Jenis Kelamin</form:label></td>
            	<td align="center">:&nbsp;</td>
                <td>
                	<form:radiobutton path="jenisKelamin" checked="checked" name="jenisKelamin" id="jenisKelamin" value="Pria" />Pria
                	<form:radiobutton path="jenisKelamin" name="jenisKelamin" id="jenisKelamin" value="Wanita"/>Wanita
                	<form:radiobutton path="jenisKelamin" name="jenisKelamin" id="jenisKelamin" value="Lain-lain"/>Lain-lain
                </td>
            </tr>
        	<tr>
            	<td><form:label path="hobi">Hobi</form:label></td>
            	<td align="center">:&nbsp;</td>
                <td>
                	<form:checkbox onchange="javascript:cekHobi();" path="hobi" checked="checked" name="hobi1" id="hobi1" value="Nonton" />Nonton
                	<form:checkbox onchange="javascript:cekHobi();" path="hobi" name="hobi2" id="hobi2" value="Musik" />Musik
                	<form:checkbox onchange="javascript:cekHobi();" path="hobi" checked="checked" name="hobi3" id="hobi3" value="Browsing" />Browsing
                	<form:checkbox onchange="javascript:cekHobi();" path="hobi" name="hobi4" id="hobi4" value="Makan-makan" />Makan-makan
                	<form:checkbox onchange="javascript:cekHobi();" path="hobi" checked="checked" name="hobi5" id="hobi5" value="Jalan-jalan" />Jalan-jalan
                </td>
            </tr>
        	<tr>
            	<td><form:label path="email">E-mail</form:label></td>
            	<td align="center">:&nbsp;</td>
                <td><form:input size="40" class="bgColor" path="email" name="email" id="email" /></td>
            </tr>
        	<tr>
            	<td><form:label path="telp">Telp.</form:label></td>
            	<td align="center">:&nbsp;</td>
                <td><form:input size="25" class="bgColor" path="telp" name="telp" id="telp" /></td>
            </tr>
        	<tr>
            	<td><form:label path="userName">User Name</form:label></td>
            	<td align="center">:&nbsp;</td>
                <td><form:input size="15" class="bgColor" path="userName" name="userName" id="userName" /></td>
            </tr>
            <tr>
                <td><form:label path="password">Password</form:label></td>
            	<td align="center">:&nbsp;</td>
                <td><form:password size="20" class="bgColor" path="password" name="password" id="password" /></td>
            </tr>
            <tr>
            	<td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3"><form:button id="daftar" name="daftar">Daftar</form:button>&nbsp;&nbsp;
                <input type="reset" id="reset" name="reset" value="Reset" /></td>
            </tr>
       </table>
       
    </form:form>
    
</body>
</html>

