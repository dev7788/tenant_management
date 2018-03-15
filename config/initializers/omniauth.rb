# CERTIFICATE =<<CERTIFICATE
# -----BEGIN CERTIFICATE-----
# MIIEXjCCA0agAwIBAgIJAJn9mL+nXi4LMA0GCSqGSIb3DQEBBQUAMHwxCzAJBgNV
# BAYTAlVTMQswCQYDVQQIEwJUWDEYMBYGA1UEBxMPQ29sbGVnZSBTdGF0aW9uMSEw
# HwYDVQQKExhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQxIzAhBgkqhkiG9w0BCQEW
# FGFzYW5vLnJlaXpvQG1haWwuY29tMB4XDTE4MDMxMzAyMDIyNFoXDTI4MDMxMjAy
# MDIyNVowfDELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAlRYMRgwFgYDVQQHEw9Db2xs
# ZWdlIFN0YXRpb24xITAfBgNVBAoTGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDEj
# MCEGCSqGSIb3DQEJARYUYXNhbm8ucmVpem9AbWFpbC5jb20wggEiMA0GCSqGSIb3
# DQEBAQUAA4IBDwAwggEKAoIBAQCTvCF/pJZDkL1CJwh7i8or0KzJ5fRxcI+lIxQq
# HyfbKJoJtTPi/UBFJHqIi+NJq8QFBIWkI5EO29HS08NaurOfymaWmYuLqIv+GlmC
# iL5mzlOd/SSOzhvuNVZh9g2FpUVguTndXVYV73nq+lL2DrFLls79v0Gi5ERUfwIE
# A13OtDllbd9vPSsLEVo/dSKq0I99KcGHqAjxGVcZLcI5tiazSix4Mt1/gbjXyusJ
# Cyk4R9zglCYAXZ7x7ICHZ1xz+LvrWkXMAvnMezCfuOJjX6YdolgxvxrwO0HpKIUd
# FAkdr+KhZffbB9/lcojsox93fue1wbLulblbqynu19AsoFRfAgMBAAGjgeIwgd8w
# HQYDVR0OBBYEFEbu9pHC4QL7Xu9y33v8rvBPqmk3MIGvBgNVHSMEgacwgaSAFEbu
# 9pHC4QL7Xu9y33v8rvBPqmk3oYGApH4wfDELMAkGA1UEBhMCVVMxCzAJBgNVBAgT
# AlRYMRgwFgYDVQQHEw9Db2xsZWdlIFN0YXRpb24xITAfBgNVBAoTGEludGVybmV0
# IFdpZGdpdHMgUHR5IEx0ZDEjMCEGCSqGSIb3DQEJARYUYXNhbm8ucmVpem9AbWFp
# bC5jb22CCQCZ/Zi/p14uCzAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUAA4IB
# AQBYGoVPD0kzzDCfhTESmKug6dXziibtF0pB528FqZLsIpyQgzAfCidZEcv+qY9j
# pcKnXtZMj4DAZKQrB4mRmlCeZMb6ocKZTWsg1oLNieU2jYmxfB+Vq8npQkfIh0NX
# scJozcYvWPQoQDr4lpT+0sbLopRBK76CLUF6UGEZ6Au9ZaY5GAQJaSXejBW0I3jA
# mY8s/TzocGktUgqhC4s00JmGksm6Swv8l/BHQkcvS7uSGExev8Xvm3BjEpMJ6Xra
# v/4mcoftaZWNUxmgITq0nGevjfATvxv0o7TesGlheSxWraKCSn0ahZWJROw1NDwT
# gnHi6aQDHEsR0MivQZWysSQN
# -----END CERTIFICATE-----
# CERTIFICATE
#
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           # :assertion_consumer_service_url => "http://lvh.me:3000/users/auth/saml/callback",
           :issuer                         => "http://lvh.me:3000/saml/metadata",
           :idp_sso_target_url             => "http://localhost/saml2/idp/SSOService.php",
           # :idp_cert                       => CERTIFICATE,
           :idp_cert_fingerprint => '79:BB:A9:65:C1:97:74:78:9F:14:F8:AA:B3:A1:61:12:45:3D:3E:DE'
end
