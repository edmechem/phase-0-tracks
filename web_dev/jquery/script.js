window.onload = function() {

	// alert( "Welcome! The page has finished loading. So nice to be able to say \"alert\" instead of \"console.log\"!" );

};


$( document ).ready(function(){

	alert( "Welcome! The page has finished loading. So nice to be able to say \"alert\" instead of \"console.log\"!" );


	$( "a" ).click(function( event ) {
		alert( "Thanks for clicking a link, but... it won't work!" );
		event.preventDefault();
	});


	$( "h1" ).click(function( event ) {
		alert( "Bye! I'm going to hide now.");
		$(this).hide();
	});


	$( ".nothing" ).click(function( event ) {
		alert("sees click on nothing");
		$(this).addClass( "purple" );
		$(this).removeClass( "nothing");
	});

	// somehow this isn't working.
	// Even after adding purple, inspector shows purple, no nothing
	// this code still sees the element as having 'nothing', not 'purple'
	// thus this code never runs
	$( ".purple" ).click(function( event ) {
		alert("sees click on purple");
		$(this).addClass( "nothing" );
		$(this).removeClass( "purple" );
	});
	



	$( "p" ).mouseenter(function( event ){
		$(this).addClass( "red" );
	});

	$( "p" ).mouseleave(function( event ){
		$(this).removeClass( "red" );
	});



});
