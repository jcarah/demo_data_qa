explore: sleep {}
view: sleep {
  derived_table: {
    sql: select sleep(500) foo ;;
  }
  dimension: foo {}
  }
