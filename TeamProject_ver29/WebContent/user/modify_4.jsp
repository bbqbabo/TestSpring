<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
	@import url(https://fonts.googleapis.com/css?family=Playfair+Display:400,800);
	@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
	.event_baner {
	  font-family: 'Playfair Display', Arial, sans-serif;
	  position: relative;
	  float: left;
	  overflow: hidden;
	  margin: 10px 1%;
	  min-width: 230px;
	  max-width: 315px;
	  max-height: 220px;
	  width: 100%;
	  color: #000000;
	  text-align: right;
	  font-size: 16px;
	  background-color: #000000;
	}
	.event_baner * {
	  -webkit-box-sizing: border-box;
	  box-sizing: border-box;
	  -webkit-transition: all 0.35s ease;
	  transition: all 0.35s ease;
	}
	.event_baner img {
	  max-width: 100%;
	  backface-visibility: hidden;
	}
	.event_baner figcaption {
	  position: absolute;
	  top: 0;
	  bottom: 0;
	  right: 0;
	  z-index: 1;
	  opacity: 1;
	  padding: 30px 0 30px 10px;
	  background-color: #ffffff;
	  width: 40%;
	  -webkit-transform: translateX(150%);
	  transform: translateX(150%);
	}
	.event_baner figcaption:before {
	  position: absolute;
	  top: 50%;
	  -webkit-transform: translateY(-50%);
	  transform: translateY(-50%);
	  right: 100%;
	  content: '';
	  width: 0;
	  height: 0;
	  border-style: solid;
	  border-width: 120px 120px 120px 0;
	  border-color: transparent #ffffff transparent transparent;
	}
	.event_baner:after {
	  position: absolute;
	  bottom: 50%;
	  right: 40%;
	  content: '';
	  width: 0;
	  height: 0;
	  border-style: solid;
	  border-width: 120px 120px 0 120px;
	  border-color: rgba(255, 255, 255, 0.5) transparent transparent transparent;
	  -webkit-transform: translateY(-50%);
	  transform: translateY(-50%);
	  -webkit-transition: all 0.35s ease;
	  transition: all 0.35s ease;
	}
	.event_baner h3,
	.event_baner p {
	  line-height: 1.5em;
	  -webkit-transform: translateX(-30px);
	  transform: translateX(-30px);
	  margin: 0;
	}
	.event_baner h3 {
	  margin: 0 0 5px;
	  line-height: 1.1em;
	  font-weight: 900;
	  font-size: 1.4em;
	  opacity: 0.75;
	}
	.event_baner p {
	  font-size: 0.8em;
	}
	.event_baner i {
	  position: absolute;
	  bottom: 0;
	  left: 0;
	  padding: 20px 30px;
	  font-size: 44px;
	  color: #ffffff;
	  opacity: 0;
	}
	.event_baner a {
	  position: absolute;
	  top: 0;
	  bottom: 0;
	  left: 0;
	  right: 0;
	  z-index: 1;
	}
	.event_baner:hover img,
	.event_baner.hover img {
	  zoom: 1;
	  filter: alpha(opacity=50);
	  -webkit-opacity: 0.5;
	  opacity: 0.5;
	}
	.event_baner:hover:after,
	.event_baner.hover:after,
	.event_baner:hover figcaption,
	.event_baner.hover figcaption,
	.event_baner:hover i,
	.event_baner.hover i {
	  -webkit-transform: translateX(0);
	  transform: translateX(0);
	  opacity: 1;
	}

</style>	


<div>
	<figure class="event_baner">
	  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample67.jpg" alt="" />
	  <figcaption>
	    <h3>Eleanor Fant</h3>
	    <p>Which is worse, that everyone has his price, or that the price is always so low.</p>
	  </figcaption><i class="ion-ios-home-outline"></i>
	  <a href="#"></a>
	</figure>
</div>