// JavaScript Document

	var n=0;
	var t = 0 ;
	var flag = true ;
	function init(){
		var sample=document.getElementById("sample");
		var lbls=document.getElementsByClassName("lable");
		for(var i= 0 ;i<lbls.length;i++){
				lbls[i].onmouseover= function(){
					//让时间停下来
					clearTimeout(t) ;
					//让图片显示为相应的图片
					var b = this.name * 1 ;
					//拿到img对象
					var img = document.getElementById("sampleimg") ;
					img.src = "images/label" + b + ".jpg" ;
					
					//清空所有label控件的样式
					clearStyle() ;

					//让label的样式变成one的样式
					this.style.border="2px solid #c23200";
					
				}

				lbls[i].onmouseout =function(){
					//alert(flag) ;
					//隔1秒调用fun()										
					t = setTimeout("fun()",2000) ;						
					
					//改变当前n的值
					n = this.name*1 ;
					
					this.style.border="2px solid white";

					//将flag变量的值设为FALSE			
				}
			}
			fun() ;
		}

	function fun(){
			n ++;
			if(n == 6)
				n =1 ;
			
			//拿到图片对象
			var img = document.getElementById("sampleimg") ;
			img.src = "images/label" + n + ".jpg" ;
			
			//设定相应的label控件的样式
			t = setTimeout("fun()",2000) ;
		}
		
	function clearStyle(){
			//清空所有label控件的样式
			//拿到所有的label控件
		var lbls=document.getElementsByClassName("lable");
			for(var i = 0 ; i <lbls.length ;i++){
				lbls[i].className = "" ;
			}
		}
		
	function increate(){
		var num=document.getElementById("qualtity");
		num.innerText=num.innerText*1+1;	
		}
			
	function reduce(){
		var num=document.getElementById("qualtity");
		if(num.innerText>1)
		num.innerText=num.innerText*1-1;	
		}