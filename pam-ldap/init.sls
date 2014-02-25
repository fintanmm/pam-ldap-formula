{% from "pam_ldap/map.jinja" import pam_ldap with context %}

pam_ldap:
  pkg:
    - installed
    - name: {{ pam_ldap.pkg }}

