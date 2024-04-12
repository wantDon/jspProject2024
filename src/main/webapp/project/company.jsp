<!-- company.jsp -->


<%@page contentType="text/html; charset=UTF-8" %>
<%@page import = "project.CompanyBean" %>
<%@page import = "project.UserBean" %>
<%@page import = "project.LocationBean" %>
<%@page import="java.util.Vector"%>
<%@page import="project.UtilMgr"%>
<jsp:useBean id="uMgr" class="project.UserMgr"/>
<jsp:useBean id="lMgr" class="project.LocationMgr"/>

<%
						String tr5 = "";     //회사 전화번호
						String tr6 = "";   // 회사 정보

						String comnum1 = ""; // 회사 번호
									
			
						Vector<LocationBean> lvlist = new Vector<LocationBean>();
						lvlist = lMgr.getLocaName();
						String[] idArray = new String[lvlist.size()];
						
						for (int i = 0; i < lvlist.size(); i++) {
						    idArray[i] = lvlist.get(i).getId();
						}
						
						int totalRecord = 0; // 총 게시물수
						int numPerPage = 10; // 페이지당 레코드 개수 (5,10,20,30)
						int pagePerBlock = 5; //블럭당 페이지 개수
						int totalPage = 0; //총 페이지 개수
						int totalBlock = 0; // 총 블럭 개수
						int nowPage = 1; //현재 페이지
						int nowBlock = 1; //현재 블럭
						
						//요청된 numPerPage처리
						
						if(request.getParameter("numPerPage")!=null){
							numPerPage = UtilMgr.parseInt(request, "numPerPage");
						}
						
						//검색에 필요한 변수
							/*name subject content*/
						String keyField = "", keyWord = "";
						if(request.getParameter("keyWord")!=null){
							keyField = request.getParameter("keyField");
							keyWord = request.getParameter("keyWord");
						}	
						
						totalRecord = uMgr.getTotalCompany(keyField, keyWord);
						
						if(request.getParameter("nowPage")!=null){
								nowPage = UtilMgr.parseInt(request, "nowPage");
							}
						
						//sql에 들어갈 start랑 cnt가 필요
						int start =(nowPage*numPerPage) - numPerPage;
						int cnt = numPerPage;
						
						
						//전체 페이지 개수
						
						totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
						
						// 전체 블럭 개수
						
						totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
						
						//현재 블럭
						
						nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>

 <%@ include file="adminHeader.jsp" %>
 <%@ include file="adminSideBar.jsp" %>
    
    <script type="text/javascript">
    
    var idArray = [
	    <% for(int i = 0; i < lvlist.size(); i++) { %>
	    "<%= lvlist.get(i).getId() %>"<%= i < lvlist.size() - 1 ? "," : "" %>
	    <% } %>
	];
    
    
    
   
   document.addEventListener('DOMContentLoaded', function() {
	    var editButtons = document.querySelectorAll('.editbtn'); 
	    var delButtons = document.querySelectorAll('.delbtn');
		
	    
	    
	    delButtons.forEach(function(button){
	    	button.addEventListener('click', function(){
	    		var tr = this.closest('tr');
	    		var isEditing = tr.getAttribute('data-editing')
	    		var userNumTd = tr.querySelector('td[data-id]')
	    		
	    		if(isEditing === 'true'){
	    			
	                var comnum = userNumTd.getAttribute('data-id');
	                
	                if(comnum) {
	                    comnum1 = comnum;
	                }
	    			
	    			var form = document.getElementById('companyDelForm');
	    			
	    			form.elements['comnum1'].value = comnum1;
	    			
    	            if(form) {
    	                form.submit();
    	                console.log('폼이 제출되었습니다!');
    	            } else {
    	                console.log('폼이 존재하지 않습니다.');
    	            }
	    			
	    		}else{
	    			console.log("삭제 버튼 비활성화")
	    		}
	    		
	    	});
	    });
	    
	    
	    
	    
	    editButtons.forEach(function(button) {
	        button.addEventListener('click', function() {
	            var tr = this.closest('tr'); // '수정' 버튼이 포함된 행을 찾습니다.
	            var isEditing = tr.getAttribute('data-editing'); // 현재 행의 수정 상태를 확인합니다.
	            var delButtons = document.getElementsByClassName('delbtn');
	            var userNumTd = tr.querySelector('td[data-id]')
	            
	            if(isEditing === 'true') {        
	                var comnum = userNumTd.getAttribute('data-id');
	                
	                
	                if(comnum) {
	                    comnum1 = comnum;
	                }
	                     
	                
	                
	                [tr].forEach(function(row) {
	                    Array.from(row.cells).forEach(function(td, index) {
	                        if(row === tr && (index == 5 || index == 6 )) {
	                            var input = td.querySelector('input');
	                            if(input && index !== 0) {
	                                // 각 인덱스에 맞는 변수에 input 필드의 값을 할당합니다.
	                                switch(index) {
	                                    case 5: tr5 = input.value; break;
	                                    case 6: tr6 = input.value; break;
	                                }
	                                td.innerHTML = input.value; // input 필드의 값을 셀의 새로운 텍스트로 설정합니다.
	                            }
	                        }
	                    });
	                    
	                    
	    	            var form = document.getElementById('companyEditForm');

		    	         form.elements['tr5'].value = tr5;
		    	         form.elements['tr6'].value = tr6;
		    	         form.elements['comnum1'].value = comnum1;
	    	            
	    	            if(form) {
	    	                form.submit();
	    	                console.log('폼이 제출되었습니다!');
	    	            } else {
	    	                console.log('폼이 존재하지 않습니다.');
	    	            }
	                    row.setAttribute('data-editing', 'false');
	                                        
	                    
	                });
	                tr.setAttribute('data-editing', 'false');
	                this.textContent = '수정';
	                this.id = 'editbtn'; 
	                
	            } else {
	            	
	            	
	            	[tr].forEach(function(row) {
	            	    Array.from(row.cells).forEach(function(td, index) {
	            	        if(index != 0) { 
	            	            if(row === tr && (index == 5 || index == 6)) {
	            	                // 텍스트 입력 필드를 생성하는 조건
	            	                var currentText = td.textContent;
	            	                var inputField = document.createElement('input');
	            	                inputField.type = 'text';
	            	                inputField.value = currentText;
	            	                td.innerHTML = '';
	            	                td.appendChild(inputField);
	            	            }
	            	        } // if
	            	    }); //array
	            	    row.setAttribute('data-editing', 'true');
	            	}); //foreach

	            	// '저장' 버튼의 텍스트와 id를 설정
	            	this.textContent = '저장';
	            	this.id = 'savebtn';             
	            }
	        }); //button
	    }); //edit 
	}); //doc 
   
   

	//검색   
   
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
   
	
   //페이징

   function pageing(page) {
	    document.readnumFrm.nowPage.value = page;
	    document.readnumFrm.submit();
	}
   
	function block(block){
		document.readnumFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
		document.readnumFrm.submit();
	}
   
