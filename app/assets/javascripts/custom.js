/**
 * Created by minimac on 3/15/18.
 */

$(document).on('change', 'input:radio[name="customer[authentication_type]"]', function (event) {
    console.log($(this).val())
    if ($(this).val() === '0') { // email auth.
        $('#email_info').css('display', 'block');
        $('#saml_info').css('display', 'none');
    } else {
        $('#email_info').css('display', 'none');
        $('#saml_info').css('display', 'block');
    }
});