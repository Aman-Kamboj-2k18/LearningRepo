<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="Flexi_deposit">
	
	<div class="header_customer">
		<h3 align="center">
			<spring:message code="label.fixedDepositRates" />
		</h3>
	</div>

<div class="flexi_table">
	<form:form action="getFDRates" method="post" name="fixedDeposit" commandName="fdRatesForm"
		onsubmit="return val();">
		<table align="center" width="400">
		<tr>
				<td><b><spring:message
							code="label.fdID" /></b></td>
				<td><form:select id="fdId" path="fdId" class="myform-control">
				<form:option value="select"></form:option>
								<form:options items="${fdRatesForm.fdRates}"
									itemValue="fdId" itemLabel="fdId" />
							</form:select>
							<div id="fdIdError" style="display: none; color: red;"><spring:message code="label.validation"/></div>
							</td>
			</tr>
		
		</table>

		<div class="col-sm-12 col-md-12 col-lg-12">
			<table align="center" class="f_deposit_btn">
				<tr>
					<td><input type="submit" class="btn btn-info" onclick="showDialog(); return false;" value="<spring:message code="label.go"/>"></td>
					<td><a href="bankEmp" class="btn btn-info"><spring:message code="label.back" /></a></td>
				</tr>

			</table>
		</div>
	</form:form>
	</div>

	</div>
	<script>
	function val() {

		var canSubmit = true;
		var accountNo = document.getElementById('fdId').value;
		var account = accountNo.toString();

		if (account == 'select') {
			document.getElementById('fdIdError').style.display = 'block';
			canSubmit = false;
		} else {
			document.getElementById('fdIdError').style.display = 'none';
		}

		if (canSubmit == false) {
			return false;
		}

	}
</script>
<style>
	.flexi_table {
    margin-bottom: 210px;
}
</style>