Ansible role - Huginn with Docker
================================

Run [Huginn](https://github.com/huginn/huginn) using Docker.

Role will also install Apache2 with a LetsEncrypt SSL certificate to proxy traffic to the Huginn container.

Requirements
------------

Ansible 2.1+.

Role Variables
--------------

You must set the following.

    # Use this to register to Huginn
    huginn_invitation_code: changeme!

    # Make sure this is unique, long and stored safe
    huginn_secret: changeme!

    # Your domain where Huginn lives
    huginn_domain: huginn.local

Optional for customization.

    # Enable to install apache to do reverse proxy, otherwise
    # some Traefik labels will be exposed on the container or
    # you can do your own reverse proxying to 3000 port on the
    # container
    huginn_apache: false

    # You can disable HTTPS if SSL is terminated at the reverse proxy
    huginn_https: true

    # Email from
    huginn_mail_from: huginn@domain.tld

    # SMTP settings
    huginn_smtp_domain: your-domain-here.com
    huginn_smtp_password: somepassword
    huginn_smtp_port: 587
    huginn_smtp_server: smtp.domain.tld
    huginn_smtp_username: you@domain.tld

    # Timezone
    huginn_timezone: Helsinki

    # Twitter integration
    huginn_twitter_key:
    huginn_twitter_secret:

Dependencies
------------

Docker is required on the target host.

Depends on the following role if you use Apache2 (`huginn_apache: true`):

* `jaywink.letsencrypt`

You MUST set a valid email for the LetsEncrypt cert in your playbook.

Example to include in playbook `roles`:

    - role: jaywink.letsencrypt
      vars:
        letsencrypt_pause_services: ["apache2"]
        letsencrypt_domain: "{{ huginn_domain }}"
        letsencrypt_request_www: false
        letsencrypt_force_renew: false
        letsencrypt_email: youremail@example.com

Example Playbook
----------------

    ---
    - hosts: myhost
      become: yes
      become_user: root

      vars:
        huginn_domain: huginn.example.com
        huginn_invitation_code: changeme!
        huginn_secret: changeme!

      roles:
        - huginn

License
-------

MIT

Author Information
------------------

Jason Robinson / https://jasonrobinson.me
