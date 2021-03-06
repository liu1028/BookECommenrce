<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path=request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的购物小车</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

	<link rel="stylesheet"  href="<%=path%>/css/chart.css" />	
  </head>
  
  <body>
    <div class="nav_fixed">
        <ul>
            <li><a href="<%=path %>/UserDefault">首页</a><b style="color:orange;">|</b></li>
            <li><a href="<%=path %>/servlet/mychart">购物车</a><b style="color:orange;">|</b></li>
            <li><a href="booksearch.aspx">图书检索</a></li>
        </ul>
    </div>
     
     
    <div class="main">
        <div class="head">
            <div class="logo left">
                <img src="<%=path%>/images/booklogo8.png" width="140" height="70"/>
            </div>
            <div class="title left">爱我书丛———购物车</div>
            <div style="clear:both;"></div>
        </div>
        <div class="item_h">
            <div class="caltop right">
                <span class="descrip">已选书籍</span>
                <span class="t_price">¥<b class="bprice">0.00</b></span>
                <a href="javascript:void(0)" id="orderBtnTop" class="orderBtnTop">提交订单</a>
            </div>
        </div>
        <div class="items_content">
            <form>
            <ul class="chart_info">
                <li>
                    <ul class="chart_meta">
                        <li class="chck left">选择</li>
                        <li class="info left">商品信息</li>
                        <li class="empty left"></li>
                        <li class="per_price left">单价（元）</li>
                        <li class="num left">数量</li>
                        <li class="t_price left">金额（元）</li>
                        <li class="oper left">操作</li>
                    </ul>
                </li>
                <li>
                    <ul class="item" style="clear:both;">
                        <li><input type="hidden" value="bookguid" /></li>
                        <li class="chck left"><input type="checkbox" class="chck" name="chck"/></li>
                        <li class="info left">
                            <div class="left"><img src="<%=path%>/bookimages/24个比利.jpg" width="70" height="80"/></div>
                            <span class="binfo left">
                                <span class="bookname">24个比利额晚饭</span><br/>
                                <span class="pubdate"><i>2015-09-12</i></span>
                                <span class="author">沈从文</span>
                            </span>
                        </li>
                        <li class="empty left"></li>
                        <li class="per_price left mid">119.25</li>
                        <li class="num left mid">
                            <span class="reduce block">-</span>
                            <input class="num_in" id="num_in" type="text" value="1"/>
                            <span class="add">+</span>
                        </li>
                        <li class="t_price left mid">119.25</li>
                        <li class="oper left mid">
                            <a href="javascript:void(0)" class="delete block">删除</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <ul class="item" style="clear:both;">
                        <li><input type="hidden" value="bookguid" /></li>
                        <li class="chck left"><input type="checkbox" class="chck" name="chck"/></li>
                        <li class="info left">
                            <div class="left"><img src="<%=path%>/bookimages/24个比利.jpg" width="70" height="80"/></div>
                            <span class="binfo left">
                                <span class="bookname">24个比利额晚饭</span><br/>
                                <span class="pubdate"><i>2015-09-12</i></span>
                                <span class="author">沈从文</span>
                            </span>
                        </li>
                        <li class="empty left"></li>
                        <li class="per_price left mid">123.25</li>
                        <li class="num left mid">
                            <span class="reduce block">-</span>
                            <input class="num_in" type="text" value="1" />
                            <span class="add">+</span>
                        </li>
                        <li class="t_price left mid">123.25</li>
                        <li class="oper left mid">
                            <a href="javascript:void(0)" class="delete block">删除</a>
                        </li>
                    </ul>
                    
                </li>
                <li></li>
                <li></li>
                <li></li>
                <li>
                    <ul class="calbottom">
                        <li class="left"><div id="sel_all_bottom">全选</div></li>
                        <li class="left"><div id="unsel_all_bottom">全不选</div></li>
                        
                        <li class="right"><div id="orderBtnBtom" class="orderBtnBtom">提交订单</div></li>
                        <li class="right">合计：¥<span class="bprice">0.00</span></li>
                        <li class="right">已选择商品<span id="select_m">0</span>件</li>
                    </ul>
                </li>
            </ul>
            </form>
        </div>
    </div>
	<script type="text/javascript" src="<%=path %>/ui/jquery2.js"></script>
    <script type="text/javascript" src="<%=path %>/ui/layer/layer.js"></script>
    <script type="text/javascript">
        var num=0;
        var t_price=0.00;
               
        $('.chck').change(function(){
            var price=parseFloat($(this).parent().parent().find('li').eq(6).text());
            var el_num=$('#select_m');
            var el_price=$('.bprice');
            
            if($(this).is(':checked')){
                num++;
                t_price+=price;
                
                if(num==1){
                    $('#orderBtnTop').addClass('orderBtnTopallow');
                    $('#orderBtnBtom').addClass('orderBtnBtomallow');
                }
            
                el_num.text(num);
                el_price.text(t_price);
                $(this).parent().parent().css('backgroundColor','#fff8e1');              
            }else{
                num--;
                t_price-=price;
                
                if(num==0){
                    $('#orderBtnTop').removeClass('orderBtnTopallow');
                    $('#orderBtnBtom').removeClass('orderBtnBtomallow');
                }
              
                el_num.text(num);
                el_price.text(t_price);
                $(this).parent().parent().css('backgroundColor','rgb(250,250,250)');
            }
        
            return false;
        });
        
        var IsSelected=0;
        $('#sel_all_bottom').click(function(){

                var items= $('.chart_info').find('ul[class="item"]'),s_p=0.00;
                items.each(function(index,tar){
                    s_p+=parseFloat($(tar).find('li').eq(6).text());
                    $(tar).css('backgroundColor','#fff8e1');
                });
                
                t_price=s_p;
                num=items.length;
                
                $('#select_m').text(num);
                $('.bprice').text(t_price);
                
                var ids = document.getElementsByName("chck");
                for (var i = 0; i < ids.length; i++) {
                    ids[i].checked = true;
                }
                
                $('#orderBtnTop').addClass('orderBtnTopallow');
                $('#orderBtnBtom').addClass('orderBtnBtomallow');
        });
        
        
        $('#unsel_all_bottom').click(function(){
            
            var items= $('.chart_info').find('ul[class="item"]'),s_p=0.00;
            items.each(function(index,tar){
                $(tar).css('backgroundColor','rgb(250,250,250)');
            });
            
            t_price=0.00;
            num=0;
            
            $('#select_m').text(num);
            $('.bprice').text(t_price);
            
            var ids = document.getElementsByName("chck");
            for (var i = 0; i < ids.length; i++) {
                ids[i].checked = false;
            }
            
            $('#orderBtnTop').removeClass('orderBtnTopallow');
            $('#orderBtnBtom').removeClass('orderBtnBtomallow');

        });
        
        $('.reduce').click(function(){
            
            if($(this).parents('ul[class="item"]').find('input[name="chck"]').is(':checked')){
                layer.msg('亲，在未勾选该商品的时候才能对商品数量进行改变!', { shift: 6, time: 3000 });
                return; 
            }
            
            var el=$(this).siblings('input[class="num_in"]');
            var num=parseFloat(el.val());
            
            if(num>1){
                num--;
                el.val(num);
            }
            
            var per_price=parseFloat($(this).parent().parent().find('li').eq(4).text()),t_price;
            t_price=per_price*num;
            $(this).parent().parent().find('li').eq(6).text(t_price);
            
        });
        
        $('.add').click(function(){
            
            if($(this).parents('ul[class="item"]').find('input[name="chck"]').is(':checked')){
                layer.msg('亲，在未勾选该商品的时候才能对商品数量进行改变!', { shift: 6, time: 3000 });
                return; 
            }
            
            var el=$(this).siblings('input[class="num_in"]');
            var num=parseFloat(el.val());
            
            if(num<4000){
                num++;
                el.val(num);
            }      
            
            var per_price=parseFloat($(this).parent().parent().find('li').eq(4).text()),t_price;
            t_price=per_price*num;
            $(this).parent().parent().find('li').eq(6).text(t_price);
        });
        
        $('.num_in').focus(function(){
            if($(this).parents('ul[class="item"]').find('input[name="chck"]').is(':checked')){
                $(this).attr("readonly",true);
            }else{
                $(this).removeAttr("readonly",false); 
            }
        });
        
        $('.num_in').blur(function(){
            
            var num_str=$(this).val(),num=0;
            
            if(isNaN(num_str)){
                num=1;
            }else{
                num=parseFloat(num_str);
            }
            
            if(num>4000){
                num=4000;
            }else if(num<1){
                num=1;
            }
            
            
            var per_price=parseFloat($(this).parent().parent().find('li').eq(4).text()),t_price;
            t_price=per_price*num;
            $(this).parent().parent().find('li').eq(6).text(t_price);        
            
            $(this).val(num);
        });
    </script>
  </body>
</html>
