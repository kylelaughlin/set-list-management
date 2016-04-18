$(function() {
  $( "ul.droptrue" ).sortable({
    connectWith: "ul",
    appendTo: "body",
    helper: "clone",
    update: function(event, ui) {
      if(this.id !== "songs") {
        var set_id = this.id

        var songs = []
        $(this).children().map(function() {
          songs.push(this.id);
          });

        var set_list_id = document.getElementsByClassName('set_list')[0].id;

        var postData = {set_list_id: set_list_id, set_id: set_id, song_order: songs};

        $.ajax({
          method: 'post',
          url: '/set_lists/new/sets',
          data: postData
        });

      }

    }

  });

  $( "#sortable1, #sortable2, #sortable3" ).disableSelection();
  });
