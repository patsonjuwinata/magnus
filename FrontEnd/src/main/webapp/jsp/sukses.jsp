<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Registrasi</title>

<spring:url value="/resources/css/jquery-ui.css" var="jqueryUICss" />
<link rel="stylesheet" href="${jqueryUICss}">

<spring:url value="/resources/css/jquery.dataTables.min.css" var="jqueryDataTablesCss" />
<link rel="stylesheet" href="${jqueryDataTablesCss}">

<spring:url value="/resources/js/jquery-1.12.4.js" var="jquery" />
<script src="${jquery}"></script>

<spring:url value="/resources/js/jquery-ui.js" var="jqueryUIJs" />
<script src="${jqueryUIJs}"></script>

<spring:url value="/resources/js/jquery.dataTables.min.js" var="jqueryDataTablesJs" />
<script src="${jqueryDataTablesJs}"></script>

<spring:url value="/resources/js/jquery.tablesorter.min.js" var="jqueryTableSorterJs" />
<script src="${jqueryTableSorterJs}"></script>

<script>
$( 
	function() {
    	$("#dialog").dialog();
  	} 
);
</script>
 
<script>  
$(document).ready(function() {
	var simpleSort = false;
	if (simpleSort) {
		$('#dataSemuaPelanggan').tablesorter();
	} else {
    	$('#dataSemuaPelanggan').DataTable( 
    		{
        		"order": [[ 0,"asc"]]
    		} 
    	);
	}
});
</script>

<script>
window.setTimeout('repaintTableAfterSort()',1000);
function repaintTableAfterSort() {
	var colMax = 7;
	var colCount = 0;
	var css = 'bgDetail2';
	var lastRow = '';
	var rows = document.getElementsByTagName('td'); 
	if (rows!=null) {
		if (rows.length>0) {
			for (var i=0;i<rows.length;i++) {
				if (rows[i].id!==null) {
					if (rows[i].id.indexOf('row_')!=-1) { 
						if (lastRow=='') {
							lastRow = rows[i].id;
						}
						if (lastRow!=rows[i].id) {
							if (colCount>=colMax) {
								colCount = 1;
								lastRow = rows[i].id;	
								if (css=='bgDetail1') {
									css = 'bgDetail2';
								} else {
									css = 'bgDetail1'; 
								}
								rows[i].className = css;
							}	
						} else {
							rows[i].className = css;	
							colCount++;
						}
					}
				}
			}
		}
	}
	window.setTimeout('repaintTableAfterSort()',1000);
}
</script>    
    
