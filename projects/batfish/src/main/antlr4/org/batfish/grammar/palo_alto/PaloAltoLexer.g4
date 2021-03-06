lexer grammar PaloAltoLexer;

options {
   superClass = 'org.batfish.grammar.BatfishLexer';
}

@members {
// Java code to end up in PaloAltoLexer.java goes here
}

// Keywords

ACTION
:
    'action'
;

ADMIN_DIST
:
    'admin-dist'
;

ALLOW
:
    'allow'
;

ANY
:
    'any'
;

APPLICATION
:
    'application'
;

AUTHENTICATION_TYPE
:
    'authentication-type'
;

AUTO
:
    'auto'
;

CLOSE_BRACKET
:
    ']'
;

COMMENT
:
    'comment'
;

CONFIG
:
    'config'
;

DENY
:
    'deny'
;

DESCRIPTION
:
    'description'
;

DESTINATION
:
    'destination'
;

DEVICES
:
    'devices'
;

DEVICECONFIG
:
    'deviceconfig'
;

DISABLED
:
    'disabled'
;

DNS
:
    'dns'
;

DNS_SETTING
:
    'dns-setting'
;

DOWN
:
    'down'
;

DROP
:
    'drop'
;

ETHERNET
:
    'ethernet'
;

FROM
:
    'from'
;

HOSTNAME
:
    'hostname'
;

ICMP
:
    'icmp'
;

INTERFACE
:
    'interface'
;

IP
:
    'ip'
;

IP_ADDRESS_LITERAL
:
    'ip-address'
;

LAYER3
:
    'layer3'
;

LINK_STATUS
:
    'link-status'
;

LOG_SETTINGS
:
    'log-settings'
;

MEMBERS
:
    'members'
;

METRIC
:
    'metric'
;

MTU
:
    'mtu'
;

NETWORK
:
    'network'
;

NEXTHOP
:
    'nexthop'
;

NO
:
    'no'
;

NTP_SERVER_ADDRESS
:
    'ntp-server-address'
;

NTP_SERVERS
:
    'ntp-servers'
;

OPEN_BRACKET
:
    '['
;

PORT
:
    'port'
;

PRIMARY
:
    'primary'
;

PRIMARY_NTP_SERVER
:
    'primary-ntp-server'
;

PROTOCOL
:
    'protocol'
;

RESET_BOTH
:
    'reset-both'
;

RESET_CLIENT
:
    'reset-client'
;

RESET_SERVER
:
    'reset-server'
;

ROUTING_TABLE
:
    'routing-table'
;

RULEBASE
:
    'rulebase'
;

RULES
:
    'rules'
;

SCTP
:
    'sctp'
;

SECONDARY
:
    'secondary'
;

SECONDARY_NTP_SERVER
:
    'secondary-ntp-server'
;

SECURITY
:
    'security'
;

SERVER
:
    'server'
;

SERVERS
:
    'servers'
;

SERVICE
:
    'service'
;

SERVICE_GROUP
:
    'service-group'
;

SET
:
    'set'
;

SHARED
:
    'shared'
;

SOURCE
:
    'source'
;

SOURCE_PORT
:
    'source-port'
;

STATIC_ROUTE
:
    'static-route'
;

SYSLOG
:
    'syslog'
;

SYSTEM
:
    'system'
;

TAG
:
    'tag'
;

TO
:
    'to'
;

TCP
:
    'tcp'
;

UDP
:
    'udp'
;

UNITS
:
    'units'
;

UP
:
    'up'
;

VIRTUAL_ROUTER
:
    'virtual-router'
;

YES
:
    'yes'
;

VSYS
:
    'vsys'
;

ZONE
:
    'zone'
;

// Complex tokens

COMMA
:
    ','
;

DEC
:
    F_Digit+
;

DOUBLE_QUOTED_STRING
:
    '"' ~'"'* '"'
;

IP_ADDRESS
:
    F_IpAddress
;

IP_PREFIX
:
    F_IpAddress '/' F_PrefixLength
;

IP_RANGE
:
    F_IpAddress '-' F_IpAddress
;

LINE_COMMENT
:
    (
        '#'
        | '!'
    )
    F_NonNewlineChar* F_Newline+ -> channel ( HIDDEN )
;

NEWLINE
:
    F_Newline+
;

SINGLE_QUOTED_STRING
:
    '\'' ~'\''* '\''
;

VARIABLE
:
    F_Variable_VarChar+
;

WS
:
    F_Whitespace+ -> channel(HIDDEN) // parser never sees tokens on hidden channel
;

// Fragments

fragment
F_DecByte
:
    (
        F_Digit
        | F_DecByteTwoDigit
        | F_DecByteThreeDigit
    )
;

fragment
F_DecByteThreeDigit
:
    (
        ([1] F_Digit F_Digit)
        | ([2] [0-4] F_Digit)
        | ([2] [5] [0-5])
    )
;

fragment
F_DecByteTwoDigit
:
    [1-9] F_Digit
;

fragment
F_Digit
:
    [0-9]
;

fragment
F_IpAddress
:
    F_DecByte '.' F_DecByte '.' F_DecByte '.' F_DecByte
;

fragment
F_Newline
:
    [\r\n] // carriage return or line feed
;

fragment
F_PrefixLength
:
    (
        F_Digit
        | [12] F_Digit
        | [3] [012]
    )
;

fragment
F_NonNewlineChar
:
    ~[\r\n] // carriage return or line feed
;

fragment
F_Whitespace
:
    [ \t\u000C] // tab or space or unicode 0x000C
;

fragment
F_Variable_VarChar
:
    ~[ \t\n\r;,{}[\]&|()"']
;

// Modes
// Blank for now, not all lexers will require modes
