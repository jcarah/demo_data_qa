connection: "thelook"



# include all the views
include: "/views/*.view"
aggregate_awareness: yes

datagroup: daily_rebuild_datagroup {
  sql_trigger:  select current_date() ;;
}
datagroup: daily_rebuild_datagroup_2 {
  sql_trigger:  select current_date() ;;
}
# include all the dashboards
# include: "/dashboards/*.dashboard"

access_grant: secret {
  allowed_values: ["New York"]
  user_attribute: state
}
test: test_test {
  explore_source: order_items {
    column: revenue {}
    filters: {
      field: orders.created_year
      value: "2019"
    }
  }
  assert: revenue_is_what_we_think_it_should_be_in_2019{
    expression: round(${order_items.revenue},2) = 1431500.71;;
    }
}

explore: order_items {
  aggregate_table: rollup__orders_created_date {
    query: {
      dimensions: [orders.created_date]
      measures: [count, cumulative_revenue, profit, revenue]
      timezone: "America/New_York"
    }

    materialization: {
      persist_for: "12 hours"
    }
  }
  from: order_items
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    fields: [inventory_items.cost]
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;

    relationship: many_to_one
  }
  join: user_facts {
    sql_on: ${users.id} = ${user_facts.user_id} ;;
    relationship: one_to_one
  }
}

explore: users {
  hidden: no
}

explore: users_clean {
  extends: [users]
  view_name: users
  fields: [users.country, users.age]
}

explore: pbl_demo {
  from: users
  access_filter: {
    field: state
    user_attribute: state
  }
}
