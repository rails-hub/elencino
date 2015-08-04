$(function () {
    // select blocks on the basis of phase
    $('#user_phase').on("change", function () {
        var phase = $(this).val();
        if (phase != '') {
            $.ajax({
                url: '/phases/' + phase + '/blocks',
                type: 'get',
                processData: false,
                success: function (data) {
                    var htm = '<select class="form-control user-success" onchange="lots(this)" id="user_block" name="user[block]" required="required" style="border-color: red;">';
                    var options = '<option value="">Manzana*</option>';
                    $.each(data.blocks, function (key, block) {
                        options = options + '<option value=' + block.id + '>' + block.block_number + '</option>';
                    });
                    htm = htm + options + '</select>';
                    $('#phase-blocks').html(htm);
                }
            });
        }
        else {
            var htm = '<select class="form-control" onchange="lots(this)" id="user_block" name="user[block]" required="required" style="border-color: red;">';
            var options = '<option value="">Manzana*</option>';
            htm = htm + options + '</select>';
            $('#phase-blocks').html(htm);

            htm = '<select class="form-control" id="user_lot" name="user[lot]" required="required" style="border-color: red;">';
            options = '<option value="">Lote*</option>';
            htm = htm + options + '</select>';
            $('#block-lots').html(htm);


        }
    });
    // select lots on the basis of blocks
    lots = function (obje) {
        var block = $(obje).val();
        if (block != '') {
            $.ajax({
                url: '/blocks/' + block + '/lots',
                type: 'get',
                processData: false,
                success: function (data) {
                    var htm = '<select class="form-control" id="user_lot" name="user[lot]" required="required" style="border-color: red;">';
                    var options = '<option value="">Lote*</option>';
                    $.each(data.lots, function (key, lot) {
                        options = options + '<option value=' + lot.id + '>' + lot.lot_number + '</option>';
                    });
                    htm = htm + options + '</select>';
                    $('#block-lots').html(htm);
                }
            });
        }
        else {
            var htm = '<select class="form-control" id="user_lot" name="user[lot]" required="required" style="border-color: red;">';
            var options = '<option value="">Lote*</option>';
            htm = htm + options + '</select>';
            $('#block-lots').html(htm);
        }
    };

    //Quotation Form
    $("#quotation-form").submit(function (e) {
        e.preventDefault();
//        var phase = $('#user_phase').val();
//        var block = $('#user_block').val();
//        var lot = $('#user_lot').val();
//        var username = $('.UUsername').val();
//        var email = $('.UEmail').val();
//        var phone = $('.UPhone').val();
//        var type = $('#user_type').val();
//        $.ajax({
//            url: '/homes/quotation?user[phase]=' + phase + '&user[block]=' + block + '&user[lot]=' + lot + '&user[username]=' + username + '&user[email]' + email + '&user[phone]=' + phone + '&user[type]=' + type,
//            type: 'get',
//            processData: false,
//            success: function (data) {
//                $('#shared-quotation').html(data);
//            }
//        });
    });

    $("#quotation-form").validate({
        ignore: ".ignore"
    });

    $('#first-form').on('click', function (e) {
        $('#user_type').val('single');
        $('#username').addClass('ignore');
        $('#email').addClass('ignore');
        $('#phone').addClass('ignore');

        $("#quotation-form").submit();

    });

    $('#both-form').on('click', function (e) {
        $('#user_type').val('both');
        $('#username').removeClass('ignore');
        $('#email').removeClass('ignore');
        $('#phone').removeClass('ignore');

        $("#quotation-form").submit();

    });

    quote_form = function (e) {
//        e.preventDefault();
//      if ($('#quotation-form').valid()) {
        var phase = $('#user_phase').val();
        var block = $('#user_block').val();
        var lot = $('#user_lot').val();
        var username = $('.UUsername').val();
        var email = $('.UEmail').val();
        var phone = $('.UPhone').val();
        var type = $('#user_type').val();
        $.ajax({
            url: '/homes/quotation?user[phase]=' + phase + '&user[block]=' + block + '&user[lot]=' + lot + '&user[username]=' + username + '&user[email]=' + email + '&user[phone]=' + phone + '&user[type]=' + type,
            type: 'get',
            processData: false,
            success: function (data) {
                if ($('#user_type').val() == 'both') {
                    $('#flash-message1').css('visibility', 'visible');
                }
                $('#shared-quotation').html(data);
            }
        });
//        } else {
//            return false
//        }


    }
});