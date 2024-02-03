# docker-apache-php-mysql

Docker example with Apache, MySql 8.0, PhpMyAdmin and Php

I use docker-compose as an orchestrator. To run these containers:

```
docker-compose up -d
```
Permission denied issue
Go to www container and execute command "chmod -R 777 ./" (Not recommended)

Theme css

.customers_login .login-heading {
   display: none !important;
}

.customers_login .customers-nav-item-login {
   display: none !important;
}

.copyright-footer {
   display: none !important;
}
	
	
Create a file with name my_functions_helper.php in application/helpers/ and add the following code:

Version 2.3.0 or above
<?php

// After contact login from the login form
hooks()->add_action('after_contact_login','redirect_to_projects');
// After client registered and logged in automatically
hooks()->add_action('after_client_register_logged_in','redirect_to_projects');

function redirect_to_projects(){
redirect(site_url('clients/projects'));
}