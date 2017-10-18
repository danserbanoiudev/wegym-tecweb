#!/usr/bin/env plackup


use Plack::App::CGIBin;
use Plack::App::Directory;
use Plack::Builder;
use Plack::Middleware::DirIndex;


my $app = builder {

    # embedded PSGI app
    mount '/' => sub {
        my $env = shift;
    	my $html = get_html();

        [ 200, [ 'Content-Type' => 'text/html' ], [ $html ] ];
    };
    
    # unmodified legacy CGI scripts
    mount '/cgi-bin' => Plack::App::CGIBin->new(root => './cgi-bin');
    
    # static files
    mount '/public_html' => Plack::App::Directory->new(root => './public_html');

};

sub get_html {
    return q{
        <?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it">
		<head>
		<title>Redirect - WeGym</title>
		<meta name="author" content="WeGym TW Group 15/16" />
		<meta name="copyright" content="Gruppo WeGym"/>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="refresh" content="0; url=cgi-bin/index.cgi" />
		</head>
		<body>
		</body>
		</html>
    }
}







