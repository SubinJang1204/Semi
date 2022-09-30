<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<style type="text/css">
*{
font-family: 'Gowun Dodum', sans-serif;
}
  .container {
    padding: 80px 120px;
    
  }
  #myCarousel{
 
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
   
  }
  .person:hover {
    border-color: #f1f1f1;
    
  }
  .carousel-inner img {
    
    width: 100%; /* Set width to 100% */
    margin: auto;
  }
  .carousel-inner{
  background-image: none;
  
  }
  .carousel-caption h3 {
    color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
    background: #f1f1f1;
    color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail p {
    margin-top: 15px;
    color: #555;
  }
  .btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  .modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
  }
  
  .modal-header, .modal-body {
    padding: 40px 50px;
  }

  .form-control {
    border-radius: 0;
  }
  
 .best_wrap{
 width:1200px;
 height:auto;
 display:inline-block;
 position:relative;
 margin-top:90px;
 }
 .best{
 width:300px;
 height:300px;
 margin:30px 30px;
 position:relative;
 display:inline-block;
 }
 .best img{
 border-radius:50%;

 }
 .best img:hover{
 opacity:0.3;
 background-color:#eee;
 transition:0.4s;
 }

 .event_wrap{
 width:1200px;
 height:auto;
 display:inline-block;
 position:relative;
 }
 .event{
 width:300px;
 height:300px;
 margin:30px 30px;
 position:relative;
  display:inline-block;
 }
 
 .event img{
 border-radius:50%;
 }
 .event img:hover{
 opacity:0.3;
 background-color:#eee;
 transition:0.4s;
 }
 
  footer {
    background-color: #FF7BAC;;
    color: #fff;
    padding: 32px;
    margin-top:100px;
  }
  footer a {
    color: #fff;
  }
  footer a:hover {
    color: #fff;
    text-decoration: none;
  }  
  .form-control {
    border-radius: 0;
  }
  textarea {
    resize: none;
  }
</style>
</head>
<body>
<center>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active" style="margin-top:47px;">
        <img src="images/banner4.png" width="1920" height="600">
        <div class="carousel-caption">
       <!--    <h3>한가위 특별 행사</h3>
          <p>The atmosphere in New York is lorem ipsum.</p>  -->
        </div>      
      </div>

      <div class="item" style="margin-top:47px;">
        <img src="images/banner5.png" width="1920" height="600">
        <div class="carousel-caption">
        <!--   <h3>한가위 특별 행사</h3>
          <p>Thank you, Chicago - A night we won't forget.</p> -->
        </div>      
      </div>
    
      <div class="item" style="margin-top:47px;">
        <img src="images/banner6.png" width="1920" height="600">
        <div class="carousel-caption">
        <!--   <h3>한가위 특별 행사</h3>
          <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p> -->
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev" style="background-image: none;">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" style="background-image: none;">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<div class="best_wrap">
<h3 style="color:#8e8e8e;font-weight:400;float:left;position:relative;left:100px;margin-botton:30px;">BEST</h3><br><br>
<p style="color:#8e8e8e;font-weight:201;float:left;position:relative;left:45px;">가장 사랑받는 제품들만을 모았습니다.</p><br><br>
<span class="glyphicon glyphicon-chevron-right" style="color:#FF7BAC;font-size:12px;font-weight:300px;top:-1px;float:left;position:relative;left:97px;">자세히보기</span>

<div class="best">
<img src="images/prd1.png">
</div>

<div class="best">
<img src="images/prd2.png">
</div>

<div class="best">
<img src="images/prd3.png">
</div>

</div>

<div class="event_wrap" style="margin-top:50px;">
<h3 style="color:#8e8e8e;font-weight:400;">EVENT</h3>
<div class="event">
<img src="images/prd1.png">
</div>

<div class="event">
<img src="images/prd2.png">
</div>

<div class="event">
<img src="images/prd3.png">
</div>
</div>

<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>Team 3 <a href="" data-toggle="tooltip" title="Visit w3schools">SemiProject</a></p> 
</footer>
</center>
</body>
</html>