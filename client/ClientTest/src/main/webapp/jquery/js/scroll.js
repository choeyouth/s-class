//scroll.js


//1. <div id="bar"></div> 동적 추가
//2. CSS 적용
//3. 이벤트 적용

//appendTo > 방금 만든 부모의 막내로 들어감
//prepandTo > 방금 만든 부모의 첫째로 들어감

$('<div id="scroll-bar-indicator"></div>')
    .css({
        width: 0,
        height: '7px',
        'background-color': 'coral',
        position: 'fixed',
        top: 0
    })
    .prependTo('body');

$(document).scroll(function() {

    // document.title = new Date().toLocaleTimeString();

    //바의 너비 == 스크롤의 위치

    //스크롤 위치 100% : 바의 너비 100% = 스크롤 위치 X;
    //X = 100 x 스크롤 위치 / 문서 높이 

    // let x = 100 * 스크롤 위치 / 문서 높이
    // document.title = $(document).scrollTop();
    // document.title = $(document).outerHeight();
    let x = 100 * $(document).scrollTop() / ($(document).outerHeight() - $(window).outerHeight());

    $('#scroll-bar-indicator').css('width', x + '%');

})