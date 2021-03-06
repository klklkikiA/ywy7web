<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.raiderinfo");
		// fn存放该页面定义方法
		com.lz.yh.raiderinfo.fn = function() {
			
		}
		// param存放该页面定义对象
		com.lz.yh.raiderinfo.param = function() {
			
		}
		
		var raiderinfoParam = new com.lz.yh.raiderinfo.param();
		var raiderinfoFn = new com.lz.yh.raiderinfo.fn();

		$(function(){
			document.title = '悦玩网_攻略详情';
			$._getAdvert('#advertA','13','585','100','2','0');
			$._getAdvert('#advertB','13','330','150','1','1');
		})
		
		function setHeight(height){
			$("#new_iframe").css({"height":height});
		}
	</script>
</head>
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
		</div>
		<div id="advertA" data-type="13" data-index="0" class="adverta">
			<jsp:include page="../common/advertA.jsp"></jsp:include>
		</div>
		<div class="video_content_location">当前位置：悦玩网 &gt; 攻略频道 &gt; 攻略详情</div>
		
		<div class="info_content">
			<div class="info_content_l">
				<div class="info_content_l_c">
					<iframe src="raiders/content/${raiderId}.do" id="new_iframe" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
				</div>
			</div>
			
			<div class="info_content_r">
				<jsp:include page="./component/kjdh.jsp"></jsp:include>
				<jsp:include page="./component/lqlb.jsp"></jsp:include>
				<div id="advertB" data-type="13" data-index="1">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
			</div>
		</div>
		
		<jsp:include page="../common/bottom.jsp"></jsp:include>
	</div>
</body>
</html>