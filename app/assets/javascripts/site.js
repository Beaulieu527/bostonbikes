var refreshRating = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
};

$(document).on('turbolinks:load ajaxSuccess', function(){
       
       refreshRating();
       
      $('.img-zoom').elevateZoom({
        zoomType: "lens",
        lensShape : "round",
        lensSize    : 150  
    });
      
       $('.menu-btn').click(function(){
        $('.responsive-menu').toggleClass('expand');
  });
  //any rails flashes are set to delayed fadeout over 2s
      $('.alert').delay(3000).fadeOut(2000);
 }); 