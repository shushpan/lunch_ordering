$(document).on('turbolinks:load', function () {
    $('#user-sign-up').validate({
        rules: {
            "user[name]": {
                required: true,
                minlength: 2,
                maxlength: 30
            },
            "user[email]":{
                required: true,
                minlength: 4,
                email: true,
                remote : {url: "/check_email"}
            },
            "user[password]":{
                required: true,
                minlength: 6
            },
            "user[password_confirmation]": {
                required: true,
                equalTo: "#user_password"
            }
        },
       messages: {
           "user[email]":{
               remote: $.validator.format("The email is already in use!")
           }
       }
    })

    $('#user-log-in').validate({
        rules: {
            "user[email]": {
                required: true,
                email: true
            },
            "user[password]": {
                required: true,
                minlength: 6
            }
        }
    })

    $('#user-edit').validate({
        rules: {
            "user[name]": {
                required: true,
                minlength: 2,
                maxlength: 30
            },
            "user[email]":{
                required: true,
                email: true
            },
            "user[password]":{
                required: true,
                minlength: 6
            },
            "user[password_confirmation]":{
                required: true,
                equalTo: "#user_password"
            },
            "user[current_password]": {
                required: true,
                minlength: 6
            }
        }
    })
})