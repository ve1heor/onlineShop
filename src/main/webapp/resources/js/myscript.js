$(document).ready(function() {
    $('a[href^="#"]').click(function(){
        var el = $(this).attr('href');
        $('body').animate({
            scrollTop: $(el).offset().top}, 700);
        return false;
    });
    $('#input-search').keydown(function(e) {
        if (e.keyCode == 13) {
            alert(document.getElementById('input-search').value)
        }
    });
    var slides = document.querySelectorAll('#slides .slide');
    var currentSlide = 0;
    //var slideInterval = setInterval(nextSlide,2000);

    function nextSlide(){
        goToSlide(currentSlide+1);
    }

    function previousSlide(){
        goToSlide(currentSlide-1);
    }

    function goToSlide(n){
        slides[currentSlide].className = 'slide';
        currentSlide = (n+slides.length)%slides.length;
        slides[currentSlide].className = 'slide showing';
    }

    var next = document.getElementById('next');
    var previous = document.getElementById('previous');

    next.onclick = function(){
        nextSlide();
    };
    previous.onclick = function(){
        previousSlide();
    };
});