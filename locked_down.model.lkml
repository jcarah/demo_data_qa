connection: "thelook"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project
include: "base_model.model.lkml"

explore: order_items_locked_down {
  extends: [order_items]
  fields: [ALL_FIELDS*
          ,-users.email
          ,-users.first_name
          ,-users.last_name]

}
