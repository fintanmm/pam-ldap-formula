{% from "pam-ldap/map.jinja" import pam_ldap with context %}

tls_cacertfile:
    file.managed:
        - source: salt://
        - user: root
        - group: root
        - mode: 640

pam_ldap:
    pkg:
        - installed
        - name: {{ pam_ldap.pkg }}

{{ pam_ldap.config }}:
   file.managed:
        - source: salt://pam_ldap/files/ldap.conf
        - user: user
        - group: user
        - mode: 644
        - template: jinja
        - defaults:
            host: {{ salt['pillar.get']('pam:ldap:host') }}
            port: {{ salt['pillar.get']('pam:ldap:port', 389) }}
            base: {{ salt['pillar.get']('pam:ldap:base') }}
            version: {{ salt['pillar.get']('pam:ldap:version', 3) }}
            policy: {{ salt['pillar.get']('pam:ldap:policy') }}
            binddn: {{ salt['pillar.get']('pam:ldap:binddn') }}
            bindpw: {{ salt['pillar.get']('pam:ldap:bindpw') }}
            scope: {{ salt['pillar.get']('pam:ldap:scope', 'sub') }}
            pam_groupdn: {{ salt['pillar.get']('pam:ldap:pam_groupdn') }}
            pam_member_attribute: {{ salt['pillar.get']('pam:ldap:pam_member_attribute') }}
            pam_password: {{ salt['pillar.get']('pam:ldap:pam_password') }}
            ssl: {{ salt['pillar.get']('pam:ldap:ssl') }}
            tls_checkpeer: {{ salt['pillar.get']('pam:ldap:tls_checkpeer', 'no') }}
            tls_cacertfile: {{ salt['pillar.get']('pam:ldap:tls_cacertfile', '') }}
            tls_cacertdir: {{ salt['pillar.get']('pam:ldap:tls_cacertdir', '') }}
