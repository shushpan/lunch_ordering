function get_orders_list_ajax(el) {
    date = el.data('date')
    path = el.data('ajax-path')
    full_path = path + '?date=' + date

    if (date)
        $.ajax({
            url: path,
            type: 'get',
            data: {date: date},
            dataType: 'html',
            cache: false
        })
}
function set_radio_active_flag(all_elements,el,className) {
    $(all_elements).removeClass(className)
    el.addClass(className)
}

$(document).on('turbolinks:load', function () {
    $(this).ajaxSuccess(function (event, xhr, settings, data) {
        if(settings.url.indexOf('/admin/get_orders_for_date') + 1)
            $('.orders-list-wrap').empty().html(data).fadeIn()
    })

    today = $('.orders-list-content .weekdays-wrap .today')
    if(today.hasClass('active'))
        get_orders_list_ajax(today)

    $('.orders-list-content .weekday:not(.disabled)').on('click', function () {
        if(!$(this).hasClass('active')){
            $('.orders-list-wrap').css('display','none')
            get_orders_list_ajax($(this))
            set_radio_active_flag(".weekdays-wrap .weekday",$(this),"active btn-success")
        }
    })
})

