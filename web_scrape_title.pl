#!/usr/bin/perl

use LWP::UserAgent;

my $request_url = "http://webscrapingscripts.com/";

my $extract_from = '<title>';
my $extract_to = '</title>';
my $title = '';

my $req = HTTP::Request->new(GET => $request_url);
$req->header("User-Agent" => "Perl Scraper 1.0");

my $ua = LWP::UserAgent->new;
my $response = $ua->request($req);
my $respContent = $response->{_content};

if ( (my $from_index = index($respContent, $extract_from)) != -1){
	if ( (my $to_index = index($respContent, $extract_to)) != -1){
		$title = substr($respContent, $from_index+length($extract_from),
						$to_index-$from_index-length($extract_from));
		printf("Title is %s\r\n", $title);
		#
		#TODO do something with the data
		#
	}else{
		print "Error: extract_to string not found in response.\r\n";
	}
}else{
	print "Error: extract_from string not found in response.\r\n";
}

