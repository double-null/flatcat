$('.obj_i .img.frama').each(function () {
    var str = $(this).data('fotos') + '',
        arr = str.split(','),
        cnt = arr.length,
        img = $(this).find('img');

    if (cnt <= 1) return true;
    $(this).addClass('obj-hover-gallery');
    img.wrap('<div class="obj-hover-img-h"></div>');
    max = cnt > 5 ? 5 : cnt;
    str = '<span class="obj-hover-img">';
    for (i = 1; i <= max; i++) {

        str += "<span class='obj-hover-img-" + max + "' data-id='" + arr[i - 1] + "'";
        if (i == max && max < cnt) str += "data-text='Еще " + (cnt - max) + " фото'";
        str += "></span>";
    }
    str += "</span>";
    $(this).append(str);
    $(this).on('mouseenter', '.obj-hover-img span', function () {
        var id = $(this).data('id'),
            text = $(this).data('text'),
            a = $(this).closest('a'),
            img = a.find('img'),
            src = img.attr('src'),
            reg = /\/[^\/]*\.jpg/;

        a.find('.obj-hover-img-h span').detach();
        src = src.replace(reg, "/" + id + ".jpg");
        if (text) {
            a.find('.obj-hover-img-h').append("<span>" + text + "</span>");

        }
        img.attr('src', src);
    }).on('mouseleave', function () {
        $(this).find('.obj-hover-img span').first().trigger('mouseenter');
    });
});