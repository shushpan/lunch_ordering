function set_total_amount() {
    var total_amount = 0
    price_first = $('.first-course-wrap').find('.food_active').attr('data-price')
    price_main = $('.main-course-wrap').find('.food_active').attr('data-price')
    price_drink = $('.drink-wrap').find('.food_active').attr('data-price')
    prices = [price_first, price_main, price_drink]

    for(var i=0;i<prices.length;i++){
        if(prices[i] != undefined)
            total_amount += parseInt(prices[i])
    }

    $('#total-amount').html(total_amount + " &#36")

}
$('.menu-wrap .food').on('click', function () {
    var wrapper = '.' + $(this).parent().parent().attr('class') + ' .food'
    set_radio_active_flag(wrapper,$(this),'food_active')
    set_total_amount()
})

$('#order-btn').on('click', function(){
    var first_course = $('.first-course-wrap').find('.food_active').attr('data-id'),
        main_course = $('.main-course-wrap').find('.food_active').attr('data-id'),
        drink =  $('.drink-wrap').find('.food_active').attr('data-id')

    if(first_course!=undefined && main_course!=undefined  && drink!=undefined ){
        var req = $.ajax({
            url: '/new_order',
            type: 'post',
            data:{
                'first_course_id': first_course,
                'main_course_id': main_course,
                'drink_id': drink
            },
            dataType: 'text',
            success: function(){
                $('#order-modal').modal('show')
                setTimeout(function () {
                    Turbolinks.visit(location)
                },1200)
            }
        })
    }
})