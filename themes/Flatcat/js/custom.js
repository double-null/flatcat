$( document ).ready(function() {
    $('.obj-hover-img span').hover(function () {
        let image = '/images/objects/mini/' + $(this).data('photo');
        $(this).parents('.object-link').find('.object-photos img').attr('src', image);
    });


    // Клик по ссылке "Закрыть".
    $('.popup-close').click(function() {
        $(this).parents('.popup-fade').fadeOut();
        return false;
    });

    // Закрытие по клавише Esc.
    $(document).keydown(function(e) {
        if (e.keyCode === 27) {
            e.stopPropagation();
            $('.popup-fade').fadeOut();
        }
    });

    // Клик по фону, но не по окну.
    $('.popup-fade').click(function(e) {
        if ($(e.target).closest('.popup').length == 0) {
            $(this).fadeOut();
        }
    });

    $('.popup-open').click(function() {
        let id = $(this).data('id');
        $('.popup-fade[data-id="' + id + '"]').fadeIn();
        return false;
    });

    window.asd = $('.SlectBox').SumoSelect({ csvDispCount: 3, selectAll:true, captionFormatAllSelected: "Yeah, OK, so everything." });

    // Изменение фильтров
    $('.filters-list').change(function(){
        let data = $(this).serialize();
        $.post('/product_counter/', data).done(function(count){
            let text = 'Найти';
            if (count > 0) {
                text = 'Найдено ' + count + ' обьектов';
            }
            $('#filter-send').html(text);
        });
    });

    $(document).ready(function(){
        $(".owl-carousel").owlCarousel(
            {
                'items':1,
                'dots':true,
            }
        );
    });

    $('.spoiler-item').click(function(){
        $(this).find('.spoiler-body').slideToggle('slow');
    });

    $('#lang-changer').click(function(){
        $('#lang-list').slideToggle();
    });


    $('.callback-holder .callback-icon').click(function(){
        $(this).next().css('display', 'flex');
    });

    $('.callback-cancel').click(function(){
        $(this).parent().css('display', 'none');
    });

    $('.callback-confirm').click(function(){
        let phone = $('input[name="callback-phone"]').val();
        $.post('/feedback_send/', {phone:phone}).done(function(msg){
            $('.report-result').html(msg);
        }, 'json');
        $('.popup-fade[data-id="3"]').fadeIn();
    });

    $('.viber-holder .callback-icon').click(function(){
        $(this).next().css('display', 'flex');
    });

});