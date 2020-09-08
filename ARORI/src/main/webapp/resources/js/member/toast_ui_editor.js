	    // Toast Ui Editor
		const Editor = toastui.Editor;
		const { colorSyntax } = Editor.plugin;
		const { codeSyntaxHighlight } = Editor.plugin;
		const { tableMergedCell } = Editor.plugin;
		
		const editor = new Editor({
			  el: document.querySelector('#editor'),
			  height: '600px',
			  initialEditType: 'markdown',
			  previewStyle: 'vertical',
			  plugins: [colorSyntax, codeSyntaxHighlight, tableMergedCell],
			  hooks:{
				'addImageBlobHook':function(blob, callback){
					console.log(blob, callback);
					
					var frm = new FormData();
					frm.append("f", blob);
					
					console.log(frm);
					
					axios({
						contentType: false,
						processData: false,
						url:"/arori/imgAjax/upload/" ,
						method:"post",
						data:frm
					}).then(function(resp) {
						//resp.data.no;
						console.log(resp)
					})
					//callback("반환된 다운로드 주소");
				}
			}
		});