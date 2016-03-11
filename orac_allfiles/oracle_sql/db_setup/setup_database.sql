spool setup_database.log;

prompt>Creating users/schemas
start create_users

prompt>Creating AP tables
start create_ap_tables

prompt>Creating OM tables
start create_om_tables

prompt>Creating EX tables
start create_ex_tables

spool off;

exit;