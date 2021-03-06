function get_menu_ajax(el) {
    date = el.data('date')
    path = el.data('ajax-path')
    full_path = path + '?date=' + date

    if (date)
        $.ajax({
            url: path,
            type: 'post',
            data: {date: date},
            dataType: 'html',
            cache: false,
            success: function (data) {
                $('.menu-wrap').empty().html(data).fadeIn()
            }
        })
}
function set_radio_active_flag(all_elements,el,className) {
    $(all_elements).removeClass(className)
    el.addClass(className)
}

$(document).on('turbolinks:load', function () {
    today = $('.menu-content .weekdays-wrap .today')
    if(today.hasClass('active'))
        get_menu_ajax(today)

    $('.menu-content .weekday:not(.disabled)').on('click', function () {
        if(!$(this).hasClass('active')){
            $('.menu-wrap').css('display','none')
            get_menu_ajax($(this))
            set_radio_active_flag(".weekdays-wrap .weekday",$(this),"active btn-success")
        }
    })
})

