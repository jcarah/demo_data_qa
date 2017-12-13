view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: returned_sort {
    type: date_time
    sql: case when ${TABLE}.returned_at is null
            then '1970-01-01 00:00:00'
            else returned_at end ;;
    hidden: yes
  }
  dimension: returned {
    type: date_time
    order_by_field: returned_sort
    sql: ${TABLE}.returned_at ;;
  }
  dimension_group: returned_1 {
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
    sql: ${order_items.returned} ;;

  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;

  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }
}
