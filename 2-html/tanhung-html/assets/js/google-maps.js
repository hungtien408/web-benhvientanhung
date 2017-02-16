// Defining variables that need to be available to some functions
var map, infoWindow;
var rendererOptions = {
    draggable: true
};
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
//Thay dia chi web
var endAddress = "10.7729015,106.6701502";
//Thay toa do
var lat = 10.7729015, long = 106.6701502;
window.onload = function () {
    //init direction
    directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
    // Creating a map
    var options = {
        zoom: 17,
        center: new google.maps.LatLng(lat, long),
        scrollwheel: false,
        scaleControl: true,
        disableDoubleClickZoom: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById('map'), options);


    // Adding a marker
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(lat, long),
        map: map,
        title: 'Click me'
    });
    // Adding a marker


    google.maps.event.addListener(marker, 'click', function () {

        // Check to see if an InfoWindow already exists
        if (!infoWindow) {
            infoWindow = new google.maps.InfoWindow();
        }

        // Creating the content  
            var content = '<div class="address-info">' +
            '<h1>Nam Hà Thành</h1>' + '<ul>' +
            '<li>Địa chỉ: B40 Khu quy hoạch K34, Trần Thiện Chánh, P.12, Q.10, Tp. HCM</li>' +            '<li>Hotline: 0837 543 395</li>' +
            '<li>Email: <a href="mailto:namhathanh02@gmail.com">namhathanh02@gmail.com</a></li>' + '</ul>'
        '</div>';

        // Setting the content of the InfoWindow
        infoWindow.setContent(content);

        // Opening the InfoWindow
        infoWindow.open(map, marker);

    });

    //            //HUNG -- Cho điểm thứ 2
    //            var marker2 = new google.maps.Marker({
    //                position: new google.maps.LatLng(10.788813, 106.616269),
    //                map: map,
    //                title: 'Click me'
    //            });

    //            google.maps.event.addListener(marker2, 'click', function () {

    //                 Check to see if an InfoWindow already exists
    //                if (!infoWindow) {
    //                    infoWindow = new google.maps.InfoWindow();
    //                }

    //                 Creating the content  
    //                var content = '<div class="box">' +
    //                '<h2>Thám Tử Nam Long (Cơ sở 1)</h2>' +
    //                '<p><strong>Địa chỉ:</strong> 41 - 43 Trần Cao Vân - Phường 6 - Quận 3</p>' +
    //                '<p><strong>Điện thoại :</strong>  0906 77075</p>' +
    //                '<p><strong>Email:</strong> <a href="mailto:info@gamil.com">info@gamil.com</a></p>' +
    //                '</div>';

    //                 Setting the content of the InfoWindow
    //                infoWindow.setContent(content);

    //                 Opening the InfoWindow
    //                infoWindow.open(map, marker2);

    //            });
    //            //HUNG-END -- Cho điểm thứ 2

    //            //HUNG -- Cho điểm thứ 3
    //            var marker3 = new google.maps.Marker({
    //                position: new google.maps.LatLng(10.788813, 106.616269),
    //                map: map,
    //                title: 'Click me'
    //            });

    //            google.maps.event.addListener(marker3, 'click', function () {

    //                 Check to see if an InfoWindow already exists
    //                if (!infoWindow) {
    //                    infoWindow = new google.maps.InfoWindow();
    //                }

    //                 Creating the content  
    //                var content = '<div class="box">' +
    //                '<h2>Thám Tử Nam Long (Cơ sở 2)</h2>' +
    //                '<p><strong>Địa chỉ:</strong> Số 9a đường số 13 - Phường Bình Hưng Hòa - Quận Bình Tân</p>' +
    //                '<p><strong>Điện thoại :</strong>  0906 77075</p>' +
    //                '<p><strong>Email:</strong> <a href="mailto:info@gamil.com">info@gamil.com</a></p>' +
    //                '</div>';

    //                 Setting the content of the InfoWindow
    //                infoWindow.setContent(content);

    //                 Opening the InfoWindow
    //                infoWindow.open(map, marker3);

    //            });
    //            //HUNG-END -- Cho điểm thứ 3

    //                    //HUNG -- Cho điểm thứ 3
    //            var marker4 = new google.maps.Marker({
    //                position: new google.maps.LatLng(10.788813, 106.616269),
    //                map: map,
    //                title: 'Click me'
    //            });

    //            google.maps.event.addListener(marker4, 'click', function () {

    //                 Check to see if an InfoWindow already exists
    //                if (!infoWindow) {
    //                    infoWindow = new google.maps.InfoWindow();
    //                }

    //                 Creating the content  
    //                var content = '<div class="box">' +
    //                '<h2>Thám Tử Nam Long (Cơ sở 3)</h2>' +
    //                '<p><strong>Địa chỉ:</strong> 402 Kinh Dương Vương , Phường An Lạc - Quận Bình tân</p>' +
    //                '<p><strong>Điện thoại :</strong>  0945214218</p>' +
    //                '<p><strong>Email:</strong> <a href="mailto:info@gamil.com">info@gamil.com</a></p>' +
    //                '</div>';

    //                 Setting the content of the InfoWindow
    //                infoWindow.setContent(content);

    //                 Opening the InfoWindow
    //                infoWindow.open(map, marker4);

    //            });
    //                    //HUNG-END -- Cho điểm thứ 3

    // Hiển thị thông tin
    google.maps.event.trigger(marker, 'click');

    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directionsPanel"));
};

function calcRoute() {
    var start = document.getElementById("start").value;
    var end = endAddress;
    var request = {
        origin: start,
        destination: end,
        travelMode: google.maps.DirectionsTravelMode.WALKING
        //travelMode: google.maps.DirectionsTravelMode.BICYCLING
        //travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}