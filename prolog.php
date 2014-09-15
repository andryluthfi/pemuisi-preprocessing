
$output = "";
$cmd = "test :-
  write( 'Prolog \nwas called \nfrom PHP \nsuccessfully.' ).";
exec( $cmd, $output );