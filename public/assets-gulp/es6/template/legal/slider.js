$(document).ready(function() {
 
    $("#owl-demo").owlCarousel({
        items : 1,
        loop:true,
        autoplay: true,
        autoplayTimeou: 300,
        // Navigation
        navigation : false,
        navigationText : ["prev","next"],
        rewindNav : false,
        scrollPerPage : false,
    
        //Pagination
        pagination : false,
        paginationNumbers: false,
        transitionStyle : true
        });
    $(".owl-dots").css("display","none")

  $("#owl-carrusel").owlCarousel({
    items : 1,
    loop:true,
    autoplay: true,
    autoplayTimeou: 300,
    // Navigation
    navigation : false,
    navigationText : ["prev","next"],
    rewindNav : false,
    scrollPerPage : false,

    //Pagination
    pagination : false,
    paginationNumbers: false,
    transitionStyle : true
    });
$(".owl-dots").css("display","none")
});