view: orders {
sql_table_name: orders ;;
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }
  dimension: created_at_plus_8 {
    type: date_time
    sql: adddate(${TABLE}.created_at, interval 8 day) ;;
  }
  dimension_group: created_plus_8 {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_num
    ]
    sql: ${created_at_plus_8} ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: vintage {
    type: number
    sql:  datediff(curdate(), ${created_plus_8_date}) ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
  }
}
