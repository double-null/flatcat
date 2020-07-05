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

});