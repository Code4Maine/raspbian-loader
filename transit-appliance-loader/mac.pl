my $rec = `/sbin/ifconfig -a | grep "HWaddr"`;
my ($field1, $field2, $field3, $field4, $mac) = split(/\s+/, $rec);

$mac = uc($mac);

open(IN,"/etc/raspbian-loader/transit-appliance-loader/jsconfig/hwid.js");
my $current_js = "";
while (my $line = <IN>) {
	$current_js .= $line;
}
close(IN);

my $proposed_js = <<EOD
// Overwrite this with actual HW ID
//hwid = 'MAC ADDRESS'
hwid = '$mac'
EOD
;

if ($current_js ne $proposed_js) {
	open(OUT,">/etc/raspbian-loader/transit-appliance-loader/jsconfig/hwid.js");
	print OUT $proposed_js;
	close(OUT);
}

print $mac;
exit(0);
