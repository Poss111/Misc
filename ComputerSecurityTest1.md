# Computer Security Test 1  
# Daniel Poss

Flag 1: The first flag found was from using zenmap on mthack.me. The flag came up from http-robots.txt as /flagis/immarobot after the scan of mthack.me using zenmap was finished.

Flag 2: The second flag found was after using a full port scan on mthack.me to then find the "secret" irc. Once logged on to the irc using the credentials 70.39.80.128 and port 6697 there was a flag on the login screen saying "test1.....flag: ithasatheme".

Flag 3: Was found after using dnsenum on mthack.me for possible subdomains using the list of select brews starting with prb and busch that were given after using dnsrecon -d mthack.me on mthack.me. Once dnsenum on mthack.me was ran it found the brew domains pbr.mthack.me, busch.mthack.me, and budlight.mthack.me. Then a full nmap port scan was used on pbr.mthack.me to find that it had port 22 (ssh) open so next was trying to log into it. When using ssh pbr.mthack.me the next flag was shown as flag: batterup.

Flag 4: Was found after running a dnsrecon -d pbr.mthack.me which found the fourth flag after the scan finished. The flag that was discorved with this was flag: hipsters.

Flag 5: Was found after then cracking the password for pbr.mthack.me using hydra -l student -P /usr/share/wordlists/fasttrack.txt. Which found the password for the user student to be password123. After logging into pbr.mthack.me the histroy command was used to find the ./bash history which found another flag which was named flag: flagseverywhere.

Flag 6: Was found after brutally realizing that another flag was the user after logging into the pbr.mthack.me. The flag found was the_flag_is_yaypasswords which was part of the the_flag_is_yaypasswords@ip-172-31-1-5.

Flag 7: Was found after using an nmap scan on busch.mthack.me. Using nmap -p1-65535 busch.mthack.me found that there was a remote desktop port open (port 3389). Which remote desktop connection on windows was promptly used to then find that a username and password was required. Hyrda was then used to find the password for the remote desktop which fell upon csci476 for the username and iloveclass! was the password. After logging in to the remote desktop, using the destination as busch.mthack.me, there was a txt document found named flag.txt that contained the flag "yaypoints".

Flag 8: Was then found using the foxyproxy setting for the ip address 127.0.0.1 for local host and using a SOCKs proxy as well as using port 8080. Using those setting, the ip address located in the connect.sh in pbr.mthack.me was accessed on the Iceweasel browser. Then going to the phpAdmin tab the flag "flag=hifriend" was found in the scroll down box to the right of the far left column.

Flag 9: Was then found using a larger list with dnsenum -d -f mthack.me. Using this command with the larger list for subdomain found olymipa.mthack.me to be a valid subdomain for mthack.me which. Then entering olympia into the Iceweasal browser found another flag named washingtoncapital.

Flag 10: Was found after logging into the normal irc chat for the class "weber.freenode.net port 6667". After logging into this irc the final flagged was found to the header for the irc chat for channel #csci_476. The flag found was named participationpoints.