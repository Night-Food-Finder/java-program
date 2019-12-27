 var map;
    let markerArr = [];
    let infowindow;
    let locations;
    let markerImage;
    let geocoder;
    let food;
    let eventMarker;
    let concon;
    let sizex;
    let sizey;
    concon =  new google.maps.MarkerImage("https://www.pinclipart.com/picdir/big/447-4478350_png-file-svg-fa-map-marker-png-clipart.png",null, null, null, new google.maps.Size(25, 35));



    $(".storeLn.sto_li.clearboth").mouseover((e) => {
    	//alert($(e.target).parent($('li')).attr("data-store"));
      markerEvent($(e.target).parent($('li')).attr("data-store"));
    });

    function markerEvent(storeName) {

      markerImage = new google.maps.MarkerImage("https://www.pinclipart.com/picdir/big/288-2889919_markers-clipart-coloring-page-png-download.png",
        null, null, null, new google.maps.Size(25, 35));

      map.setCenter(new google.maps.LatLng(locations[0].latitude*1, locations[0].longitude*1));

      /*마커 애니메이션 효과 주기*/
      for (let i = 0; i < markerArr.length; i++) {
        markerArr[i].setAnimation(null);
         $(".storeLn").mouseleave(()=>{
           markerArr[i].setIcon(concon);
          });

        if (markerArr[i].store_name == storeName) {
          /*가게이름 나오기*/
           infowindow.setContent(markerArr[i].store_name);
            infowindow.open(map, markerArr[i]);
            
            /*애니메이션 주기*/
            if (markerArr[i].getAnimation() !== null) {
              //eventMarker = markerArr[i];         
              
            } else {
              //markerArr[i].setAnimation(google.maps.Animation.BOUNCE);
              markerArr[i].setIcon(markerImage);
          }
        }
      }

    }

    function drawMap() {
      // 나온 마커로 중심좌표 찾기
    	console.log("arr은?", arr.length);
    	console.log("0?", arr[0]);
    	locations = arr;
    	  /*
        ['수저가', 37.5493313, 126.937287],
        ['맛있는집', 37.5529261, 126.937012],
        ['청석골', 37.5677797, 126.905045],
        ['가츠벤또', 37.5537907, 126.921552]
        
      */
    
    	  
      let y = 0;
      let x = 0;
      let u = 0;
      
      for (u = 0; u < locations.length; u++) {
        y += locations[u].latitude*1;
        x += locations[u].longitude*1;
        u = u;
        
      }
      y = y / u;
      x = x / u;


      map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: new google.maps.LatLng(y, x),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });
      geocoder = new google.maps.Geocoder;
      infowindow = new google.maps.InfoWindow();

      google.maps.event.addListener(map, 'click', function(event) {
           console.log(event.latLng.toString());
           var latLng = event.latLng.toString();
           let ss = latLng.split('(', 2)[1];
           let sms = ss.split(')', 2)[0];
           let latlngStr = sms.split(',', 2);
           let lat = latlngStr[0];
           let lng = latlngStr[1];
           let lngg = lng.replace(/\s/gi, "");
           console.log("lat", lat);
           codeLatLng(lat, lngg);
      });

      //마커 뿌려주기
      var i;
      
    

      for (i = 0; i < locations.length; i++) {
        /*
        food = locations[i][3];
       if (food === 1) {
          concon = "http://pngimg.com/uploads/turkey_food/turkey_food_PNG24.png"
          sizex = 10;
          sizey = 10;
        } else {
          concon = null;
        }*/
        /* 카테고리에 따라 마커 이미지 바꾸기 
        if (food === 1) {
          concon = new google.maps.MarkerImage("http://pngimg.com/uploads/turkey_food/turkey_food_PNG24.png",
            null, null, null, new google.maps.Size(30, 30));
        } else if(food === 2) {
          concon = new google.maps.MarkerImage("http://pngimg.com/uploads/pizza/pizza_PNG43980.png",
            null, null, null, new google.maps.Size(30, 40));
        } else {
          concon = null;
        }
        concon =  new google.maps.MarkerImage("https://www.pinclipart.com/picdir/big/288-2889919_markers-clipart-coloring-page-png-download.png",null, null, null, new google.maps.Size(30, 40));
       */
        var marker = new google.maps.Marker({
          id: i,
          position: new google.maps.LatLng(locations[i].latitude*1, locations[i].longitude*1),
          animation: google.maps.Animation.DROP,
          store_name: locations[i].storeName,
          store_lati: locations[i].latitude*1,
          store_long: locations[i].longitude*1,
          icon: concon,
          size: sizex,
          map: map
        });
        markerArr.push(marker);





        google.maps.event.addListener(marker, 'click', (function (marker, i) {
          return function () {
            infowindow.setContent(locations[i].storeName);
            infowindow.open(map, marker);
          }
        })(marker, i));

        if (marker) {
          marker.addListener('click', function () {
            map.setZoom(15);
            map.setCenter(this.getPosition());
            marker.setIcon(null);
          });
        }
      }
    };

    	

    drawMap();
    /*지도상 누른 좌표값 받기*/
 function codeLatLng(lat, lng) {
   console.log("코드", lat, lng);
    geocode =
    "https://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&key=AIzaSyCSQHW_pWBrzI8-rkc4FczxQWzCSciCJS4";
    jQuery.ajax({
        url: geocode,
        type: 'POST',
           success: function(myJSONResult){
                    if(myJSONResult.status == 'OK') {
                        var tag = "";
                        let addr = "";
                        var i;
                        for (i = 0; i < myJSONResult.results.length; i++) {
                          /*누른 좌표의 상세주소*/
                          addr = myJSONResult.results[0].formatted_address;
                          /*
                          tag += "주소 : " +myJSONResult.results[i].formatted_address+" <br />";
                          tag += "위도 : " +myJSONResult.results[i].geometry.location.lat+" <br />";
                          tag += "경도 : " +myJSONResult.results[i].geometry.location.lng+" <br />";
                          */
                        }
                        document.getElementById("message").innerHTML = addr;
                    } else if(myJSONResult.status == 'ZERO_RESULTS') {
                        alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
                    } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                        alert("할당량이 초과되었습니다.");
                    } else if(myJSONResult.status == 'REQUEST_DENIED') {
                        alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
                    } else if(myJSONResult.status == 'INVALID_REQUEST') {
                        alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
                    }
            }
          
    });
   }


 
