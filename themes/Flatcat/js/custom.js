$( document ).ready(function() {
    $('.obj-hover-img span').hover(function () {
        let image = '/images/objects/' + $(this).data('photo');
        $(this).parents('.object-link').find('.object-photos img').attr('src', image);
    });
});