<style>
.bodyText {font-family:arial;font-size:15px;color:steelblue}
.bgColor {background-color:#eeeeee;border:1px solid #cccccc;color:green;font-weight:bold}
.bgHeader {background-color:steelblue;border:1px solid black;width:150px;color:white}
.bgDetail1 {background-color:#cccccc;border:1px solid black;width:150px;color:navy;font-size:12px}
.bgDetail2 {background-color:#eeeeee;border:1px solid black;width:150px;color:navy;font-size:12px}
.tableBorder {border:1px solid white;padding:10px}
</style>
	
</head>

<body class="bodyText">

	<h2>Form Registrasi</h2>

	<div id="dialog" title="Registrasi Berhasil!">
  		<p>	Selamat, <b>${data.namaPelanggan}</b> telah berhasil didaftarkan!</p>
	</div>
 
	Selamat, <b>${data.namaPelanggan}</b> telah berhasil didaftarkan!
	<br /><br />

	<form id="formRegistrasi" action="daftar" method="get">
	
    	<table id="dataPelanggan" align="left">
        	<tr>
            	<td>Nama Pelanggan</td>
            	<td align="center">:&nbsp;</td>
                <td><input type="text" size="30" value="${data.namaPelanggan}" class="bgColor" readonly name="namaPelanggan" id="namaPelanggan" /></td>
            </tr>
        	<tr>
            	<td>Jenis Kelamin</td>
            	<td align="center">:&nbsp;</td>
                <td>
					<c:if test = "${data.jenisKelamin=='Pria'}">                
                		<input readonly checked type="radio" name="jenisKelamin" id="jenisKelamin" value="Pria" />Pria
                		<input readonly type="radio" name="jenisKelamin" id="jenisKelamin" value="Wanita" />Wanita
                		<input readonly type="radio" name="jenisKelamin" id="jenisKelamin" value="Lain-lain" />Lain-lain
					</c:if>
					<c:if test = "${data.jenisKelamin=='Wanita'}">                					
                		<input readonly type="radio" name="jenisKelamin" id="jenisKelamin" value="Pria" />Pria
                		<input readonly checked type="radio" name="jenisKelamin" id="jenisKelamin" value="Wanita" />Wanita
                		<input readonly type="radio" name="jenisKelamin" id="jenisKelamin" value="Lain-lain" />Lain-lain
					</c:if>
					<c:if test = "${data.jenisKelamin=='Lain-lain'}">                					
                		<input readonly type="radio" name="jenisKelamin" id="jenisKelamin" value="Pria" />Pria
                		<input readonly type="radio" name="jenisKelamin" id="jenisKelamin" value="Wanita" />Wanita
                		<input readonly checked type="radio" name="jenisKelamin" id="jenisKelamin" value="Lain-lain" />Lain-lain
					</c:if>       	
                </td>
            </tr>
        	<tr>
            	<td>Hobi</td>
            	<td align="center">:&nbsp;</td>
                <!--<td><input type="text" size="100" value="${data.hobi}" class="bgColor" readonly name="hobi" id="hobi" /></td>-->
                <td>
                	<c:set value="${data.hobi}" var="hobi" scope="session" />
                	<c:choose>
   						<c:when test = "${fn:containsIgnoreCase(hobi,'Nonton')}">
                			<input checked readonly type="checkbox" value="Nonton" name="hobi1" id="hobi1" />Nonton
                		</c:when>
                		<c:otherwise>
                			<input readonly type="checkbox" value="Nonton" name="hobi1" id="hobi1" />Nonton
                		</c:otherwise>
    				</c:choose>
                	<c:choose>
   						<c:when test = "${fn:containsIgnoreCase(hobi,'Musik')}">
                			<input checked readonly type="checkbox" value="Musik" name="hobi2" id="hobi2" />Musik
                		</c:when>
                		<c:otherwise>
                			<input readonly type="checkbox" value="Musik" name="hobi2" id="hobi2" />Musik
                		</c:otherwise>
    				</c:choose>
                	<c:choose>
   						<c:when test = "${fn:containsIgnoreCase(hobi,'Browsing')}">
                			<input checked readonly type="checkbox" value="Browsing" name="hobi3" id="hobi3" />Browsing
                		</c:when>
                		<c:otherwise>
                			<input readonly type="checkbox" value="Browsing" name="hobi3" id="hobi3" />Browsing
                		</c:otherwise>
    				</c:choose>
                	<c:choose>
   						<c:when test = "${fn:containsIgnoreCase(hobi,'Makan-makan')}">
                			<input checked readonly type="checkbox" value="Makan-makan" name="hobi4" id="hobi4" />Makan-makan
                		</c:when>
                		<c:otherwise>
                			<input readonly type="checkbox" value="Makan-makan" name="hobi4" id="hobi4" />Makan-makan
                		</c:otherwise>
    				</c:choose>
                	<c:choose>
   						<c:when test = "${fn:containsIgnoreCase(hobi,'Jalan-jalan')}">
                			<input checked readonly type="checkbox" value="Jalan-jalan" name="hobi5" id="hobi5" />Jalan-jalan
                		</c:when>
                		<c:otherwise>
                			<input readonly type="checkbox" value="Jalan-jalan" name="hobi5" id="hobi5" />Jalan-jalan
                		</c:otherwise>
    				</c:choose>
                </td>
            </tr>
        	<tr>
            	<td>E-mail</td>
            	<td align="center">:&nbsp;</td>
                <td><input type="text" size="40" value="${data.email}" class="bgColor" readonly name="email" id="email" /></td>
            </tr>
        	<tr>
            	<td>Telp.</td>
            	<td align="center">:&nbsp;</td>
                <td><input type="text" size="25" value="${data.telp}" class="bgColor" readonly name="telp" id="telp" /></td>
            </tr>
        	<tr>
            	<td>User Name</td>
            	<td align="center">:&nbsp;</td>
                <td><input type="text" size="15" value="${data.userName}" class="bgColor" readonly name="userName" id="userName" /></td>
            </tr>
            <tr>
                <td>Password</td>
            	<td align="center">:&nbsp;</td>
                <td><input type="text" size="20" value="${data.password}" class="bgColor" readonly name="password" id="password" /></td>
            </tr>
            <tr>
            	<td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3"><input type="submit" name="daftarLagi" id="daftarLagi" value=" Daftar Lagi " /></td>
            </tr>
            <tr>
            	<td colspan="3">&nbsp;</td>
            </tr>
            <tr>
            	<td colspan="3">            	
    				<table id="dataSemuaPelanggan" align="left" class="tableBorder">
    					<thead>
        					<tr>
            					<th class="bgHeader">Nama Pelanggan</th>
            					<th class="bgHeader">Jenis Kelamin</th>
            					<th class="bgHeader">Hobi</th>
            					<th class="bgHeader">E-mail</th>
            					<th class="bgHeader">Telp.</th>
            					<th class="bgHeader">User Name</th>
            					<th class="bgHeader">Password</th>
        					</tr>
        				</thead>
        				<tbody>
        					<c:set var="count" value="0" scope="page" />
        					<c:forEach items="${data.semuaPelanggan}" var="semuaPelanggan">
        						<c:set var="count" value="${count+1}" scope="page" />
    							<c:choose>
    								<c:when test = "${count%2=='0'}">
    									<tr>
            								<td id="row_${count}" class="bgDetail1"><c:out value="${semuaPelanggan.namaPelanggan}" /></td>
            								<td id="row_${count}" class="bgDetail1"><c:out value="${semuaPelanggan.jenisKelamin}" /></td>
            								<td id="row_${count}" class="bgDetail1"><c:out value="${semuaPelanggan.hobi}" /></td>
            								<td id="row_${count}" class="bgDetail1"><c:out value="${semuaPelanggan.email}" /></td>
            								<td id="row_${count}" class="bgDetail1"><c:out value="${semuaPelanggan.telp}" /></td>
            								<td id="row_${count}" class="bgDetail1"><c:out value="${semuaPelanggan.userName}" /></td>
            								<td id="row_${count}" class="bgDetail1"><c:out value="${semuaPelanggan.password}" /></td>
        								</tr>
            						</c:when>
            						<c:otherwise>
    									<tr>
            								<td id="row_${count}" class="bgDetail2"><c:out value="${semuaPelanggan.namaPelanggan}" /></td>
            								<td id="row_${count}" class="bgDetail2"><c:out value="${semuaPelanggan.jenisKelamin}" /></td>
            								<td id="row_${count}" class="bgDetail2"><c:out value="${semuaPelanggan.hobi}" /></td>
            								<td id="row_${count}" class="bgDetail2"><c:out value="${semuaPelanggan.email}" /></td>
            								<td id="row_${count}" class="bgDetail2"><c:out value="${semuaPelanggan.telp}" /></td>
            								<td id="row_${count}" class="bgDetail2"><c:out value="${semuaPelanggan.userName}" /></td>
            								<td id="row_${count}" class="bgDetail2"><c:out value="${semuaPelanggan.password}" /></td>
        								</tr>            							
            						</c:otherwise>
            					</c:choose>
							</c:forEach>   
						</tbody> 		
   					</table>
            	</td>
            </tr>
        </table>
       
    </form>
    
</body>
</html>