</script>
    
    
    
    
    
    
    <style>
    /* 테이블의 전체적인 스타일 */
    #datatable {
        width: 100%;
        border-collapse: collapse;
        font-family: 'Dongle' , serif; 
        font-size: 22px;
    }

    /* 테이블 헤더 스타일 */
    #datatable thead th {
        background-color:RGB(108, 117, 125);
        color: white; /* 글자색 */
        padding: 5px; /* 패딩 */
        text-align: center;
        border-radius:  calc(0.375rem - 1px);
    }

    /* 테이블 바디 스타일 */
    #datatable td {
        padding: 6px; /* 패딩 */
        text-align: center; /* 텍스트 정렬 */
    }

    /* 테이블 행 스타일 */
    #datatable tr:nth-child(even) {
        background-color: white; /* 짝수 행 배경색 */
    }

    
        /* 호버 효과 */
    #datatable tr:hover {
        background-color: #ddd; /* 호버 시 배경색 */
    }
    
		    .dongle-regular {
		  font-family: "Dongle", sans-serif;
		  font-weight: 400;
		  font-style: normal;
		  font-size: 22px;
		}
		
		 .dongle-title {
		  font-family: "Dongle", fantasy;
		  font-weight: 500;
		  font-style: normal;
		  font-size: 40px;
		}
    
    
        .font {
        color: white; /* .datatable-title 클래스를 가진 요소의 텍스트 색상을 하얀색으로 변경 */
        
        }
        
    /* 테이블의 전체적인 스타일 */
    #datatable2 {
        width: 100%;
        border-collapse: collapse;
        font-family: 'Dongle' , serif; 
        font-size: 22px;
    }

    /* 테이블 헤더 스타일 */
    #datatable2 thead th {
        background-color: black; /* 배경색 */
        color: white; /* 글자색 */
        padding: 5px; /* 패딩 */
        text-align: center;
    }

    /* 테이블 바디 스타일 */
    #datatable2 td {
        padding: 6px; /* 패딩 */
        text-align: center; /* 텍스트 정렬 */
    }
    
    /* 테이블의 셀에 대한 스타일 */
    #datatable2 th, #datatable2 td {
        border: 1px solid gray; /* 오른쪽에 검은색 선 추가 */
    }
    
        /* 짝수 번째 행 스타일 */
    #datatable2 tr:nth-child(even) {
        background-color: #f2f2f2; /* 진한 배경색 */
    }
    
		form * {
            display: inline;
            margin-right: 10px;
            font-family:  'Dongle' , serif; 
            font-size: 26px;
            position: relative; /* 또는 absolute, fixed 등 */
    		left: 7%; /* 왼쪽에서 떨어진 위치 */
    		top: 5px; /* 상단에서 떨어진 위치 */
            
        }
        
			        
				.search-form {
				    width: auto; /* 너비를 자동으로 조정하도록 변경 */
				    text-align: center;
				    margin-bottom: 20px;
				    position: relative; /* 상대적 위치 지정 */
				}
				
				.search-input {
				    display: inline-block;
				    margin-right: 5px;
				}
				
				.search-select,
				.search-text {
				    font-size: 20px;
				    padding: 6px;
				}
				
				.search-button,
				.register-button,
				.refresh-btn {
				    background-color: #4CAF50;
				    color: white;
				    border: none;
				    padding: 10px 20px;
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 20px;
				    cursor: pointer;
				    border-radius: 5px;
				    margin-left: 10px; /* 요소들 간의 간격 조정 */
				}
				
				/* 호버 효과 */
				.search-button:hover,
				.register-button:hover,
				.refresh-btn:hover {
				    background-color: #45a049;
				}
				
				.register-button {
				    background-color: #008CBA; /* 회원 등록 버튼의 배경색 조정 */
				}
				
				.register-button:hover {
				    background-color: #005f7f;
				}
				
				.refresh-btn {
				    background-color: lime; /* 새로 고침 버튼의 배경색 조정 */
				    margin-left: 0; /* 왼쪽 여백을 0으로 조정 */
				}

								
				.paging-container {
				    text-align: center;
				    margin-top: 20px;
				}
				
				.paging-container a {
				    display: inline-block;
				    padding: 5px 10px;
				    margin: 0 3px;
				    border: 1px solid #ccc;
				    text-decoration: none;
				    color: #333;
				    border-radius: 3px;
				}
				
				.paging-container a.active {
				    background-color: #4CAF50;
				    color: white;
				    border: 1px solid #4CAF50;
				}
				
				.paging-container a:hover {
				    background-color: #f2f2f2;
				}
				
				.paging-container span {
				    display: inline-block;
				    padding: 5px 10px;
				    margin: 0 3px;
				    color: #666;
				}
    
