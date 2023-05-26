/**
 * 
 */
function list_go(page,url){
	
	if($("#gubunVal").val()=='center_emanager'){
		elist_go(page,url);
		return;
	}
	
	if($("#gubunVal").val()=='center_userList'){
		getUserList(null,page);
		return;
	}
	
	if(!url) url="list";
	if(!page) page = 1;
	$("form#jobForm input[name='page']").val(page);
	$("form#jobForm input[name='perPageNum']").val($('#perPageNum').val());
	$("form#jobForm input[name='searchType']").val($('select[name="searchType"]').val());
	$("form#jobForm input[name='keyword']").val($('input[name="keyword"]').val());
	$('form#jobForm').attr({
		action:url,
		method:'get'
	}).submit();
}
