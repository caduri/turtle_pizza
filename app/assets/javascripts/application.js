// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery-ui
//= require cocoon
//= require cloudinary
//= require_tree .

jQuery.fn.swap = function(b){
    // method from: http://blog.pengoworks.com/index.cfm/2008/9/24/A-quick-and-dirty-swap-method-for-jQuery
    b = jQuery(b)[0];
    var a = this[0];
    var t = a.parentNode.insertBefore(document.createTextNode(''), a);
    b.parentNode.insertBefore(a, b);
    t.parentNode.insertBefore(b, t);
    t.parentNode.removeChild(t);
    return this;
};

$(document).ready(function(e){
  $('.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {
    var ul = $('form').find('ul')
    var lis = ul.find('li');
    image_value = [data.result.resource_type, data.result.type, data.result.path].join('/') + "#" + data.result.signature;
    if (lis.length == 0) {
      var newLi =   $('<li class="col-xs-6 col-md-3" id="1">' +
                        '<div class="thumbnail">' +
                          '<div class="control-group hidden pizza_images_order_num">' +
                            '<div class="controls">' +
                              '<input class="hidden" type="hidden" value="1" name="pizza[images_attributes][0][order_num]" id="pizza_images_attributes_0_order_num">' +
                            '</div>' +
                          '</div>' +
                          '<input class="hidden remove_from_li" type="hidden" value="' + image_value + '" name="pizza[images_attributes][0][picture]" id="pizza_images_attributes_0_picture">' +
                        '</div>' +
                      '</li>');
      newLi.find('.thumbnail').append($.cloudinary.image(data.result.public_id, {format: 'jpeg', width: 200, height: 200}));
      ul.append(newLi);
    } else {
      var newIndex = lis.length;
      var newLi = lis.last().clone().attr('id', newIndex+1);
      newLi.find('img').remove();
      newLi.find('.remove_from_li').remove();
      newOrderNum = parseInt(newLi.find('input').attr('value')) + 1;
      newLi.find('input').attr('value', newOrderNum)
                         .attr('name', 'pizza[images_attributes][' + newIndex + '][order_num]')
                         .attr('id', 'pizza_images_attributes_' + newIndex + '_order_num');
      image_input = newLi.find('input').clone().attr('value', image_value)
                                               .attr('name', 'pizza[images_attributes][' + newIndex + '][picture]')
                                               .attr('id', 'pizza_images_attributes_' + newIndex + '_picture')
                                               .addClass('remove_from_li');
      newLi.find('.thumbnail').append($.cloudinary.image(data.result.public_id, {format: 'jpeg', width: 200, height: 200}))
                              .append(image_input);
      ul.append(newLi);
    }

    $( ".thumbnail" ).draggable({ revert: true, helper: "clone" });

    $( ".thumbnail" ).droppable({
      accept: ".thumbnail",
      activeClass: "ui-state-hover",
      hoverClass: "ui-state-active",
      drop: function( event, ui ) {

        var draggable = ui.draggable, droppable = $(this),
            dragPos = draggable.position(), dropPos = droppable.position();

        draggable.css({
            left: dropPos.left+'px',
            top: dropPos.top+'px'
        });

        droppable.css({
            left: dragPos.left+'px',
            top: dragPos.top+'px'
        });
        var draggable_order_num = draggable.find('div').find('input').attr('value');
        var droppable_order_num = droppable.find('div').find('input').attr('value');
        draggable.find('div').find('input').attr('value', droppable_order_num);
        droppable.find('div').find('input').attr('value', draggable_order_num);
        draggable.swap(droppable);
      }
    });
  });
  $( ".thumbnail" ).draggable({ revert: true, helper: "clone" });

  $( ".thumbnail" ).droppable({
    accept: ".thumbnail",
    activeClass: "ui-state-hover",
    hoverClass: "ui-state-active",
    drop: function( event, ui ) {

        var draggable = ui.draggable, droppable = $(this),
            dragPos = draggable.position(), dropPos = droppable.position();

        draggable.css({
            left: dropPos.left+'px',
            top: dropPos.top+'px'
        });

        droppable.css({
            left: dragPos.left+'px',
            top: dragPos.top+'px'
        });
        var draggable_order_num = draggable.find('div').find('input').attr('value');
        var droppable_order_num = droppable.find('div').find('input').attr('value');
        draggable.find('div').find('input').attr('value', droppable_order_num);
        droppable.find('div').find('input').attr('value', draggable_order_num);
        draggable.swap(droppable);
    }
  });
});
