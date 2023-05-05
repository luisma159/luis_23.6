view: sql_runner_query1 {
  derived_table: {
    sql: SELECT
          order_items.id  AS `order_items.id`,
          order_items.inventory_item_id  AS `order_items.inventory_item_id`,
          COUNT(*) AS `order_items.count`
      FROM demo_db.order_items  AS order_items
      GROUP BY
          1,
          2
      ORDER BY
          COUNT(*) DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_id {
    type: number
    sql: ${TABLE}.`order_items.id` ;;
  }

  dimension: order_items_inventory_item_id {
    type: number
    sql: ${TABLE}.`order_items.inventory_item_id` ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.`order_items.count` ;;
  }

  set: detail {
    fields: [order_items_id, order_items_inventory_item_id, order_items_count]
  }
}
