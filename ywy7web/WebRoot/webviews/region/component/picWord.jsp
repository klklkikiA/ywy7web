<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

	<div id="fsD12" class="focus" style=" height:506px;  width: 1180px;margin-bottom:10px;">
								<div id="D1pic12" class="fPic" style=" height: 506px;  width: 1180px;">
								<div class="fbg">
									<div class="D1fBt" id="D1fBt2">
										<a href="javascript:void(0)" hidefocus="true" target="_self" class=""></a>
										<a href="javascript:void(0)" hidefocus="true" target="_self" class="current"></a>
										<a href="javascript:void(0)" hidefocus="true" target="_self" class=""></a>
										<a href="javascript:void(0)" hidefocus="true" target="_self" class=""></a>
									</div>
								</div>
								<span class="prev"></span><span class="next"></span>
	</div>
</div>
<script type="text/javascript">
//图文	
		$(function(){
			$.ajax({
		        type: "POST",
		        url: "news/getNewsImages.do",
		     	data: {
		     		"tType":4,
					"perNumber": 4
		        },
		        success: function(data) {
               		$.each(data.resultList, function(i, m) {
						if($(".fcon","#D1pic12").length < 4){
							$("#D1pic12").append('<div class="fcon" style="display: none;"><a href="'+ commonFn.getRelLink("news") + '/image/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.turl)+' style="opacity: 1; height:506px  !important;  width:1180px !important;"></a><span class="shadow"><a href="javascript:">'+m.tdesc+'</a></span></div>');
		        		}
               		});
					Qfast(false, 'widgets', function() {
						K.tabs({
							id: 'fsD12',
							// 焦点图包裹id
							conId: "D1pic12",
							// ** 大图域包裹id
							tabId: "D1fBt2",
							tabTn: "a",
							conCn: '.fcon',
							// ** 大图域配置class
							auto: 1,
							// 自动播放 1或0
							effect: 'fade',
							// 效果配置
							eType: 'click',
							// ** 鼠标事件
							pageBt: true,
							// 是否有按钮切换页码
							bns: ['.prev', '.next'],
							// ** 前后按钮配置class
							interval: 3000
							// ** 停顿时间
						})
					});
			    }
			});
		})
</script>	
	



