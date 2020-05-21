# view: incremental_table {
#   derived_table: {
#     sql: select * from orders where date(created_at) = '2020-05-19' ;;
#   }
# }
#
# view: derived_table_test {
# # derived_table: {
# #   sql: select * from orders ;;
# # }
#   derived_table: {
#     create_process: {
#       sql_step: create table ${SQL_TABLE_NAME} from
#       ;;
#     }
#   }
#
# dimension: id {}
# }

# view: dynamic_table {
#   sql_table_name: {% if orders.created_date._in_query %}
#   orders {% else %}
#   ${derived_table_test.SQL_TABLE_NAME}
#   {% endif %} ;;
#   dimension: id {}
# }
#
# explore: dynamic_table {}
