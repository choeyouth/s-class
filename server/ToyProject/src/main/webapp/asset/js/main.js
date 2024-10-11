//webapp > asset > js > main.js


//해당 객체가 브라우저에 의해 로딩되었을 때 발생
//document 읽기를 완료한 직후에 발생
$(document).ready(()=> {
	
	//댓글 쓰기
	$('#btnAddComment').click(()=>{
		
		$.ajax({
			type: 'POST',
			url: '/toy/board/addcomment.do',
			data: {
				content: $('#addComment input[name=content]').val(),
				bseq: $('#view tr:nth-child(1) td:last-child').text()
			},
			dateType: 'json',
			success: function(result) {
				
				if (result.result == 1) {
					//alert('댓글 쓰기 성공!!')
					loadComment();
					$('#addComment input[name=content]').val('');
					
				} else {
					alert('댓글 쓰기 실패;;');
				}
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
	});//click

	/* 
		
		<tr>	
			<td>
				<div>댓글 내용입니다.</div>
				<div>2024-10-11 14:10:05</div>
			</td>
			<td>
				<div>
					<div>홍길동(hong)</div>
					<div>
						<span class="material-symbols-outlined">delete</span>
						<span class="material-symbols-outlined">edit_note</span>
					</div>
				</div>
			</td>
		</tr>
	
	 */

	//댓글 목록 가져오기
	function loadComment() {
		
		$.ajax({
			type: 'GET',
			url: "/toy/board/listcomment.do",
			data: {
				bseq: $('#view tr:nth-child(1) td:last-child').text()
			},
			dataType: 'json',
			success: function(list) {
				
				$('#comment tbody').html('');
				
				$(list).each((index, item)=>{
					
					let temp = `
					<tr data-seq="${item.seq}">
						<td>
							<div>${item.content}</div>
							<div>${item.regdate}</div>
						</td>
						<td>
							<div>
								<div>${item.name}(${item.id})</div>`;
					
					if (lv != 0 && (auth == item.id || lv == 2)) {		
					
					temp += 	`<div>
									<span class="material-symbols-outlined" onclick="delComment(${item.seq});">delete</span>
									<span class="material-symbols-outlined" onclick="editComment(${item.seq});">edit_note</span>
								</div>`;
					}
						
					temp += `</div>
						</td>
					</tr>
					
					`;
					
					$('#comment tbody').append(temp);
					
				});
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
	}
	
	loadComment();
	
	$('#addComment input[name=content]').keydown((evt)=>{
		if (evt.keyCode == 13) {
			$('#btnAddComment').click();
		}
	});
	
});//ready

function delComment(cseq) {
	

	if (!confirm('정말 삭제하겠습니까?')) { return; }
	
	const tr = $(event.target).parents('tr');
	//alert(tr[0].nodeName);
	$.ajax({
		type: 'POST',
		url: '/toy/board/delcomment.do',
		data: {
			cseq: cseq
		},
		dataType: 'json',
		success: function(result) {
			
			if (result.result == 1) {
				//alert('성공');
				//alert(event.target);
				tr.remove();
				
			} else {
				alert('댓글 삭제 실패;;')
			}
		},
		error: function(a,b,c) {
			console.log(a,b,c);
		}
	});
}

function editComment(cseq) {
	
	//이전 눌렀던 수정 폼을 되돌리기
	$('#comment tbody tr').each((index, item)=>{
		if($(item).children().eq(0).children().eq(0).children().length) {
			const content = $(item).children().eq(0).children().eq(0).children().eq(0).val();
			$(item).children().eq(0).children().eq(0).html('');
			$(item).children().eq(0).children().eq(0).text(content);
		}
	});
	
	const div = $(event.target).parents('tr').children().eq(0).children().eq(0);
	const content = div.text();
	const seq = $(event.target).parents('tr').data('seq');
	
	div.html('');
	
	$('<input type="text" style="width: 535px;">')
		.val(content)
		.keydown((evt)=>{
			
			if (evt.keyCode == 13) {
				
				const txt = evt.target;
				
				$.ajax({
					type: 'POST',
					url: '/toy/board/editcomment.do',
					data: {
						content: $(evt.target).val(),
						seq: seq
					},
					dataType: 'json',
					success: function(result) {
						
						if (result.result == 1) {
						
							let item = $(txt).parents('tr');
							
							const content = $(item).children().eq(0).children().eq(0).children().eq(0).val();
							$(item).children().eq(0).children().eq(0).html('');
							$(item).children().eq(0).children().eq(0).text(content);					

						} else {
							alert('댓글 수정 실패;;')
						}
						
					},
					error: function(a,b,c) {
						console.log(a,b,c)
					}
				});
				
			} else if (evt.keyCode == 27) {
				
				let item = $(evt.target).parents('tr');
				
				const content = $(item).children().eq(0).children().eq(0).children().eq(0).val();
				$(item).children().eq(0).children().eq(0).html('');
				$(item).children().eq(0).children().eq(0).text(content);
			}
		})
		.appendTo(div);
}








