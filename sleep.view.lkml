explore: sleep {}
view: sleep {
  derived_table: {
    indexes: ["foo"]
    sql_trigger_value: select  minute(now())  ;;
    sql: select sleep(100) foo ;;
  }
  dimension: foo {}
  dimension: sleep {
    sql: sleep(100)  ;;
  }
  }
