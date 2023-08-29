#Project Title: Web Server Configuration
This project aims to guide you through the process of setting up a web server, transferring files, installing and configuring Nginx, setting up a domain name, handling redirection, and creating a custom 404 page. Each step is broken down into separate sections for clarity and ease of understanding.

Table of Contents
Transfer a File to Your Server
Install Nginx Web Server
Setup a Domain Name
Redirection
Not Found Page 404
Transfer a File to Your Server
Overview
This section guides you through creating a Bash script that transfers a file from a client machine to a server using scp.

Requirements
Accepts 4 parameters:
Path to the file to be transferred
IP of the server
Username for scp connection
Path to the SSH private key for scp
Display usage information if fewer than 4 parameters are passed
Disable strict host key checking for scp
Example
bash
Copy code
sylvain@ubuntu$ ./0-transfer_file
Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
sylvain@ubuntu$
sylvain@ubuntu$ ssh ubuntu@8.8.8.8 -i /vagrant/sylvain 'ls ~/'
afile
sylvain@ubuntu$
sylvain@ubuntu$ touch some_page.html
sylvain@ubuntu$ ./0-transfer_file some_page.html 8.8.8.8 sylvain /vagrant/private_key
some_page.html                                     100%   12     0.1KB/s   00:00
sylvain@ubuntu$ ssh ubuntu@8.8.8.8 -i /vagrant/private_key 'ls ~/'
afile
some_page.html
sylvain@ubuntu$
Install Nginx Web Server
Overview
This section covers the installation and configuration of the Nginx web server.

Requirements
Install nginx on the web-01 server
Nginx should listen on port 80
Querying Nginx at its root should return "Hello World!"
Create a Bash script to configure a new Ubuntu machine to meet the requirements
Example
bash
Copy code
root@sy-web-01$ ./1-install_nginx_web_server > /dev/null 2>&1
root@sy-web-01$
root@sy-web-01$ curl localhost
Hello World!
root@sy-web-01$
Setup a Domain Name
Overview
This section explains how to set up a domain name using .TECH Domains and configure DNS records.

Requirement
Provide the domain name (e.g., foobar.tech)
Configure DNS records with an A entry pointing to web-01 IP address
Update Project website URL field with the domain name
Example
bash
Copy code
sylvain@ubuntu$ cat 2-setup_a_domain_name
myschool.tech
sylvain@ubuntu$
sylvain@ubuntu$ dig myschool.tech
# Output showing DNS configuration
Redirection
Overview
This section demonstrates how to configure Nginx to perform a permanent redirection.

#Requirements
Configure Nginx for a "301 Moved Permanently" redirection from /redirect_me
Create a Bash script to configure Ubuntu for this redirection
Example
bash
Copy code
sylvain@ubuntu$ curl -sI 34.198.248.145/redirect_me/
HTTP/1.1 301 Moved Permanently
# More header information
Location: https://www.youtube.com/watch?v=QH2-TGUlwu4
Not Found Page 404
Overview
This section guides you through configuring a custom 404 page on your Nginx server.

Requirements
Configure Nginx to return an HTTP 404 error with the custom message "Ceci n'est pas une page"
Create a Bash script to configure Ubuntu for this custom 404 page
Example
bash
Copy code
sylvain@ubuntu$ curl -sI 34.198.248.145/xyz
HTTP/1.1 404 Not Found
# More header information

sylvain@ubuntu$ curl 34.198.248.145/xyzfoo
Ceci n'est pas une page
##Repository Information
*GitHub Repository: alx-system_engineering-devops
*Directory: 0x0C-web_server
*Files: 0-transfer_file, 1-install_nginx_web_server, 2-setup_a_domain_name, 3-redirection, 4-not_found_page_404
Feel free to refer to the specific files for detailed scripts and instructions related to each section. Good luck with your web server setup!