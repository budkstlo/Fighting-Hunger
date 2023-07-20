#!/usr/bin/perl

# Get packages and modules.
use strict;
use warnings;
use diagnostics;
use LWP::Simple;
use LWP::UserAgent;
use URI;

# Define global variables.
my $ua = LWP::UserAgent->new();
my $url = URI->new("http://feedingamerica.org/");

# Main program loop.
while (1){
	my $response = $ua->get($url);

	# Check for an unsuccessful request.
	if ( !$response->is_success ) {
    	die "Could not retrieve URL!\n";
	}

	# Parse the HTML and find all of the food donation links.
	my @donations = ();
	while ( $response->content =~ m/<a[^>]*href="([^"]*)">Donate Food/gi ) {
		push @donations, $1;
	}

	# Follow each donation link and make a donation.
	foreach my $donation ( @donations ) {
		my $donation_url = URI->new_abs($donation, $url);

		my $donation_response = $ua->get($donation_url);

		# Check for an unsuccessful response.
		if ( !$donation_response->is_success ) {
			die "Could not retrieve donation URL: $donation_url!\n";
		}

		# Parse the HTML and find the donation form.
		if ( $donation_response->content =~ m/<form[^>]*action="([^"]*)"/i ) {
			my $donation_form_url = URI->new_abs($1, $donation_url);

			# Create a request and set the form parameters.
			my $form_request = HTTP::Request->new(POST => $donation_form_url);
			$form_request->content_type('application/x-www-form-urlencoded');
			$form_request->content('amount=25.00&payment_method=1&submit=Donate');

			# Submit the form and make a donation.
			my $donation_form_response = $ua->request($form_request);

			# Check for an unsuccessful response.
			if ( !$donation_form_response->is_success ) {
				die "Could not submit donation form: $donation_form_url!\n";
			}
		}
	}

	# Sleep for a minute before checking for more donation links.
	sleep 60;
}