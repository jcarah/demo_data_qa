datagroup: sleep {
  sql_trigger: select  minute(now()) ;;
}
explore: sleep {}
view: sleep {
  derived_table: {
    indexes: ["foo"]
    datagroup_trigger: sleep
    sql: select sleep(100) foo ;;
  }


  dimension: foo {}
  dimension: sleepy {
    sql: sleep(100)  ;;
  }
}
