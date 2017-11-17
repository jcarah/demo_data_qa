connection: "thelook"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project
include: "base_model.model.lkml"

explore: order_items_open {
  extends: [order_items]
}
