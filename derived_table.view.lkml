view: derived_table {
  derived_table: {
    sql: select 1 as one ;;
    persist_for: "0 seconds"
  }

  dimension:  one {}
}

explore: derived_table {}
