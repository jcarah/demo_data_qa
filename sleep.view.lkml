datagroup: sb_test {
  sql_trigger: select floor(minute(now())/5) ;;
}
explore: sleep {persist_with:sb_test}
view: sleep {
  derived_table: {
    indexes: ["foo"]
    datagroup_trigger: sb_test
    sql: select sleep(100) foo ;;
  }


  dimension: foo {}
  dimension: sleepy {
    sql: sleep(100)  ;;
  }
}
