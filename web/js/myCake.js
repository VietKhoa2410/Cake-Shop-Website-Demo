var carousel = $(".carousel"),
        currdeg = 0;


function rotate(value) {
    currdeg = currdeg + value;
    carousel.css({
        "-webkit-transform": "rotateY(" + currdeg + "deg)",
        "-moz-transform": "rotateY(" + currdeg + "deg)",
        "-o-transform": "rotateY(" + currdeg + "deg)",
        "transform": "rotateY(" + currdeg + "deg)"
    });
    index(value);
    deactivate();
//    clearInterval();
}

function activate(e) {
    if (e.classList.contains('showable')) {
        e.classList.toggle('activated');

    }
}



function deactivate() {
    try {
        document.getElementsByClassName('activated')[0].classList.remove('activated');
    } catch (err) {

    }
}

function index(value) {
    var dom = document.getElementsByClassName('item');

    var temp;
    for (i = 0; i < dom.length; i++) {
        if (dom[i].classList.contains('showable'))
            temp = i;
    }
    dom[temp].classList.remove('showable');
    if (value < 0) {
        if (temp === dom.length - 1) {
            temp = -1;
        }
        dom[temp + 1].classList.add('showable');

    } else {
        if (temp === 0) {
            temp = dom.length;
        }
        dom[temp - 1].classList.add('showable');
    }

//    document.getElementById('value').innerHTML = (temp === dom.length - 1);
}