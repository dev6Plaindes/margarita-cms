console.log('Bienvenido a la comunidad pro');
function buttomCollapse(){
    $(document).ready(function(){
        $(".accordion-item").hover(function(){
            let data_id = $(this).attr("data-id");
            let myCollapse = document.getElementById('collapse_'+ data_id)
            let bsCollapse = new bootstrap.Collapse(myCollapse, {
            toggle: true
            })
    });
})}

function myAccordionClick() {
    const collapses = document.querySelectorAll('.items-collapse');
    Array.from(collapses).forEach(element => {
        element.addEventListener('show.bs.collapse', function (e) {
            console.log(e.target.getAttribute('data-id'));
            const uniqid = e.target.getAttribute('data-id');


            const carrusl_d = document.querySelectorAll('.carrusel-d');
            for (const box of carrusl_d) {
                box.classList.add('d-none');
            }

            const carrusl = document.querySelector('#carousel-'+uniqid);
            carrusl.classList.remove("d-none");
            //const btn = document.querySelector(`[data-carousel-id="${'#carrusel_'+uniqid}"]`);
            //if (btn) btn.click();            
        });
    });
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

function carouselthree(id, url) {

    const mycarousel = $('#carousel-'+id);
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
                1360 : {
                    items: 3
                },
                // 1360 : {
                //     items: 5
                // }
            }
        });

        mycarousel.on('click', '.owl-item>div', function (e) {
            e.preventDefault();
            window.open($(this).find('a').attr('href'), '_blank').focus();
        });
        
        fetch(url, {method: "POST", body: {} })
        .then(function(res){ return res.json(); })
        .then(function(rsp){
            console.log(rsp);
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


function ventanaSecundaria(URL){ 
    console.log(URL)
    window.open(URL,'_blank') 
} 
