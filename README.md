# ansible-ios-mac-acl
This automation may be useful to upload MAC white list to switch ports in case of port security is not usable, for example we have wifi roaming.
I had used it to update cisco switch MAC ACLs on 2 ports. 
macs.list in format one MAC 00:11:22:33:44:55 per line.  
You can adjust switch ports by editing macs2.sh PORTS variable. MAC ACL will be applied to these ports.
You need to create inventory hosts file to ansible, for example see hosts.example.
Main script macs2.sh generates ACL with name wifi<utc_timestamp> to gen.yml, then executes ansible to create a new MAC ACL, apply this ACL to ports and remove all old ACLs.
