---
layout: post
title: "SSL Certificates"
published: true
tags: devops ssl
categories: what-we-do devops
order: 6
---

# SSL Certificates

Almost every site we build should be accessed over an encrypted connection. To establish such a connection, your server will need to have an SSL certificate installed. The following guide will run through the steps to obtain and secure a domain with an SSL certificate.

## Generating a Certificate Signing Request

This step is only necessary if you're securing a domain for the first time, or if the existing certificate's private key is unavailable.

Open a terminal, and run the following command:

```shell
~/ $ openssl req -new -newkey rsa:2048 -nodes -keyout www_domain_name_com.key -out www_domain_name_com.csr
```

The OpenSSL command-line tool will prompt you for several pieces of information. The important ones, which will need to match the organization on whose behalf the certificate is to be issued are:

- Country Name, the two-letter abbreviation for the organization's country (e.g. `CA`);
- State or Province, the full name of the state/province in which the organization is based (e.g. `Quebec`);
- Common Name, the fully-qualified domain-name to which the certificate will be associated (e.g. `www.godynamo.com`);
- Email Address, the administrative email address for the organization (e.g. `webmaster@godynamo.com`).

You may provide the other details, or leave them blank.

This will generate two files: the certificate signing request (`www_domain_name_com.csr`) and the private key (`www_domain_name_com.key`).

The certificate signing request (CSR) contains the identifying information collected above, as well as the public key. Together, they constitute the "application" we'll make to a certificate authority.

The private key is the linchpin of the cryptographic security of the certificate, and should never exist anywhere except the server(s) the certificate will be securing. In practice, it's a real pain-in-the-ass to have to reissue a certificate because the private key got mislaid, so we store backups of private keys in Google Drive.

## Buying a Certificate

Now that you have a CSR, it's time to apply for a certificate. This is way crazier than you'd imagine, because there are a _lot_ of different kinds of certificates. You can cover one, or multiple, domains; you can choose from among many different certificate authorities; you can choose between high- and low-assurance certificates. This creates a non-trivial matrix of certificate vendors to choose from.

### SSLs.com

By and large, though, our SSL certificates are managed with SSLs.com, and we choose between QuickSSL Premium and RapidSSL Wildcard. The choice becomes pretty easy: if you need to secure subdomains, choose a RapidSSL Wildcard; otherwise, choose QuickSSL Premium.

Once you've paid for the certificate, the process of _issuing_ the certificate begins. Depending on the level of assurance offered by the CA, the first step may be waiting for a confirmation email to be sent to the administrative email you provided in the CSR; or it may involve adding a DNS record or verification file on the server to which the domain points.

Once the verification has been completed, though, you will be provided with two files: the PEM-format certificate file (usually `.crt`); and the intermediate and root certificates (`.ca-bundle`), which complete the certificate chain and ensure your certificate is trusted. (You might also have a `.p7b` file, but you can probably ignore this one.)

**TBD: screen-by-screen cert issuing process?**

### Let's Encrypt (TBD)
The [Let's Encrypt][https://letsencrypt.org/] is going to shake things up toward the end of 2015. It's in the final stages of approval as a new Certificate Authority who will issue SSL certificates for free. It may obsolesce SSLs.com.

## Installing the SSL Certificate

At this point, you've got your private key (.key) stashed away, and you've now got a certificate file (.crt) and a set of intermediate certificates (.ca-bundle). Now you have to install them on your server(s)!

### Cloud 66

### Heroku

### Load Balancers
SSL termination shenanigans.
