<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.packageinfo");
		// fn存放该页面定义方法
		com.lz.yh.packageinfo.fn = function() {
			this.getPackageType = function(id) {
				var data = {
						1 : '推荐礼包',
						2 : '热门礼包',
						3 : '最新礼包',
						4 : '特价礼包',
						5 : '独家礼包'
				}
				return data[id];
			},
			this.getPackageCode = function(packageId) {
				$._post("package/getPackageCode.do", {
					'packageId' : packageId
				}, function(data){
					if(data.state){
						var m = data.obj;
						$('#pachageCodeShow').html('<input class="packageCode_input fll" id="packageCode_val" value='+m.packageCode+'></input><a class="packageCode_copy fll">复制</a>');
						$("a","#pachageCodeShow").bind("click",function(){
				      		var v = $("input","span[data-copy-id="+packageId+"]").val();
					      	commonFn.copyToClipboard(v);
					  	});
						$('span[data-id='+packageId+']').html($('span[data-id='+packageId+']').html() - 1);
					}else{
						if (data.code == 100001) {
							$('#login_body').show();
						}else{
							alert(data.msg);
						}
					}
				});
			},
			this.getTaohaoCode = function(packageId) {
				$._post("package/getTaohaoCode.do", {
					'packageId' : packageId
				}, function(data){
					if(data.state){
						$('#copyCode').val(packageId);
						$('#taohaoCode').val(data.obj.packageCode);
		        		$('#taohaoDiv').show();
					}else{
						if (data.code == 100001) {
							$('#login_body').show();
						}else{
							alert(data.msg);
						}
					}
				})
			},
			this.closeTaohaoDiv = function() {
				$('#taohaoDiv').hide();
			},
			this.taohaoAgain =function() {
				var packageId = $('#copyCode').val();
				$._post("package/getTaohaoCode.do", {
					'packageId' : packageId
				}, function(data){
					if(data.state){
						$('#taohaoCode').val(data.obj.packageCode);
					}else{
						if (data.code == 100001) {
							$('#login_body').show();
						}else{
							alert(data.msg);
						}
					}
				})
			}
		}
		// param存放该页面定义对象
		com.lz.yh.packageinfo.param = function() {
			this.keyName = '${keyName}'
		}
		
		var packageinfoParam = new com.lz.yh.packageinfo.param();
		var packageinfoFn = new com.lz.yh.packageinfo.fn();

		$(function(){
			document.title = '悦玩网_礼包详情';
		})
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
		<jsp:include page="../common/advertA.jsp"></jsp:include>
		
		<div class="package_content_l">
			<div class="package_content_l_lblq">
				<div class="area-title fs36">礼包领取</div>
				<div class="lblq_content">
					<c:forEach var="packages" items="${packageList}" varStatus="">
						<dl class="clb">
							<dt class="lblq_content_title">${packages.packageName }</dt>
							<dd class="lblq_content_pic marb10">
								<div>
									<img src="${fn:replace(packages.timg, '..', 'http://www.ywy7.com/tms')}" width="210" height="145" />
									<span>${packages.tType==1?'推荐礼包':packages.tType==2?'热门礼包':packages.tType==3?'最新礼包':packages.tType==4?'特价礼包':'独家礼包' }</span>
								</div>
								适用于：${packages.tsystem==1?'windows':packages.tsystem==2?'ios':'android' }
							</dd>
							<dd class="lblq_content_txt">
								<table border="0" cellpadding="5" cellspacing="0" width="635">
									<tbody>
										<tr>
											<td>游戏名称：${packages.gameName }</td>
											<td>游戏类型：角色扮演</td>
										</tr>
										<tr>
											<td>领取消耗：${fn:substringBefore(packages.tprice, '.') }</td>
											<td>领取等级：无限制</td>
										</tr>
										<tr>
											<td colspan="2">剩余情况：<span data-id="${packages.id }">${packages.tcount - packages.scount }</span></td>
										</tr>
										<tr>
											<td>到期时间：${packages.endTime }</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2">
												<a href="javascript:packageinfoFn.getPackageCode('${packages.id }')">抢码</a>
												<a href="javascript:packageinfoFn.getTaohaoCode('${packages.id }')">淘号</a>
												<span class="flr" data-copy-id="${packages.id }"></span></td>
										</tr>
									</tbody>
								</table>
							</dd>
						</dl>
					</c:forEach>
				</div>
			</div>
			<div class="package_content_l_xglb">
				<jsp:include page="./component/xglb.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="package_content_r">
			<jsp:include page="./component/content_r.jsp"></jsp:include>
		</div>
		
		<jsp:include page="../common/bottom.jsp"></jsp:include>
		
		<jsp:include page="./component/taohao.jsp"></jsp:include>
	</div>
</body>
</html>