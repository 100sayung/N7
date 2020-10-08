	<div
		style="width: auto; background-color: white-space; color: white; padding: 1%;">
		<!-- <span style="padding-left: 5px"><a href="#" onclick="saleinsert()"><button>매출/매입등록</button></a></span> -->
		<span style="padding-left: 5px"><a href="#"
			onclick="window.open('comPany','comlist','width=1350,height=500')"><button>거래처등록</button></a></span>
		<span style="padding-left: 5px"><button id="getshipment">입고/출하조회</button></span>
		<span style="padding-left: 5px"><button id="getList">매출/매입데이터조회</button></span>
		<span style="padding-left: 5px"><button id="taxbill">세금계산서인쇄</button></span>
		<span style="padding-left: 5px"><button id="saledetails">거래명세표인쇄</button></span>
		<span style="padding-left: 5px"><button id="approval">결재요청하기</button></span>
 		<span style="padding-left: 5px"><button type="button" id="delete">삭제</button></span>

	</div>
		<div
			style="width: auto; background-color: #3D6B9B; color: white; padding: 1%;">매출/매입
			전표관리</div>
		<span style="padding-left: 5px"><input id="select" type="text" /></span>
		<select id="choice" name="s_saleSelect">
			<option value="num">전표번호</option>
			<option value="company">거래처명</option>
			<option value="employee">입력자</option>
		</select>
		<button id="search2" type="button">검색</button>
		매출<input onclick="getList('AS')" type='radio' name="sale" value='AS'>
		매입<input onclick="getList('AP')" type='radio' name="sale" value='AP'>

		<!-- <form action="rest/saleinsert" method="post"> -->
		<form id="saleInfo">
		<div id="comInfo"
			style="height: 80px; padding-top: 15px; background-color: #F8F7F7;">
			<table id="main2">
				<thead>
					<tr>
						<td>전표번호</td>
						<td><input class="data" type="text" value="자동생성" readonly /></td>
						<td>종류</td>
						<td><select class="data" name="s_num">
								<option value="">--</option>
								<option value="AS">매출</option>
								<option value="AP">매입</option>
						</select></td>
						<td>유형</td>
						<td><select class="data" name="s_kind">
								<option value="과세">과세</option>
								<option value="비과세">비과세</option>
						</select></td>
					</tr>
					<tr id="company">
						<td><button type="button" onclick="window.open('/erp/home/comInfo','comInfo','width=550,height=700')">검색</button>거래처명</td>
						<td><input id="comname" class="data" type="text" name="s_company" readonly/></td>
						<td>사업자번호</td>
						<td><input id="comnum" class="data" type="text" name="s_comnum" readonly/></td>
						<td>입력자</td>
						<td><input class="data" type="text" name="s_employee" value="${hrCode}" readonly/></td>
						<td></td>
					</tr>
				</thead>
			</table>
		</div>
		<!-- </form> -->
			<span id="detailebutton"></span>
			 <span id='plusorminus'>
			<input type="number" id="qty" min="1" style="width: 64px;">
			<button type="button" id="addList"> 행추가</button>
			<button type="button" id="deleteCheck">삭제</button>
			</span>

			<!-- <form id="saleInfodetaile"> -->

		<div id="ListTable" style="background-color: #ECEBEA;">
			<table id="testTable"
				summary="Code page support in different versions of MS Windows."
				border="1">
				<thead>
					<tr>
						<td>체크</td>
						<td>품목</td>
						<td>수량</td>
						<td>단가(원)</td>
						<td>공급가액(원)</td>
						<td>부가세액(원)</td>
						<td>합계(원)</td>
						<td>적요</td>
					</tr>
				</thead>
				<tbody id="tBody">
					<tr>
						<td><input type="checkbox" class="check"></td>
						<td><input class="data" type="text" name="s_pkind" /></td>
						<td><input class="data" type="text" name="s_cnt" /></td>
						<td><input class="price" type="text" name="s_price" /></td>
						<td><input class="data" type="text"
							name="s_price2" /></td>
						<td><input class="data" type="text" name="s_tax" /></td>
						<td><input class="data" type="text" name="s_total" /></td>
						<td><input class="data" name="s_memo" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
 		<button id="insert" type="button" onclick="saleInsertInfo()">등록</button>

