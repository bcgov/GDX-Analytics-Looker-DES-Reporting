view: limesurvey_analytics {
  sql_table_name: microservice.limesurvey ;;

  dimension_group: date {
    type: time
    timeframes: [date, day_of_month, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.date ;;
  }


  dimension: sid {
    type: number
    sql: ${TABLE}.sid ;;
  }


  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }


  dimension_group: expires {
    type: time
    timeframes: [date, day_of_month, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.expires ;;
  }


  dimension_group: startdate {
    type: time
    timeframes: [date, day_of_month, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.startdate ;;
  }


  dimension_group: datecreated {
    type: time
    timeframes: [date, day_of_month, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.datecreated ;;
  }


  dimension: survey_total {
    type: number
    sql: ${TABLE}.survey_total ;;
  }


  dimension: survey_completed {
    type: number
    sql: ${TABLE}.survey_completed ;;
  }


  dimension: survey_uncompleted {
    type: number
    sql: ${TABLE}.survey_uncompleted ;;
  }


  dimension_group: survey_first_complete_date {
    type: time
    timeframes: [date, day_of_month, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.survey_first_complete_date ;;
  }


  dimension_group: survey_last_complete_date {
    type: time
    timeframes: [date, day_of_month, week, month, month_name, quarter, fiscal_quarter, year]
    sql: ${TABLE}.survey_last_complete_date ;;
  }

  measure: count {
    type: count
  }

  measure: survey_total_sum {
    type: sum
    sql: ${survey_total} ;;
  }
  measure: survey_completed_sum {
    type:  sum
    sql: ${survey_completed} ;;
  }
  measure:  survey_uncompleted_sum {
    type: sum
    sql:  ${survey_uncompleted} ;;
  }

}
