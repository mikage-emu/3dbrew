# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00060080\]       |
| 1          | SSL RootCertChain context handle |
| 2          | u8 certID                        |

# Response

| Index Word | Description          |
|------------|----------------------|
| 0          | Header code          |
| 1          | Result code          |
| 2          | Cert context handle. |

# CertIDs

<table>
<thead>
<tr class="header">
<th><p>ID</p></th>
<th><p>Cert parsing output</p></th>
<th><p>Notes</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0 and &gt;=0xC</p></td>
<td></td>
<td><p>Invalid certID, error 0xd8e0b839 is returned for these.</p></td>
</tr>
<tr class="even">
<td><p>0x1</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number: 0 (0x0)</code><br />
<code>   Signature Algorithm: sha1WithRSAEncryption</code><br />
<code>       Issuer: C=US, ST=Washington, O=Nintendo of America Inc, OU=NOA, CN=Nintendo CA/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Validity</code><br />
<code>           Not Before: Aug 10 07:02:22 2005 GMT</code><br />
<code>           Not After : Dec 28 12:00:00 2049 GMT</code><br />
<code>       Subject: C=US, ST=Washington, O=Nintendo of America Inc, OU=NOA, CN=Nintendo CA/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (1024 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:b3:cd:79:97:77:5d:8a:af:86:a8:e8:d7:73:1c:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               7B:57:53:3F:31:AC:77:71:F1:FD:4A:E6:0F:43:B0:D5:55:41:9F:D2</code><br />
<code>       ...</code></p></td>
<td><p>"Nintendo CA"</p></td>
</tr>
<tr class="odd">
<td><p>0x2</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number: 1 (0x1)</code><br />
<code>   Signature Algorithm: sha1WithRSAEncryption</code><br />
<code>       Issuer: C=US, ST=Washington, O=Nintendo of America Inc., OU=IS, CN=Nintendo CA - G2/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Validity</code><br />
<code>           Not Before: Jun  4 17:39:49 2008 GMT</code><br />
<code>           Not After : Dec 28 12:00:00 2049 GMT</code><br />
<code>       Subject: C=US, ST=Washington, O=Nintendo of America Inc., OU=IS, CN=Nintendo CA - G2/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (2048 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:9d:69:36:28:b4:83:62:5e:f4:b4:fe:40:ef:dc:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               96:A7:A1:9F:81:5C:73:C9:64:10:83:7F:B6:1E:1E:87:B7:E1:33:11</code><br />
<code>       ...</code></p></td>
<td><p>"Nintendo CA - G2"</p></td>
</tr>
<tr class="even">
<td><p>0x3</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number: 1 (0x1)</code><br />
<code>   Signature Algorithm: sha256WithRSAEncryption</code><br />
<code>       Issuer: C=US, ST=Washington, O=Nintendo of America Inc., OU=IS, CN=Nintendo CA - G3</code><br />
<code>       Validity</code><br />
<code>           Not Before: Jan 28 17:16:11 2010 GMT</code><br />
<code>           Not After : Dec 28 12:00:00 2049 GMT</code><br />
<code>       Subject: C=US, ST=Washington, O=Nintendo of America Inc., OU=IS, CN=Nintendo CA - G3</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (2048 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:af:22:74:54:15:57:28:f6:6f:e1:ca:f4:a7:91:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               04:D3:DE:D3:FD:F0:C8:EB:C2:59:92:87:FB:1F:D7:3E:72:F8:ED:F9</code><br />
<code>       ...</code></p></td>
<td><p>"Nintendo CA - G3"</p></td>
</tr>
<tr class="odd">
<td><p>0x4</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number: 1 (0x1)</code><br />
<code>   Signature Algorithm: sha1WithRSAEncryption</code><br />
<code>       Issuer: C=US, ST=Washington, O=Nintendo of America Inc., OU=NOA, CN=Nintendo Class 2 CA/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Validity</code><br />
<code>           Not Before: Jun 15 19:34:33 2007 GMT</code><br />
<code>           Not After : Dec 28 12:00:00 2049 GMT</code><br />
<code>       Subject: C=US, ST=Washington, O=Nintendo of America Inc., OU=NOA, CN=Nintendo Class 2 CA/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (1024 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:b4:a8:0f:e3:80:02:a7:ad:fb:59:9d:e1:92:9d:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               CB:40:16:7C:B1:37:2B:26:5A:35:DE:BE:F1:5B:50:8A:8D:0C:D4:BD</code><br />
<code>       ...</code></p></td>
<td><p>"Nintendo Class 2 CA"</p></td>
</tr>
<tr class="even">
<td><p>0x5</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number: 1 (0x1)</code><br />
<code>   Signature Algorithm: sha1WithRSAEncryption</code><br />
<code>       Issuer: C=US, ST=Washington, O=Nintendo of America, Inc., OU=IS, CN=Nintendo Class 2 CA - G2/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Validity</code><br />
<code>           Not Before: Apr 29 15:31:36 2010 GMT</code><br />
<code>           Not After : Dec 28 12:00:00 2049 GMT</code><br />
<code>       Subject: C=US, ST=Washington, O=Nintendo of America, Inc., OU=IS, CN=Nintendo Class 2 CA - G2/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (2048 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:b6:0f:a0:4a:95:ec:ad:f7:75:09:7a:e5:aa:81:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               94:72:FA:4D:B3:DA:66:4A:B9:37:7B:AD:64:9E:9C:89:90:DA:D3:33</code><br />
<code>       ...</code></p></td>
<td><p>"Nintendo Class 2 CA - G2"</p></td>
</tr>
<tr class="odd">
<td><p>0x6</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number: 1 (0x1)</code><br />
<code>   Signature Algorithm: sha256WithRSAEncryption</code><br />
<code>       Issuer: C=US, ST=Washington, O=Nintendo of America, Inc., OU=IS, CN=Nintendo Class 2 CA - G3/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Validity</code><br />
<code>           Not Before: Apr 29 15:59:18 2010 GMT</code><br />
<code>           Not After : Dec 28 12:00:00 2049 GMT</code><br />
<code>       Subject: C=US, ST=Washington, O=Nintendo of America, Inc., OU=IS, CN=Nintendo Class 2 CA - G3/emailAddress=ca@noa.nintendo.com</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (2048 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:d1:d0:99:4b:b9:36:9b:88:a5:15:79:a5:b5:ce:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               F7:C6:0A:7C:72:7C:2C:C4:BC:93:28:41:E4:EE:70:F0:03:A0:BB:B7</code><br />
<code>       ...</code></p></td>
<td><p>"Nintendo Class 2 CA - G3"</p></td>
</tr>
<tr class="even">
<td><p>0x7</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 1 (0x0)</code><br />
<code>       Serial Number: 421 (0x1a5)</code><br />
<code>   Signature Algorithm: md5WithRSAEncryption</code><br />
<code>       Issuer: C=US, O=GTE Corporation, OU=GTE CyberTrust Solutions, Inc., CN=GTE CyberTrust Global Root</code><br />
<code>       Validity</code><br />
<code>           Not Before: Aug 13 00:29:00 1998 GMT</code><br />
<code>           Not After : Aug 13 23:59:00 2018 GMT</code><br />
<code>       Subject: C=US, O=GTE Corporation, OU=GTE CyberTrust Solutions, Inc., CN=GTE CyberTrust Global Root</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (1024 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:95:0f:a0:b6:f0:50:9c:e8:7a:c7:88:cd:dd:17:</code><br />
<code>                   0e:2e:b0:94:d0:1b:3d:0e:f6:94:c0:8a:94:c7:06:</code><br />
<code>                   c8:90:97:c8:b8:64:1a:7a:7e:6c:3c:53:e1:37:28:</code><br />
<code>                   73:60:7f:b2:97:53:07:9f:53:f9:6d:58:94:d2:af:</code><br />
<code>                   8d:6d:88:67:80:e6:ed:b2:95:cf:72:31:ca:a5:1c:</code><br />
<code>                   72:ba:5c:02:e7:64:42:e7:f9:a9:2c:d6:3a:0d:ac:</code><br />
<code>                   8d:42:aa:24:01:39:e6:9c:3f:01:85:57:0d:58:87:</code><br />
<code>                   45:f8:d3:85:aa:93:69:26:85:70:48:80:3f:12:15:</code><br />
<code>                   c7:79:b4:1f:05:2f:3b:62:99</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>   Signature Algorithm: md5WithRSAEncryption</code><br />
<code>        6d:eb:1b:09:e9:5e:d9:51:db:67:22:61:a4:2a:3c:48:77:e3:</code><br />
<code>        ...</code></p></td>
<td><p>"GTE CyberTrust Global Root"</p></td>
</tr>
<tr class="odd">
<td><p>0x8</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number: 1 (0x1)</code><br />
<code>   Signature Algorithm: sha1WithRSAEncryption</code><br />
<code>       Issuer: C=SE, O=AddTrust AB, OU=AddTrust External TTP Network, CN=AddTrust External CA Root</code><br />
<code>       Validity</code><br />
<code>           Not Before: May 30 10:48:38 2000 GMT</code><br />
<code>           Not After : May 30 10:48:38 2020 GMT</code><br />
<code>       Subject: C=SE, O=AddTrust AB, OU=AddTrust External TTP Network, CN=AddTrust External CA Root</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (2048 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:b7:f7:1a:33:e6:f2:00:04:2d:39:e0:4e:5b:ed:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               AD:BD:98:7A:34:B4:26:F7:FA:C4:26:54:EF:03:BD:E0:24:CB:54:1A</code><br />
<code>           X509v3 Key Usage: </code><br />
<code>               Certificate Sign, CRL Sign</code><br />
<code>           X509v3 Basic Constraints: critical</code><br />
<code>               CA:TRUE</code><br />
<code>           X509v3 Authority Key Identifier: </code><br />
<code>               keyid:AD:BD:98:7A:34:B4:26:F7:FA:C4:26:54:EF:03:BD:E0:24:CB:54:1A</code><br />
<code>               DirName:/C=SE/O=AddTrust AB/OU=AddTrust External TTP Network/CN=AddTrust External CA Root</code><br />
<code>               serial:01</code><br />
<code> </code><br />
<code>   Signature Algorithm: sha1WithRSAEncryption</code><br />
<code>        b0:9b:e0:85:25:c2:d6:23:e2:0f:96:06:92:9d:41:98:9c:d9:</code><br />
<code>        ...</code></p></td>
<td><p>"AddTrust External CA Root"</p></td>
</tr>
<tr class="even">
<td><p>0x9</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number:</code><br />
<code>           4c:aa:f9:ca:db:63:6f:e0:1f:f7:4e:d8:5b:03:86:9d</code><br />
<code>   Signature Algorithm: sha384WithRSAEncryption</code><br />
<code>       Issuer: C=GB, ST=Greater Manchester, L=Salford, O=COMODO CA Limited, CN=COMODO RSA Certification Authority</code><br />
<code>       Validity</code><br />
<code>           Not Before: Jan 19 00:00:00 2010 GMT</code><br />
<code>           Not After : Jan 18 23:59:59 2038 GMT</code><br />
<code>       Subject: C=GB, ST=Greater Manchester, L=Salford, O=COMODO CA Limited, CN=COMODO RSA Certification Authority</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (4096 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:91:e8:54:92:d2:0a:56:b1:ac:0d:24:dd:c5:cf:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               BB:AF:7E:02:3D:FA:A6:F1:3C:84:8E:AD:EE:38:98:EC:D9:32:32:D4</code><br />
<code>           X509v3 Key Usage: critical</code><br />
<code>               Certificate Sign, CRL Sign</code><br />
<code>           X509v3 Basic Constraints: critical</code><br />
<code>               CA:TRUE</code><br />
<code>   Signature Algorithm: sha384WithRSAEncryption</code><br />
<code>        0a:f1:d5:46:84:b7:ae:51:bb:6c:b2:4d:41:14:00:93:4c:9c:</code><br />
<code>        ...</code></p></td>
<td><p>"COMODO RSA Certification Authority"</p></td>
</tr>
<tr class="odd">
<td><p>0xA</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number:</code><br />
<code>           01:fd:6d:30:fc:a3:ca:51:a8:1b:bc:64:0e:35:03:2d</code><br />
<code>   Signature Algorithm: sha384WithRSAEncryption</code><br />
<code>       Issuer: C=US, ST=New Jersey, L=Jersey City, O=The USERTRUST Network, CN=USERTrust RSA Certification Authority</code><br />
<code>       Validity</code><br />
<code>           Not Before: Feb  1 00:00:00 2010 GMT</code><br />
<code>           Not After : Jan 18 23:59:59 2038 GMT</code><br />
<code>       Subject: C=US, ST=New Jersey, L=Jersey City, O=The USERTRUST Network, CN=USERTrust RSA Certification Authority</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (4096 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:80:12:65:17:36:0e:c3:db:08:b3:d0:ac:57:0d:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               53:79:BF:5A:AA:2B:4A:CF:54:80:E1:D8:9B:C0:9D:F2:B2:03:66:CB</code><br />
<code>           X509v3 Key Usage: critical</code><br />
<code>               Certificate Sign, CRL Sign</code><br />
<code>           X509v3 Basic Constraints: critical</code><br />
<code>               CA:TRUE</code><br />
<code>   Signature Algorithm: sha384WithRSAEncryption</code><br />
<code>        5c:d4:7c:0d:cf:f7:01:7d:41:99:65:0c:73:c5:52:9f:cb:f8:</code><br />
<code>        ...</code></p></td>
<td><p>"USERTrust RSA Certification Authority"</p></td>
</tr>
<tr class="even">
<td><p>0xB</p></td>
<td><p><code>Certificate:</code><br />
<code>   Data:</code><br />
<code>       Version: 3 (0x2)</code><br />
<code>       Serial Number:</code><br />
<code>           02:ac:5c:26:6a:0b:40:9b:8f:0b:79:f2:ae:46:25:77</code><br />
<code>   Signature Algorithm: sha1WithRSAEncryption</code><br />
<code>       Issuer: C=US, O=DigiCert Inc, OU=www.digicert.com, CN=DigiCert High Assurance EV Root CA</code><br />
<code>       Validity</code><br />
<code>           Not Before: Nov 10 00:00:00 2006 GMT</code><br />
<code>           Not After : Nov 10 00:00:00 2031 GMT</code><br />
<code>       Subject: C=US, O=DigiCert Inc, OU=www.digicert.com, CN=DigiCert High Assurance EV Root CA</code><br />
<code>       Subject Public Key Info:</code><br />
<code>           Public Key Algorithm: rsaEncryption</code><br />
<code>               Public-Key: (2048 bit)</code><br />
<code>               Modulus:</code><br />
<code>                   00:c6:cc:e5:73:e6:fb:d4:bb:e5:2d:2d:32:a6:df:</code><br />
<code>                   ...</code><br />
<code>               Exponent: 65537 (0x10001)</code><br />
<code>       X509v3 extensions:</code><br />
<code>           X509v3 Key Usage: critical</code><br />
<code>               Digital Signature, Certificate Sign, CRL Sign</code><br />
<code>           X509v3 Basic Constraints: critical</code><br />
<code>               CA:TRUE</code><br />
<code>           X509v3 Subject Key Identifier: </code><br />
<code>               B1:3E:C3:69:03:F8:BF:47:01:D4:98:26:1A:08:02:EF:63:64:2B:C3</code><br />
<code>           X509v3 Authority Key Identifier: </code><br />
<code>               keyid:B1:3E:C3:69:03:F8:BF:47:01:D4:98:26:1A:08:02:EF:63:64:2B:C3</code></p>
<p><code>   Signature Algorithm: sha1WithRSAEncryption</code><br />
<code>        1c:1a:06:97:dc:d7:9c:9f:3c:88:66:06:08:57:21:db:21:47:</code><br />
<code>        ...</code></p></td>
<td><p>"DigiCert High Assurance EV Root CA"</p></td>
</tr>
</tbody>
</table>

# Description

This adds the specified builtin root CA to the specified root-CA chain.
When it's not already loaded, the DER cert is loaded from SSL module
.data. Otherwise, already-loaded cert data is used for adding to the
RootCertChain.