<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="right-container" id="right-container">
	<div class="container-fluid">
		
<!-- 		<div class="Success_msg"> -->
<!-- 			<div class="successMsg" -->
<!-- 				style="text-align: center; color: red; font-size: 18px;"> -->
<%-- 				<h4>${error}</h4> --%>

<!-- 			</div>			 -->
<!-- 		</div> -->
		
		
		
		<div class="Flexi_deposit">

			<div class="header_customer" style="margin-bottom: 30px;">
				<h3>
					<spring:message code="label.searchCustomer" />
				</h3>
			</div>
			
			<div class="Success_msg"></div>

			<div class="errorMsg"
				style="text-align: center; color: red; font-size: 18px;">
				<h4>${error}</h4>

			</div>			
		
			<div class="flexi_table">
				<form:form class="form-horizontal" id="customerForm" method="post"
					name="customerForm" commandName="customerForm">
<div class="form-group">
						<label class="col-md-4 control-label">CustomerId</label>
						<div class="col-md-6">
							<form:input path="customerID" id="customerId" class="form-control"
								placeholder="" />
							<span id="customerNameError" style="display: none; color: red;"><spring:message
									code="label.validation" /></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label"><spring:message
								code="label.customerName" /></label>
						<div class="col-md-6">
							<form:input path="customerName" id="customerName" class="form-control"
								placeholder="" />
							<span id="customerNameError" style="display: none; color: red;"><spring:message
									code="label.validation" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label"><spring:message
								code="label.contactNumber" /></label>
						<div class="col-md-6">
							<form:input path="contactNum" id="contactNumber" class="form-control" placeholder="" />
							<span id="contactNumberError" style="display: none; color: red;"><spring:message
									code="label.validation" /></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label"><spring:message
								code="label.email" /></label>
						<div class="col-md-6">
							<form:input path="email" id="email" class="form-control" placeholder="" />
							<span id="emailError" style="display: none; color: red;"><spring:message
									code="label.validation" /></span>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-md-offset-4 col-md-8">
						<span id="errorMsg" style="display:none;color:red">Please fill at least one field to search the customer.</span>
							<input type="submit" onclick="searchCustomer()"
								class="btn btn-info"
								value="<spring:message code="label.search"/>">
						</div>
					</div>

					<table align="center">

						<tr>
							<td><br></td>
						</tr>

						<c:if test="${! empty customerList}">
							<table class="table table-striped table-bordered jqtable example" style="width: 95%; margin-left: 25px;">
								<thead><tr>
									<td><b><spring:message code="label.customerName" /></b></td>
									<%-- <td><b><spring:message code="label.customerId" /></b></td> --%>
									<td><b><spring:message code="label.email" /></b></td>
									<td><b><spring:message code="label.contactNumber" /></b></td>
									<td><b><spring:message code="label.dateOfBirth" /></b></td>

									<%-- <td><b><spring:message code="label.accountNo" /></b></td> --%>
									<td><b><spring:message code="label.select" /></b></td>
								</tr>
								</thead><tbody>
								<c:forEach items="${customerList}" var="cus">

									<tr>
										<td><b> <c:out value="${cus.customerName}"></c:out></b></td>
										<%-- <td><b> <c:out value="${cus.id}"></c:out></b></td> --%>
										<td><b> <c:out value="${cus.email}"></c:out></b></td>
										<td><b> <c:out value="${cus.contactNum}"></c:out></b></td>										
										<td><b><fmt:formatDate pattern="dd/MM/yyyy" value="${cus.dateOfBirth}" /></b></td>

										<td><b><form:radiobutton path="id" name="cusId" id="cusId"
													value="${cus.id}" onclick = "onclickRadio(this.value)" /></b></td>
										<td style="display: none"><form:radiobutton
												style="display:none"  path="id" value="${cus.id}" /></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							
						</c:if>


					</table>
					<div class="form-group">
						<div class="col-md-offset-4 col-md-8">
							 
								<%-- <a
								href="bankEmp" class="btn btn-info"><spring:message
									code="label.back" /></a> --%>
									<input type="submit" class="btn btn-info" data-toggle="tooltip"
								title="Please first select the customer to click on search"
								id="goBtn" onclick="validateForm()" disabled="true"
								value="<spring:message code="label.go"/>">
						</div>
					</div>

				</form:form>
			</div>

		</div></div>
	
		
		<script>
		
		var customerId = 0;
		 function searchCustomer() {
			 var custId = document.getElementById('customerId').value;
			    var custName = document.getElementById('customerName').value;
			    var conNum = document.getElementById('contactNumber').value;
			    var emailCust = document.getElementById('email').value;
			    
			    if(custId=="" && custName=="" && emailCust=="" && conNum == ""){
			    	 document.getElementById('errorMsg').style.display='block';
			     document.getElementById('errorMsg').value="Please Insert at least one field.";
			     event.preventDefault();
			    }
			    else
			    {   
			    $("#customerForm").attr("action", "getCustomerListForSweepFacility");
			    $("#customerForm").submit();

			    }
			    }
		 
		 
			function onclickRadio(value) {

				customerId = value;
				document.getElementById("goBtn").disabled = false;
			}

			function validateForm() {
			/* 	alert(customerId);
			 */
				//alert($("input:radio[name='cusId']:selected")==true);
// 				var customerId= document.getElementById('id').value;
				$("#customerForm").attr("action", "sweepDepositFacility?customerId=" + customerId);
				$("#customerForm").submit();

			}

			$(document).ready(function() {
				//$('#cusId').checked=false;
				//document.getElementById('cusId').checked = false;
			});
		</script>