
function padTo2Digits(num) {
    return num.toString().padStart(2, '0');
}

function toParseMonth(month) {
    switch (Number(month)) {
        case 1: return 'Enero'   
        case 2: return 'Febrero'   
        case 3: return 'Marzo'   
        case 4: return 'Abril'   
        case 5: return 'Mayo'   
        case 6: return 'Junio'   
        case 7: return 'Julio'   
        case 8: return 'Agosto'   
        case 9: return 'Septiembre'   
        case 10: return 'Octubre'   
        case 11: return 'Noviembre'   
        case 12: return 'Diciembre'
        default: return 'Error'
    }
}

function toFormatDate(date) {
    return (
        [
        padTo2Digits(date.getUTCDate()),    
        toParseMonth(date.getUTCMonth() + 1),
        date.getFullYear(),
        ].join(' ')
    );
}

function openRequestedPopup(title, url) {
    windowObjectReference = window.open(
      url,
      title,
      "resizable,scrollbars,status"
    );
}

function sendemailregister(id) {
    $('#'+id).off('submit');
    $('#'+id).on('submit', function (e) {
        e.preventDefault();
        sweet2.loading();
        let formData = new FormData(e.target);
        fetch("/contact/suscription", {method: "POST", body: formData })
        .then(function(res){ return res.json(); })
        .then(function(rsp){
            if (!rsp.success) {
                throw rsp.message;
            }
            $('#'+id).trigger("reset");
            sweet2.success({html: rsp.message});
        })
        .catch(function (e) {
            sweet2.error({html: e});
        });
    });
}

function carouselone(id) {
    $('#'+id).owlCarousel({
        loop: false,
        margin: 30,
        dots: false,
        nav: true,
        navText: [
            `<span><i class="fa fa-chevron-left" aria-hidden="true"></i></span>`,
            `<span><i class="fa fa-chevron-right" aria-hidden="true"></i></span>`
        ],
        // items: 5,
        responsive : {
            // breakpoint from 0 up
            0 : {
                items: 1
            },
            // breakpoint from 480 up
            480 : {
                items: 2
            },
            // breakpoint from 768 up
            768 : {
                items: 3
            },
            992 : {
                items: 4
            },
            1360 : {
                items: 5
            }
        }
    });
}

function carouseltwo(id) {
    $('#'+id).owlCarousel({
        loop: false,
        dots: true,
        items: 1
    })    
}

function carouselthree(id, url) {
    const mycarousel = $('#'+id);
    if (mycarousel) {

        mycarousel.owlCarousel({
            loop: false,
            margin: 30,
            dots: false,
            nav: true,
            navText: [
                `<span><i class="fa fa-chevron-left" aria-hidden="true"></i></span>`,
                `<span><i class="fa fa-chevron-right" aria-hidden="true"></i></span>`
            ],
            // items: 5
            responsive : {
                // breakpoint from 0 up
                0 : {
                    items: 1
                },
                // breakpoint from 480 up
                480 : {
                    items: 2
                },
                // breakpoint from 768 up
                768 : {
                    items: 3
                },
                992 : {
                    items: 4
                },
                1360 : {
                    items: 5
                }
            }
        });

        mycarousel.on('click', '.owl-item>div', function (e) {
            e.preventDefault();
            window.open($(this).find('a').attr('href'), '_blank').focus();
        });
        
        // fetch('http://fri.tienda.test:8080/empresa/products/events', {method: "POST", body: {} })
        // fetch('https://fri.com.pe/esan-capacitaciones/empresa/products/events', {method: "POST", body: {} })
        fetch(url, {method: "POST", body: {} })
        .then(function(res){ return res.json(); })
        .then(function(rsp){
            let html = `No hay datos para mostrar`;
            if (rsp.success) {
                const products = rsp.data.products;
                if (products.length > 0) {
                    for (let i = 0; i < products.length; i++) {
                        const content1 =  `<div class="my-2">${products[i].html}</div>`;
                        mycarousel.owlCarousel().trigger('add.owl.carousel', [jQuery(content1)]).trigger('refresh.owl.carousel');
                    }
                    $('#loading-'+id).remove();
                }
            } else {
                $('#loading-'+id).remove();
            }
        })
        .catch(function (e) {
            console.log(e);
            $('#loading-'+id).remove();
        });
        
    }
}

function carouselfour(id, url, body) {
    const mycarousel = $('#'+id);
    if (mycarousel) {
        // fetch('https://api-muralis.fri.com.pe/api/v1/notice/listnewsbygroup', {
        fetch(url, {
            method: "POST", 
            body: body,
            /*body: JSON.stringify({
                "groupId": "6185a7f0136726413d648362",
                "cant": 6
            }),*/
            headers: new Headers({
                'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NLZXkiOiJLUnNDQW5adGNTVGRGRUJOIiwiZXgiOiIxMjM0NTY3ODkwIn0.wf6irgsiAEABWzu6licSsZitrYnsU-OkDR5fc52Wppo', 
                'Content-Type': 'application/json;charset=UTF-8'
            }), 
        })
        .then(function(res){ return res.json(); })
        .then(function(rsp){
            let html = `No hay datos para mostrar`;
            if (rsp.success) {
                const notices = rsp.data.notices;
                if (notices.length > 0) {
                    html = '';
                    for (let i = 0; i < notices.length; i++) {
                        const notice = notices[i];
                        html += `<div class="col-lg-4 float-left mb-2 p-2">
                                    <div class="card system-card-1">
                                        <div class="card-body">
                                            <div class="card-image">
                                                <div class="card-ribbon">${notice.category}</div>
                                                <img src="${notice.image}" width="100%" height="200px">
                                            </div>
                                            <div class="card-information">
                                                <p class="card-title" onclick="openRequestedPopup('${notice.source}', '${notice.link}')">${notice.title}</p>
                                                <p class="card-text">${notice.description}</p>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <i class="fa fa-clock-o mr-1" aria-hidden="true"></i> ${toFormatDate(new Date(notice.date_utc))}
                                        </div>
                                    </div>
                                </div>`;
                    }
                }
            
            }
            mycarousel.html(html);
            $('#loading-'+id).remove();
        })
        .catch(function (e) {
            console.log(e);
            $('#loading-'+id).remove();
        });
    }

}

function playercard(id) {
    const myitem = $('#'+id);
    if (myitem) {
        const myplayer = myitem.find('.player');
        const audio = document.getElementById('audio-'+id);
        myplayer.find('.play').on('click', function (e) {
            myplayer.find('.pause').css('display', 'inline-block');
            myplayer.find('.play').css('display', 'none');
            audio.play();
        });
        myplayer.find('.pause').on('click', function (e) {
            myplayer.find('.pause').css('display', 'none');
            myplayer.find('.play').css('display', 'inline-block');
            audio.pause();
        });
    }
}

$('.nav-scroll').find('.a-scroll').on('click',function(e){
    e.preventDefault();
    var body = $("html, body"),
    link = $(this).attr('data-scroll');
    body.stop().animate({scrollTop: $('.section[data-scrolled="'+link+'"]').offset().top}, '1000', 'swing', function() { 
    });
    return false;
});