</style>
    
    
    
					
<div id="layoutSidenav_content">
    <main>
    
    
    
        <h1 class="mt-4 dongle-title">&nbsp;&nbsp;회사 등록</h1>
        <hr>
        
					<div>
					<form name="searchFrm" class="search-form">
					    <div class="search-input">
					        <select name="keyField" class="search-select">
					            <option value="id">회사명</option>
					            <option value="companyinfo">회사정보</option>
					        </select>
					        <input type="text" size="16" name="keyWord" class="search-text" placeholder="검색어 입력">
					    </div>
					    <button type="button" class="search-button" onClick="check()">검색</button>
					    <a href="#" class="register-button">회사 등록</a>
					    <a href = "company.jsp" class = "refresh-btn">새로 고침</a>
					    <input type="hidden" name="nowPage" value="1">
					</form>
					</div>

				            <hr>
			        
			        
        
                        <div class="card">
       								 <table border="1" id = "datatable2">
          					  <thead>
										  <tr>
										  	<th>회사 번호</th>
                                            <th>회사명</th>
                                            <th>우편 번호</th>
                                            <th> 주소</th>
                                            <th>회사에 속한 고객 수</th>
                                            <th>회사 전화번호</th>
                                            <th>회사 정보</th>
                                            <th>관리</th>
                         				</tr>			
     					       </thead>
     					       
     					       
       						     <tbody>
         						             <%
													Vector<CompanyBean> cvlist = uMgr.getCompany(keyField, keyWord, start, cnt);
       						             			int listSize = cvlist.size();
       						             			
													if(cvlist.isEmpty()){
										%>
											<tr>
												<td colspan="8" align="center">
													등록된 회사가 없습니다.
												</td>
											</tr>
										<%
												}else{							          
											for(int i = 0; i <numPerPage; i++){
												
												if(i == listSize) break;
												
												CompanyBean cBean = cvlist.get(i);

												

											    
												
										%>	
            							<tr>
                                            <td data-id=<%=cBean.getNum()%>><%=cBean.getNum()%></td>
                                            <td> <%=cBean.getId()%></td>
                                            <td><%=cBean.getPostnum()%></td>
                                            <td><%=cBean.getCity() + " " + cBean.getStreetaddr()%></td>
                                            <td><%=cBean.getSize()%></td>
                                            <td><%=cBean.getCallnum()%></td>
                                            <td><%=cBean.getCompanyinfo()%></td>
                                            <td>
                                            <button class="editbtn" data-id="<%=i%>" >수정</button>
               								 <button class="delbtn" data-id="<%=i%>">삭제</button>
               								 </td>
                    				     </tr>
                          			 <% }%>
                                  <% }%>
            
			            </tbody>
			            
			            
				<tr >
					<td colspan = "11">
					<div class="paging-container">
								<!-- 이전 블럭 -->
								<%if(nowBlock>1){ %>
								<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
								<%} %>
								
								<!-- 페이징 -->
								<%
										int pageStart = (nowBlock-1)*pagePerBlock+1;
										int pageEnd = (pageStart+pagePerBlock)<totalPage?pageStart+pagePerBlock:totalPage+1;
										for(;pageStart<pageEnd;pageStart++){
											%>
											<a href="javascript:pageing('<%=pageStart%>')">
											<!-- 현재페이지와 동일한 페이지는 font color = blue 세팅 -->
											<%if(nowPage==pageStart){ %><font color = "blue"><% }%>
											[<%=pageStart%>]
											<%if(nowPage==pageStart){ %></font><%} %>
											</a>
											
										<%}
								%>
								
								<!-- 다음 블럭 -->
								<%if(totalBlock>nowBlock){ %>
								<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
								<%} %>
					</div>
					</td>
				</tr>
			            
			            
			            
			        </table>
			        </div>
			    </main>
			    
<form id = "companyEditForm" name="companyEdit" method="post" action="companyEditProc.jsp" >
    <input name="tr5"  type="hidden">
    <input name="tr6"  type="hidden">
    <input name="comnum1"  type="hidden">
</form>

<form id = "companyDelForm" name="companyDel" method="post" action="companyDelProc.jsp" >
    <input name="comnum1"  type="hidden">
</form>

<form name="readnumFrm">
	<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
</form>

<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="num" >
</form>





 <%@ include file="adminFooter.jsp" %>
</div>
            
            
            
            
            
            